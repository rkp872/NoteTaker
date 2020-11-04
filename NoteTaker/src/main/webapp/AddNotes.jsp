<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>NoteTaker | AddNotes</title>
<%@include file="AllJs.jsp"%>
</head>
<body>
	<div class=container-fluid>
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container-fluid">
		<h1>Please fill the details below-</h1>
		<!-- Form -->
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input name="note-title"
					type="text" class="form-control" id="title"
					placeholder="Enter title " required>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="note-content" required id="content"
					placeholder="Enter your contents" class="form-control"
					style="height: 300px"></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>


</body>
</html>