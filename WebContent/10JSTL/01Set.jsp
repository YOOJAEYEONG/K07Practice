<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01Set</title>
</head>
<body>
	<c:set var="directVar" value="100"/>
	<c:set var="elVar" value="${directVar div 5}"/>
	<c:set var="expVar" value="<%=new Date() %>"/>
	<c:set var="betweenVar">변수값 요렇게 설정</c:set>
	
	<h2>표현식으로 출력</h2>
	<li>directVar : <%=pageContext.getAttribute("directVar") %></li>
	<li>elVar:<%=pageContext.getAttribute("elVar") %></li>
	<li>expVar:<%=pageContext.getAttribute("expVar") %></li>
	<li>betweenVar:<%=pageContext.getAttribute("betweenVar") %></li>
	
	<h2>EL로 출력</h2>
	<li>directVar : ${pageScope.directVar }</li>
	<li>elVar: ${elVar }</li>
	<li>expVar:${expVar }</li>
	<li>betweenVar:${betweenVar }</li>
	
	
	<c:set var="argsMember" 
		value='<%=new MemberDTO("Kim", "1111","김태희",null) %>' 
		scope="request"/>
	
	<h3>JSP코드로 출력</h3>
	id => <%=((MemberDTO)request.getAttribute("argsMember")).getId() %>
	<br>
	NAME=> <%=((MemberDTO)request.getAttribute("argsMember")).getName() %>
	
	
	<h3>EL로 출력</h3>
	ID=>${requestScope.argsMember.id }
	<br>
	NAME=>${argsMember.name }
	
	<c:set var="defaultMember" value="<%=new MemberDTO() %>" scope="request"/>
	<c:set target="${defaultMember }" property="id" value="Jung"/>
	<c:set target="${defaultMember }" property="pass" value="9999"/>		
	<c:set target="${defaultMember }" property="name" value="정지훈"/>
	
	
	<h3>target 및 property속성으로 설정 후 출력</h3>
	
	id:${requestScope.defaultMember.id }
	name:${defaultMember.name }
	 
	
	
		<h2>List컬렉션 이용하기</h2>
	<%
	List list = new Vector();
	list.add(request.getAttribute("defaultMember"));
	list.add(request.getAttribute("argsMember"));
	%>
	
	<c:set var="list" value="<%=list %>" scope="request"/>
	
	<h4>target 및 property속성으로 <u>미</u> 설정 후 출력</h4>
	
	아이디:${requestScope.list[0].id } <br/>
	비번:${list[0].pass } <br/>
	이름:${list[0].name } <br/>
	
	
	<h4>2단계:target 및 property속성으로 속성값 변경</h4>
	
	<c:set target="${list[0] }" property="id" value="BTS" />
	<c:set target="${list[0] }" property="pass" value="5555" />
	<c:set target="${list[0] }" property="name" value="방탄" />
	
	
	<h4>target 및 property속성으로 설정 후 출력</h4>
	
	ID : ${list[0].id } <br>
	pw : ${list[0].pass } <br>
	name: ${list[0].name } <br>
	
	
	
	
	
	
	
</body>
</html>



























