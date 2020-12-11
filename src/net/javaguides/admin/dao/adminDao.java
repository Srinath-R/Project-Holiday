package net.javaguides.admin.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.javaguides.admin.model.aadmin;

public class adminDao {
	
	public int registeradmin(aadmin admin) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO admin" +
            "  (username,firstname,lastname,contact,email, password,dob,college_ID,Profession) VALUES " +
            " (? ,?, ?, ?, ?, ?, ?, ?, ?);";
//        root@127.0.0.1:3307
        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");
//        jdbc:mysql://127.0.0.1:3307/?user=root

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://127.0.0.1:3306/ncp", "root", "admin");
        	//.getConnection("jdbc:mysql://127.0.0.1:3307/?user=root");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            //preparedStatement.setInt(1, 1);
            //System.out.println(admin.getCollegeid());
        	preparedStatement.setString(1, admin.getusername());
            preparedStatement.setString(2, admin.getFirstname());
            preparedStatement.setString(3, admin.getLastname());
            preparedStatement.setString(4, admin.getContact());
            preparedStatement.setString(5, admin.getEmail());
            preparedStatement.setString(6, admin.getPassword());
            //preparedStatement.setString(7, admin.getConfirmpassword());
            preparedStatement.setString(7, admin.getDob());
            preparedStatement.setString(8,admin.getCollegeid());
            preparedStatement.setString(9,admin.getProfession());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
	


