import java.util.*;
import java.sql.*;
public class LeaveDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
     
    public LeaveDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
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
            System.out.print("Connected");
        }
    }
     
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
     
    public boolean insertLeave(Leave leave) throws SQLException {
        String sql = "INSERT INTO request (applied_from, applied_till, type, purpose, status) VALUES (?, ?, ?, ?, ?)";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, leave.getApplied_from());
        statement.setString(2, leave.getApplied_till());
        statement.setString(3, leave.getType());
        statement.setString(4, leave.getPurpose());
        statement.setString(5, leave.getStatus());
         
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
    
    public List<Leave> listAllLeaves() throws SQLException {
        List<Leave> listLeave = new ArrayList<>();
         
        String sql = "SELECT * FROM request WHERE status = 'Pending' ";
        //System.out.println(sql);
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        int rc=0;
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String applied_from = resultSet.getString("applied_from");
            String applied_till = resultSet.getString("applied_till");
            String type = resultSet.getString("type");
            String purpose = resultSet.getString("purpose");
            String status = resultSet.getString("status");
             rc++;
            Leave leave = new Leave(id, applied_from, applied_till, type, purpose, status);
            listLeave.add(leave);
        }
        //System.out.println(rc);
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listLeave;
    }
    
    public List<Leave> listLeaves() throws SQLException {
        List<Leave> listLeave = new ArrayList<>();
         
        String sql = "SELECT * FROM request";
        //System.out.println(sql);
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        int rc=0;
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String applied_from = resultSet.getString("applied_from");
            String applied_till = resultSet.getString("applied_till");
            String type = resultSet.getString("type");
            String purpose = resultSet.getString("purpose");
            String status = resultSet.getString("status");
             rc++;
            Leave leave = new Leave(id, applied_from, applied_till, type, purpose, status);
            listLeave.add(leave);
        }
        //System.out.println(rc);
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listLeave;
    }
    
    public List<Leave> listAllLeaves(String userid) throws SQLException {
        List<Leave> listLeave = new ArrayList<>();
         
        String sql = "SELECT * FROM request where user_id = '"+userid+"'";
        //System.out.println(sql);
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        int rc=0;
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String applied_from = resultSet.getString("applied_from");
            String applied_till = resultSet.getString("applied_till");
            String type = resultSet.getString("type");
            String purpose = resultSet.getString("purpose");
            String status = resultSet.getString("status");
             rc++;
            Leave leave = new Leave(id, applied_from, applied_till, type, purpose, status);
            listLeave.add(leave);
        }
        //System.out.println(rc);
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listLeave;
    }
     
    public boolean deleteLeave(Leave leave, String userid) throws SQLException {
        String sql = "DELETE FROM request where id = ? AND user_id = '"+userid+"'";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, leave.getId());
         
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;     
    }
     
    public boolean updateLeave(Leave leave) throws SQLException {
        String sql = "UPDATE request SET status = ?";
        sql += " WHERE id = ?";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
//        statement.setString(1, leave.getApplied_from());
//        statement.setString(2, leave.getApplied_till());
//        statement.setString(3, leave.getType());
//        statement.setString(4, leave.getPurpose());
        statement.setString(1, leave.getStatus());
        statement.setInt(2, leave.getId());
         
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        System.out.println("Working");
        disconnect();
        return rowUpdated;     
    }
     
    public Leave getLeave(int id, int userid) throws SQLException {
        Leave leave = null;
        String sql = "SELECT * FROM request WHERE id = ? AND user_id = '"+userid+"'";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);
         
        ResultSet resultSet = statement.executeQuery();
         
        if (resultSet.next()) {
        	String applied_from = resultSet.getString("applied_from");
            String applied_till = resultSet.getString("applied_till");
            String type = resultSet.getString("type");
            String purpose = resultSet.getString("purpose");
            String status = resultSet.getString("status");
             
            leave = new Leave(id, applied_from, applied_till, type, purpose, status);
        }
         
        resultSet.close();
        statement.close();
         
        return leave;
    }
}