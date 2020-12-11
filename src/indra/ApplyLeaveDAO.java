package indra;
import java.util.*;
import java.sql.*;

public class ApplyLeaveDAO {
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;
	
	public ApplyLeaveDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}
	
	protected void connect() throws SQLException {
		if(jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}	catch(ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			System.out.print("Connected");
		}
	}
	
	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
	}
//	public int  getMaxId() throws SQLException {
//
//		String sql=" SELECT LAST_INSERT_ID();";
//		connect();
//		
//		Statement statement = jdbcConnection.createStatement();
//		ResultSet resultSet = statement.executeQuery(sql);
//		int id = 1;
//		while(resultSet.next()) {
//			 id+=1;
//		}
//		resultSet.close();
//		statement.close();
//		
//		disconnect();
//		return id;
//	}
	public boolean insertApplyLeave(ApplyLeave al) throws SQLException {
		String sql = "INSERT INTO request (id, applied_from, applied_till, type, purpose, status, user_id, faculty_name) VALUES(?, ?, ?, ?, ?, ?, ?,?)";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, al.getID());
		statement.setString(7, al.getCollegeId());
		statement.setString(2, al.getAppliedFrom());
		statement.setString(3, al.getAppliedTill());
		statement.setString(4, al.getLeaveType());
		statement.setString(5, al.getPurpose());
		statement.setString(6, "Pending");
		statement.setString(8, "V C");
		
		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowInserted;
	}
	
	public List<ApplyLeave> listAllLeaves() throws SQLException {
		List<ApplyLeave> listLeave = new ArrayList<>();
		
		String sql = "SELECT * FROM request";
		connect();
		
		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()) {
			int id = resultSet.getInt("id");
			String college_id = resultSet.getString("user_id");
			String applied_from = resultSet.getString("applied_from");
			String applied_till = resultSet.getString("applied_till");
			String type = resultSet.getString("type");
			String purpose = resultSet.getString("purpose");
			String status = resultSet.getString("status");
			String faculty=resultSet.getString("faculty_name");
			ApplyLeave leave = new ApplyLeave(id, college_id, applied_from, applied_till, type, purpose, status,faculty);
			listLeave.add(leave);
		}
		
		resultSet.close();
		statement.close();
		
		disconnect();
		return listLeave;
	}
	
	public boolean deleteLeave(ApplyLeave leave, int userid) throws SQLException {
        String sql = "DELETE FROM request where id = ? AND user_id = '"+userid+"'";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, leave.getID());
         
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;
    }
}
