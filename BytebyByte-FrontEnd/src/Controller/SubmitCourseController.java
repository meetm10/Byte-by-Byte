package Controller;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.http.*;

import DAO.CourseRegisterDAO;

import javax.servlet.*;

public class SubmitCourseController extends HttpServlet {
  public void doPost (HttpServletRequest req,
                     HttpServletResponse res)
    throws ServletException, IOException
  {
	String ruid = req.getParameter("ruid");
	String netid = req.getParameter("netid");
	String courseList = req.getParameter("courselist");
	System.out.println(courseList);
	String data[] = {ruid,netid,courseList};
	CourseRegisterDAO courseRegisterDao = new CourseRegisterDAO();
	try {
		courseRegisterDao.writeData(data);
	} catch (SQLException e) {
		e.printStackTrace();
	}
  }
}