
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Course {

    public void CourseUpdate(char op, Integer id, String label, Integer hours) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;

        if (op == 'i') {
            try {
                ps = con.prepareStatement("INSERT INTO course(label, hours) VALUES (?,?)");
                ps.setString(1, label);
                ps.setInt(2, hours);

                if (ps.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "New Course Added Successfully");
                }

            } catch (SQLException ex) {
                Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (op == 'u') {
            try {
                ps = con.prepareStatement("UPDATE course SET label = ?, hours =? WHERE id = ?");
                ps.setString(1, label);
                ps.setInt(2, hours);
                ps.setInt(3, id);
                if (ps.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "Course Data Updated");
                }

            } catch (SQLException ex) {
                Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (op == 'd') {
            int YesOrNo = JOptionPane.showConfirmDialog(null, "The Score will be also deleted", "Delete Course", JOptionPane.OK_CANCEL_OPTION, 0);

            if (YesOrNo == JOptionPane.OK_OPTION) {
                try {
                    ps = con.prepareStatement("DELETE FROM course WHERE id = ?");

                    ps.setInt(1, id);
                    if (ps.executeUpdate() > 0) {
                        JOptionPane.showMessageDialog(null, "Course Deleted");
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

    public boolean isCourseExist(String coursename) {

        boolean isExist = false;
        Connection con = MyConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("SELECT * FROM course WHERE label = ?");
            ps.setString(1, coursename);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                isExist = true;

            }

        } catch (SQLException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isExist;
    }

    public void courseTable(JTable table) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("SELECT * FROM course");

            ResultSet rs = ps.executeQuery();
            DefaultTableModel model = (DefaultTableModel) table.getModel();

            Object[] row;

            while (rs.next()) {
                row = new Object[3];
                row[0] = rs.getInt(1);
                row[1] = rs.getString(2);
                row[2] = rs.getInt(3);

                model.addRow(row);

            }

        } catch (SQLException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getCourseId(String courseLabel) {

        int courseId = 0;

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("SELECT * FROM course WHERE label = ?");
            ps.setString(1, courseLabel);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                courseId = rs.getInt("id");

            }

        } catch (SQLException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courseId;
    }

    public void courseTablecombo(JComboBox combobox) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;
        try {
            ps = con.prepareStatement("SELECT * FROM course");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                combobox.addItem(rs.getString(2));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
