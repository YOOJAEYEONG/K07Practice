<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Catch</title>
</head>
<body>
	<h2>catch태그</h2>
	
	<c:set var="fnum" value="100"/>
	<c:set var="snum" value="0"/>

	<c:catch var="errorMessage" >
		${"백"+100 }
	</c:catch>
	에러내용 출력 : ${errorMessage }
<br>
	<%
	out.print("1"+pageContext.getAttribute("errorMessage")+"<br>"); //출력됨
	out.print("2"+request.getAttribute("errorMessage")+"<br>");
	out.print("3"+session.getAttribute("errorMessage")+"<br>");
	out.print("4"+application.getAttribute("errorMessage")+"<br>");
	%>
























</body>
</html>