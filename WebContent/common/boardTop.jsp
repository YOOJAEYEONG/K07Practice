<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<div class="row">		
	<div class="col-12">			 
		<!-- 
			.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger, .bg-secondary, 
			.bg-dark, .bg-light
		-->
		<nav class="navbar navbar-expand-sm bg-light navbar-dark">
			<!-- Brand/logo -->
			<a class="navbar-brand" href="#">
				<img src="http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg" 
					style="width:150px;">
			</a>
			
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link text-dark" 
						href="../08Board1/BoardList.jsp">자유게시판</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-dark" href="#">자료실</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-dark" href="#">방명록</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle text-dark" href="#" 
						id="navbardrop" data-toggle="dropdown">
						Menu
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item text-dark" href="#">SubMenu 1</a>
						<a class="dropdown-item text-dark" href="#">SubMenu 2</a>
						<a class="dropdown-item text-dark" href="#">SubMenu 3</a>
					</div>
				</li>
			</ul>
			<div class="ml-4">
			<% if(session.getAttribute("USER_ID")!=null) {
				
				BbsDAO dao = new BbsDAO(application);
				BbsDTO dto = new BbsDTO();
				dto.setName(session.getAttribute("USER_NAME").toString());
			
			%>
				<span><%=dto.getName() %>님 로그인하셨습니다.</span>
			<% } %>
			</div>
			<ul class="navbar-nav ml-auto" >
			<% if(session.getAttribute("USER_ID")==null) { %>
				<li class="nav-item"><!-- 회원가입  -->
					<a class="nav-link text-dark" href="#">
						<i class='fas fa-edit'style='font-size:20px'></i>회원가입
					</a>
				</li>
				<li class="nav-item"><!-- 로그인 -->
					<a class="nav-link text-dark" href="../06Session/Login.jsp">
						<i class='fas fa-sign-in-alt' style='font-size:20px'></i>로그인
					</a>
				</li>
			<% } else { %>
				<li class="nav-item"><!-- 회원정보수정-->
					<a class="nav-link text-dark" href="#">
						<i class='fa fa-cogs' style='font-size:20px'></i>회원정보수정
					</a>
				</li>
				
				<li class="nav-item"><!-- 로그아웃-->
					<a class="nav-link text-dark" href="../06Session/Logout.jsp">
						<i class='fas fa-sign-out-alt' style='font-size:20px'></i>로그아웃
					</a>
				</li>
			<% } %>
			</ul>
		</nav>
	</div>
</div>
	
	
	
	
	
	
	
	
	