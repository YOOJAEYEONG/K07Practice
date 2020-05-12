<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForEach</title>
</head>
<body>
	
<c:forEach begin="1" end="6" var="i">
	<h${i }> 난 h${i } 태그입니다. </h${i }>
</c:forEach>	
	
	
	
	

	<h3>varStatus속성 살펴보기</h3>
	
<c:forEach begin="3" end="5" var="i" varStatus="loop">
<h4>${loop.count }번째 반복입니다.</h4>
<ul>
	<li>index:${loop.index }</li>
	<li>first:${loop.first }</li>
	<li>last:${loop.last }</li>
	<li>current:${loop.current }</li>
	<li>count:${loop.count }</li>
</ul>
</c:forEach>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>