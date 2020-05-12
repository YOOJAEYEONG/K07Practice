<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForEachExtend</title>
</head>
<body>
<h3>확장 for문의형태의 forEach태그</h3>
<%
String[] colors = {"red","green", "blue", "brown"};
%>
	
	
	<h3>JSP코드로 배열 출력</h3>
	
<%for(String color : colors){ %>
	<h4 style="color: <%=color %>">JSP코드로 출력</h4>
<%} %>
	
	
	
<h3>JSTL 및 EL로 배열 출력</h3>
	
<c:set var="colors" value="<%=colors %>" />	

<c:forEach items="${colors }" var="color">
	<h4 style="color: ${color };">JSTL로 출력</h4>
</c:forEach>
	
	
	
	<h3>맵계열 컬렉션 사용</h3>
	
	<%
	
	
	List<MemberDTO> lists = new Vector<MemberDTO>();
	lists.add(new MemberDTO("Hong", "1111", "홍씨", null));
	lists.add(new MemberDTO("Park", "2222", "박씨", null));
	lists.add(new MemberDTO("Sung", "3333", "성씨", null));
	
	
	
	Map maps = new HashMap();
	maps.put("a", lists.get(0));
	maps.put(22, lists.get(1));
	maps.put("c", lists.get(2));
	%>
	
	
	<c:set var="maps" value="<%=maps %>" />
	
	<h4>키값을 알고있을때 : EL변수, 키값 혹은 EL변수 ["키값"]</h4>
	
	
	아이디 : ${maps['a']['id'] } <br>
	비번 : ${maps['a']['pass'] } <br>
	이름 : ${maps.a.name } <br>
	<br>
	아이디 : ${maps.['22']['id'] } <br>
	비번 : ${maps[22]['pass'] } <br>
	이름 : ${maps[22]['name'] } <br>
	<br>
	아이디 : ${maps['c'].id } <br>
	비번 : ${maps['c'].pass } <br>
	이름 : ${maps['c'].name } <br>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>