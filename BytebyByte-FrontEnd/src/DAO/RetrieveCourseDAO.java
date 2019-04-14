package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RetrieveCourseDAO {
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

	public List<String> readData() throws SQLException {
		Connection conn = createConnection();
		List<String> courseList = new ArrayList<String>();
		String selectSQL = "select courseid, coursename from courseList where isactive = 'Y'";
		PreparedStatement preparedStatement = conn.prepareStatement(selectSQL);
		ResultSet rs = preparedStatement.executeQuery(selectSQL );
		while (rs.next()) {
			String courseid = rs.getString("courseid");
			String coursename = rs.getString("coursename");
			courseList.add(courseid+","+coursename);
		}
		closeConnection(conn);
		return courseList;
	}
}
