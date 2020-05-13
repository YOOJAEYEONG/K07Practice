<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06Import</title>
</head>
<body>

	<h1>import TAG</h1>
	<c:set var="requestVar" value="리퀘스트영역" scope="request"></c:set>
	
	
	

	<h3>var속성 미지정</h3>
	
	<c:import url="/10JSTL/inc/ImportPage.jsp">
		<c:param name="user_id">KOSMO</c:param>
		<c:param name="user_pw" value="1234"></c:param>
	</c:import>
	
	
	<h3>var속성 지정 </h3>
	<c:import url="/10JSTL/inc/ImportPage.jsp" var="contents">
		<c:param name="user_id">Hong</c:param>
		<c:param name="user_pw" value="9874"/>
	</c:import>
	
	<h3>import선언은 위에서 삽입은 아래서처리</h3>
	${contents }
	
	
	<h3>외부(원격)에 있는 내용 삽입하기</h3>
	<iframe src="./inc/ImportNate.jsp" frameborder="1" style="width: 100%; height: 500px;"></iframe>
































</body>
</html>