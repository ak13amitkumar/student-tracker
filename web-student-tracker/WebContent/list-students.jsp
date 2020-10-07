<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!Doctype html>
<html>

<head>
<title>Student Tracker App</title>

<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>

	


	<div id="wrapper">
		<div id="header">
			<h2>Indian University</h2>
		
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		
		<!-- Add new button -->
		<input type="button" value="Add Student" 
		       onclick="window.location.href='add-student-form.jsp'; return false;"
		       class="add-student-button" />
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<c:forEach var="temp" items="${STUDENT_LIST }">
					
					<!-- Set up a link for each student -->
					<c:url var="tempLink" value="StudentControllerServlet">
						<c:param name="command" value="LOAD"/>
						<c:param name="studentId" value="${temp.id }"/>
					</c:url>
					
					<!-- Set up a link to delete student -->
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="studentId" value="${temp.id }" />
					</c:url>
					
					<tr>
						<td>${temp.firstName }</td>
						<td>${temp.lastName }</td>
						<td>${temp.email }</td>
						<td>
							
							<a href="${tempLink }">Update</a>
							|
							<a href="${deleteLink }"
							   onclick="if(!(confirm('Are you sure?'))) return false">
							Delete</a>
							
						</td>
					</tr>
					
				</c:forEach>
			</table>
		
		</div>
	</div>
</body>

</html>