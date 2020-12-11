package indra;
import java.awt.print.Book;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Absentees_table_dao {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public Absentees_table_dao(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(
                    jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public List<Absentees_table> listselDates(String date1,String date2,String date3) throws SQLException {
        List<Absentees_table> listBook = new ArrayList<>();

        String sql = "SELECT * FROM absentees WHERE absence_date=\""+date1+"\" OR absence_date=\""+date2+"\" OR absence_date=\""+date3+"\"";
        System.out.println(sql);
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String rollno = resultSet.getString("rollno");
            String absence_date = resultSet.getString("absence_date");
            String class_year = resultSet.getString("class");
            String name = resultSet.getString("name");
            String faculty = resultSet.getString("faculty");
            int no_of_hrs = Integer.parseInt(resultSet.getString("no_of_hrs"));

            System.out.println(name+faculty+String.valueOf(no_of_hrs)+class_year+absence_date+rollno+id);

            Absentees_table absentees_table = new Absentees_table(id,rollno,name,absence_date,class_year,faculty,no_of_hrs);
            listBook.add(absentees_table);
        }

        resultSet.close();
        statement.close();

        disconnect();
        return listBook;
    }

    public List<Absentees_table> listspecDates(String date1) throws SQLException {
        List<Absentees_table> listBook = new ArrayList<>();

        String sql = "SELECT * FROM absentees WHERE absence_date=\""+date1+"\"";
        System.out.println(sql);
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String rollno = resultSet.getString("rollno");
            String absence_date = resultSet.getString("absence_date");
            String class_year = resultSet.getString("class");
            String name = resultSet.getString("name");
            String faculty = resultSet.getString("faculty");
            int no_of_hrs = Integer.parseInt(resultSet.getString("no_of_hrs"));

            System.out.println(name+faculty+String.valueOf(no_of_hrs)+class_year+absence_date+rollno+id);

            Absentees_table absentees_table = new Absentees_table(id,rollno,name,absence_date,class_year,faculty,no_of_hrs);
            listBook.add(absentees_table);
        }

        resultSet.close();
        statement.close();

        disconnect();
        return listBook;
    }
    public List<Absentees_table> listAllDates() throws SQLException {
        List<Absentees_table> listBook = new ArrayList<>();

        String sql = "SELECT * FROM absentees";

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String rollno = resultSet.getString("rollno");
            String absence_date = resultSet.getString("absence_date");
            String class_year = resultSet.getString("class");
            String name = resultSet.getString("name");
            String faculty = resultSet.getString("faculty");
            int no_of_hrs = Integer.parseInt(resultSet.getString("no_of_hrs"));

            System.out.println(name+faculty+String.valueOf(no_of_hrs)+class_year+absence_date+rollno+id);

            Absentees_table absentees_table = new Absentees_table(id,rollno,name,absence_date,class_year,faculty,no_of_hrs);
            listBook.add(absentees_table);
        }

        resultSet.close();
        statement.close();

        disconnect();
        return listBook;
    }


    public Absentees_table getDetails(String id) throws SQLException {
        Absentees_table absentees_table = null;
        String sql = "SELECT * FROM absentees WHERE id = ?";

        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, id);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String rollno = resultSet.getString("rollno");
            String absence_date = resultSet.getString("absence_date");
            String class_year = resultSet.getString("class");
            String name = resultSet.getString("name");
            String faculty = resultSet.getString("faculty");
            int no_of_hrs = Integer.parseInt(resultSet.getString("no_of_hrs"));


             absentees_table = new Absentees_table(id,rollno,name,absence_date,class_year,faculty,no_of_hrs);
        }

        resultSet.close();
        statement.close();

        return absentees_table;
    }


}
