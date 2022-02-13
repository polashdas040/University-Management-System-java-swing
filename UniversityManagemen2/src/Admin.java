
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class Admin {

    public void AddAmin(char op, String UserName, String Password) {

        Connection con = MyConnection.getConnection();
        PreparedStatement ps;

        if (op == 'i') {
            try {
                ps = con.prepareStatement("INSERT INTO user(user_name, password) VALUES (?,?)");
                ps.setString(1, UserName);
                ps.setString(2, Password);

                if (ps.executeUpdate() > 0) {
                    JOptionPane.showMessageDialog(null, "New Admin Added Successfully");
                }

            } catch (SQLException ex) {
                Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
