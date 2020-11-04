package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;


import Entities.Note;
import Helper.FactoryProvider;

public class DeleteServlet extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session s=FactoryProvider.getFactory().openSession();
			Note note=(Note)s.get(Note.class, noteId);
			
			response.sendRedirect("allNotes.jsp");
			
			Transaction tx=s.beginTransaction();
			s.delete(note);
			tx.commit();
			s.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

}
