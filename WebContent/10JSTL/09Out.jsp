<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09Out</title>
</head>
<body>

	<h3>OUT TAG	</h3>
	<c:set var="htmlStr">
		<h5>h3태그로 감싼 문자열</h5>
	</c:set>

	<h3>escapeXml = ture일때 (기본값)</h3>
	<c:out value="${htmlStr }" />

	<h3>escapeXml = false일때 </h3>
	<c:out value="${htmlStr }" escapeXml="false"/>
	
	\${htmlStr } : ${htmlStr }
	
	<hr />
	<h3>default 속성</h3>
	<h4>값이 빈 문자열 : 값이 있는 경우에 해당</h4>
	출력: <c:out value="" default="값이 null일땐 디폴트값" />
	
	<h4>값이 null 문자열 : 값이 있는 경우에 해당</h4>
	출력: <c:out value="<%=null %>" default="값이 null일땐 디폴트값" />
	<br>
	출력: <c:out value="${null }" default="값이 null일땐 디폴트값" />
	

	<h3>페이지 링크에 응용하기</h3>
	<c:url var="board" 
		value="/08Board2/BoardList.jsp?nowPage="/>
<br>
	<a href="${board }<c:out value='${null }' default='1'/>">게시판 바로가기</a>
























</body>
</html>