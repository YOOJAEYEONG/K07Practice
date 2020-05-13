<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08Url</title>
</head>
<body>

<h3>var속성 미지정</h3>
<c:url value="/10JSTL/inc/ImportPage.jsp">
	<c:param name="user_id" value="Gasan"/>
	<c:param name="user_pw" value="Digitla"/>
</c:url>


<h3>var 속성 지정</h3>
<c:url value="/10JSTL/inc/ImportPage.jsp" var="url">
	<c:param name="user_id">World</c:param>
	<c:param name="user_pw">메르디앙2차</c:param>
</c:url>

<h3>varㅅ혹성 지정후 원하는 위치에 url설정</h3>
<a href="${url } ">ImportPage GO</a>


<h3>HTML태그에 직접JSTL로 절대경로 지정하기</h3>
<a href="<c:url value="/10JSTL/inc/ImportPage.jsp?user_id=LEE&user_pw=8888"/>">Import gooooooooo</a>

























</body>
</html>