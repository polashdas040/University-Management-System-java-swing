
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Teacher {

    public void TeacherUpdate(char op, Integer id, String Name, String Gender,
            String bDate, String Dept, String phone, String address) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;

        if (op == 'i') {
            try {
                ps = con.prepareStatement("INSERT INTO teacher(name, gender, date, dept, phone, address) VALUES (?,?,?,?,?,?)");
                ps.setString(1, Name);
                ps.setString(2, Gender);
                ps.setString(3, bDate);
                ps.setString(4, Dept);
                ps.setString(5, phone);
                ps.setString(6, address);

                if (ps.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "New Teacher Added Successfully");
                }

            } catch (SQLException ex) {
                Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (op == 'u') {
            try {
                ps = con.prepareStatement("UPDATE teacher SET name = ? , gender = ? , date = ? , dept = ? , phone = ?, address = ? WHERE  id  = ?");
                ps.setString(1, Name);
                ps.setString(2, Gender);
                ps.setString(3, bDate);
                ps.setString(4, Dept);
                ps.setString(5, phone);
                ps.setString(6, address);
                ps.setInt(7, id);
                if (ps.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Teacher Data Update");

                }

            } catch (SQLException ex) {
                Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (op == 'd') {
            int YesOrNo = JOptionPane.showConfirmDialog(null, "The Attendance will be also deleted", "Delete Teacher", JOptionPane.OK_CANCEL_OPTION, 0);
            if (YesOrNo == JOptionPane.OK_OPTION) {
                try {
                    ps = con.prepareStatement("DELETE FROM  teacher  WHERE  id = ?");

                    ps.setInt(1, id);
                    if (ps.executeUpdate() > 0) {
                        JOptionPane.showMessageDialog(null, "Teacher Deleted");
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void TeacherTable(JTable table, String valueToSearch) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("SELECT * FROM teacher WHERE CONCAT (name, dept, phone, address)LIKE ?");
            ps.setString(1, "%" + valueToSearch + "%");

            ResultSet rs = ps.executeQuery();
            DefaultTableModel model = (DefaultTableModel) table.getModel();

            Object[] row;

            while (rs.next()) {
                row = new Object[7];
                row[0] = rs.getInt(1);
                row[1] = rs.getString(2);
                row[2] = rs.getString(3);
                row[3] = rs.getString(4);
                row[4] = rs.getString(5);
                row[5] = rs.getString(6);
                row[6] = rs.getString(7);

                model.addRow(row);

            }

        } catch (SQLException ex) {
            Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
