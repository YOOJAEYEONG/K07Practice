<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07Redirect</title>
</head>
<body>
	<c:set var="requestVar" value="리퀘스트영역 저장됨" scope="request"/>
	
	
	<h3>자바 코드로 리다이렉트</h3>
	
	<%
	 response.sendRedirect(request.getContextPath()+
			"/10JSTL/inc/ImportPage.jsp?"+
			"user_id="+URLEncoder.encode("KOREA한국", "UTF-8")+
			"&user_pw="+URLEncoder.encode("독일도", "UTF-8")); 
	%>
	<h4>JSTL로 리다이렉트</h4>
	
<%-- 	<c:redirect url="/10JSTL/inc/ImportPage.jsp">
		<c:param name="user_id"> 한국독도</c:param>
		<c:param name="user_pw" value="한글인코딩"></c:param>
	</c:redirect> --%>
	

		































</body>
</html>