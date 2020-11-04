package Servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Entities.Note;
import Helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String title=request.getParameter("note-title");
			String content=request.getParameter("note-content");
			
			int noteId=Integer.parseInt(request.getParameter("noteId").trim());
			
			
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			Note note=(Note)session.get(Note.class, noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			
			tx.commit();
			
			session.close();
			response.sendRedirect("allNotes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
