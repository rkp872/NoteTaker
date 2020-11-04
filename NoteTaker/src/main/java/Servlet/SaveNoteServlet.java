package Servlet;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.Transaction;

import Entities.Note;
import Helper.FactoryProvider;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	{
		try 
		{
			String title=request.getParameter("note-title");
			String content=request.getParameter("note-content");
			
			Note note=new Note(title,content,new Date());
			
			//Hibernate Save
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.save(note);
			
			tx.commit();
			
			session.close();
			
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			out.print("<h1 style='text-align : center;'>Note is added sucessfully</h1>");
			out.print("<h1 style='text-align : center;'><a href='allNotes.jsp'>View all notes</a></h1>");
		} 
		catch (Exception e) 
		{	
			e.printStackTrace();
		}
	}
}
