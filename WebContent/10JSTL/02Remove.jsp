<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
</head>
<body>

	<c:set var="pageVar">페이지영역</c:set>
	<c:set var="pageVar" scope="request">리퀘스트영역1번</c:set>
	<c:set var="requestVar" value="리퀘스트영역2번" scope="request"/>
	<c:set var="sessionVar" value="세션영역" scope="session"/>
	<c:set var="appVar" value="애플리케이션영역" scope="application"/>
	
	페이지: ${pageVar }<br>
	리퀘스트1 : ${requestScope.pageVar }<br>
	리퀘스트2 : ${requestVar }<br>
	세션: ${sessionVar }<br>
	앱 : ${appVar }<br>


	<c:remove var="requestVar" scope="session"/>
	
	<c:remove var="pageVar"/>
	
	
	
	페이지: ${pageVar }<br>
	리퀘스트1 : ${requestScope.pageVar }<br>
	리퀘스트2 : ${requestVar }<br>
	세션: ${sessionVar }<br>
	앱 : ${appVar }<br>




















































</body>
</html>