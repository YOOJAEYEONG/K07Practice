<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04ChooseWhenOtherwise</title>
</head>
<body>

	<h3>choose~when~otherwise</h3>
	<c:set var="numVar">101</c:set>
	<c:set var="strVar" value="자바" />
	
	<c:choose>
		<c:when test="${numVar / 2 == 0}">
			${numVar }는 짝수입니다.
		</c:when>
		<c:otherwise>
			${numVar }는 홀수입니다.
		</c:otherwise>
	
	</c:choose>



<h3>국영수 점수를 입력받아 평균점수로 학점 출력</h3>
<h4>점수를 입력하세요</h4>

<form >
	국어:<input type="text" name="kor" /><br>
	영어:<input type="text" name="eng" /><br>
	수학:<input type="text" name="math" /><br>
	<input type="submit" value="학점구하기" />
</form>



<!-- value가 String타입으로 계산되는경우  -->
<c:if test="${not empty param.kor }">
	<c:set var="avg">${(param.kor+param.eng+param.math)/3 }</c:set>
	<c:choose>
		<c:when test="${avg ge '90'}">A학점</c:when>
		<c:when test="${avg ge '80'}">B학점</c:when>
		<c:when test="${avg ge '70'}">C학점</c:when>
		<c:when test="${avg ge '60'}">D학점</c:when>
		<c:otherwise>F학점</c:otherwise>
	</c:choose>
</c:if>

<!-- value가 long타입으로 계산되는경우  -->
<c:if test="${not empty param.kor }">
	<c:set var="avg" value="${(param.kor+param.eng+param.math)/3 }"/>
	<c:choose>
		<c:when test="${avg ge 90}">A학점</c:when>
		<c:when test="${avg ge 80}">B학점</c:when>
		<c:when test="${avg ge 70}">C학점</c:when>
		<c:when test="${avg ge 60}">D학점</c:when>
		<c:otherwise>F학점</c:otherwise>
	</c:choose>
</c:if>










































</body>
</html>