
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class TeaAttendance {

    public void AttenUpdate(char op, Integer Sid, String TN, String Dept, String Adate, String Atten) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;

        if (op == 'i') {
            try {
                ps = con.prepareStatement("INSERT INTO teachers_attendance (id, name, dept, date, attendance) VALUES (?,?,?,?,?)");
                ps.setInt(1, Sid);
                ps.setString(2, TN);
                ps.setString(3, Dept);
                ps.setString(4, Adate);
                ps.setString(5, Atten);
                if (ps.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Attendance Added");
                }

            } catch (SQLException ex) {
                Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void AttendanceTableTeacher(JTable table) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("SELECT * FROM teachers_attendance");

            ResultSet rs = ps.executeQuery();
            DefaultTableModel model = (DefaultTableModel) table.getModel();

            Object[] row;

            while (rs.next()) {
                row = new Object[5];
                row[0] = rs.getInt(1);
                row[1] = rs.getString(2);
                row[2] = rs.getString(3);
                row[3] = rs.getString(4);
                row[4] = rs.getString(5);

                model.addRow(row);

            }

        } catch (SQLException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
