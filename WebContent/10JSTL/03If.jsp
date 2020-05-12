<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03If</title>
</head>
<body>
	<h2>c:if태그</h2>
	
	<c:set var="numVar" value="100" />
	<c:set var="strVar"  value="JAVA" />
	
	<c:if test="${numVar mod 2 eq 0 }" var="result">
		${numVar }는 짝수입니다. <br>
	</c:if>
	\${result } : ${result} <br>
	
	<h3>삼항식으로 표현</h3>
	${numVar } : ${numVar mod 2 == 0 ? "는 짝수" : "는 홀수" }
	
	<br>
	
	<c:if test="${'JAVA' eq '자바'}" var="r">
		${strVar }는 자바다
	</c:if>
	<c:if test="${!r }">
		${strVar }는 자바가 아니다
	</c:if>
	<br>



	<form >
		아이디 : <input type="text" name="user" />
		<br />
		패스워드 : <input type="text" name="pass" />
		<br />
		<input type="submit" value="로그인" />
	</form>	

	<c:if test="${not empty param.user }">
		전송된 아이디 : ${param.user } <br>
		전송된 비번 : ${param.pass } <br>
	</c:if>
	
	<c:if test="${not empty param.user }">
		<c:if test="${param.user=='kosmo' and param.pass=='1234' }"
			var = "dd">
			로그인성공
		</c:if>
		<c:if test="${!dd }">
			다시입력하세요
		</c:if>
		<br>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>



































