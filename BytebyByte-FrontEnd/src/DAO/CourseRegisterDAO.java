package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CourseRegisterDAO {
	public Connection createConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
			return con;
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public void closeConnection(Connection con) throws SQLException {
		con.close();
	}

	public void writeData(String[] data) throws SQLException {
		Connection conn = createConnection();
		String[] courses  = data[2].split(",");
		for (int i=0; i<courses.length;i++)
		{
		String query = " insert into courseRegistered (ruid,netid,courselist)"
				+ " values (?, ?, ?)";
		PreparedStatement preparedStmt = conn.prepareStatement(query);
		preparedStmt.setString(1, data[0]);
		preparedStmt.setString(2, data[1]);
		preparedStmt.setString(3, courses[i]);
		preparedStmt.execute();
		}
		closeConnection(conn);
	}
}
