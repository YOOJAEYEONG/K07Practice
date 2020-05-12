<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieMain.jsp</title>
</head>
<body>
	<h2>쿠키(Cookie)</h2>
	<%
	Cookie cookie = new Cookie("USER_ID", "KOSMO");
	System.out.println("request.getContextPath():"+
		request.getContextPath());
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(3600);
	response.addCookie(cookie);
	
	%>
	<h3>쿠키 설정</h3>
	
	<h2>쿠키를 설정하는 현제페이지에서 쿠키값 확인하기</h2>	
	<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie c : cookies){
			String cookiename = c.getName();
			String cookieValue = c.getValue();
			out.print(
					String.format(
							"%s : %s <br>",
							cookiename, cookieValue));
		}
	}
	%>
	
	<h2>페이지 이동후 쿠키값 확인하기</h2>
	<a href="01CookieResult.jsp"> 
		쿠키값 다음페이지에서 확인하기
	</a>
</body>
</html>