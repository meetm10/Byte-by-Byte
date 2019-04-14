package Controller;


import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.*;

import DAO.RetrieveCourseDAO;

import javax.servlet.*;

public class RetrieveCourseController extends HttpServlet {
  public void doPost (HttpServletRequest req,
                     HttpServletResponse res)
    throws ServletException, IOException
  {
	RetrieveCourseDAO retrieveCourseDao = new RetrieveCourseDAO();
	try {
		List<String> courseList = retrieveCourseDao.readData();
		String courseJson = "{";
		for (int i=0; i<courseList.size();i++)
		{
			courseJson = courseJson +"\""+courseList.get(i).split(",")[0]+"\""+":\""+courseList.get(i).split(",")[1]+"\"";
			if(i!=courseList.size()-1)
			{
				courseJson = courseJson + ",";
			}
		}
		courseJson = courseJson + "}";
		res.setContentType("application/text");
	    PrintWriter out = res.getWriter();
	    out.println(courseJson) ; 
	    out.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
  }
}