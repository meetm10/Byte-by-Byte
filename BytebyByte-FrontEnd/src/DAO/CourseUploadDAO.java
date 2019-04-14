package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CourseUploadDAO {
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
		String query = " insert into courseDetails(courseid, isactive, coursename,facultyname,email,year,detail)"
				+ " values (?,?,?,?,?)";
		PreparedStatement preparedStmt = conn.prepareStatement(query);
		preparedStmt.setString(1, data[0]);
		preparedStmt.setString(2, data[1]);
		preparedStmt.setString(3, data[2]);
		preparedStmt.setString(4, data[3]);
		preparedStmt.setString(5, data[4]);
		preparedStmt.execute();
		closeConnection(conn);
	}
}
