package Controller;


import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.*;

import DAO.CourseUploadDAO;

import javax.servlet.*;

public class InsertCourseDetailsController extends HttpServlet {
  public void doPost (HttpServletRequest req,
                     HttpServletResponse res)
    throws ServletException, IOException
  {
//	  String coursename = req.getParameter("coursename");
//		String facultyname = req.getParameter("facultyname");
//		String email = req.getParameter("email");
//		String year = req.getParameter("year");
//		String detail = req.getParameter("detail");
//		String data[] = {coursename,facultyname,email,year,detail};
//		CourseUploadDAO courseUploadDao = new CourseUploadDAO();
//		try {
//			courseUploadDao.writeData(data);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	  return;
  }
}