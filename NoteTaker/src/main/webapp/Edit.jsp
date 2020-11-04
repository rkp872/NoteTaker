<%@page import="Helper.FactoryProvider"%>
<%@page import="Entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>NoteTaker | Edit</title>
		<%@include file="AllJs.jsp"%>
	</head>
	<body>
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container-fluid">
		<%
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session s=FactoryProvider.getFactory().openSession();
			Note note=(Note)s.get(Note.class, noteId);
			
		%>
		
		<!-- Form -->
		<form action="UpdateServlet" method="post">
			<input type="hidden" value=<%=note.getId() %> name="noteId">
		
			<div class="form-group">
				<label for="title">Note Title</label> <input name="note-title"
					type="text" class="form-control" id="title"
					placeholder="Enter title " required
					value="<%=note.getTitle() %>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="note-content" required id="content"
					placeholder="Enter your contents" class="form-control"
					style="height: 300px" ><%=note.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</form>
	</div>
	</body>
</html>