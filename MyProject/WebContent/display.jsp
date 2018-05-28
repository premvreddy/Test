<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	UserName:
	<input type="text" style="height: 24px; width: 200px;">
	<br> FirstName:
	<input type="text" style="height: 24px; width: 200px;">
	<br> MiddleName:
	<input type="text" style="height: 24px; width: 200px;">
	<br> LastName:
	<input type="text" style="height: 24px; width: 200px;">
	<br> Active:
	<input type="checkbox">
	<br>
	<br><input type="button" id="userButtonnone" value="Add New" />
	<%@include file="display1.jsp"%>
	<input type="button" id="" value="search" />
	
	<input type="button" id="" value="clear" />
	
</body>
</html>