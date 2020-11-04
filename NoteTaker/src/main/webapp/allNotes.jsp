<%@page import="Entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>NoteTaker | AllNotes</title>
<%@include file="AllJs.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container-fluid">
		<h1>All Notes</h1>
		<div class="row">
			<div class="col-12" >
				<%
					Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note note : list) {
				%>
				<div class="card mt-3">
					 <img src="img/pencil.png" style="max-width:100px;" class="card-img-top m-4">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text"><%=note.getContent() %></p>
						<p ><b><%=note.getAddedDate() %></b></p>
						<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="Edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Edit</a>
					</div>
				</div>


				<%
					}
				s.close();
				
				%>
			</div>
		</div>

	</div>

</body>
</html>