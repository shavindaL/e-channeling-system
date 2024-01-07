<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover">
	<c:forEach var = "hos" items="${hospitalDet}">
		
			<thead>
				<tr>
					<th>Name</th>
					<th>Location</th>
					<th>Phone Number</th>
					<th>User Name</th>
					<th>Password</th>
				</tr>
			</thead>
	
	
		${hos.hospitalId}
		${hos.name}
		${hos.location}
		${hos.phoneNo}
		${hos.username}
		${hos.password}
	</c:forEach>
	</table>
	
</body>
</html>