import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBCInsertUpdate {

    public static void main(String[] args) {

        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentdb",
                    "root",
                    "password");

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO students(id,name) VALUES(?,?)");

            ps.setInt(1, 101);
            ps.setString(2, "Sahil");

            ps.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement(
                    "UPDATE students SET name=? WHERE id=?");

            ps2.setString(1, "Sahil G");
            ps2.setInt(2, 101);

            ps2.executeUpdate();

            System.out.println("Insert and Update Successful");

            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}