<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionMain</title>
</head>
<body>

	<h2>세션 유지시간 session내장객체로 설정하기</h2>
	<%session.setMaxInactiveInterval(60*10); %>
	
	
	<h2>세션 유지시간 확인하기</h2>
	<%=session.getMaxInactiveInterval()+"<br>" %>
	
	<h2>세션 아이디 확인하기</h2>
	<%=session.getId()+"<br>" %>
	
	<h2>세션의 생성시간/마지막 요청시간</h2>
	<%
	long createTime = session.getCreationTime();
	out.print(createTime+"<br>");
	
	SimpleDateFormat sp = new SimpleDateFormat("HH:mm:ss");
	String creationTime = sp.format(createTime);
	out.print(creationTime+"<br>");
	
	
	long lastTime = session.getLastAccessedTime();
	out.print(sp.format(lastTime)+"<br>");
	
	
	%>



















</body>
</html>