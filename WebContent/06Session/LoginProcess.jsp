<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

MemberDAO dao = new MemberDAO(drv, url);

/*
//방법1
boolean isMember = dao.isMember(id, pw);
if(isMember==true){
	session.setAttribute("USER_ID", id);
	session.setAttribute("USER_PW", pw);
	
	response.sendRedirect("Login.jsp");
} else {
	request.setAttribute("ERROR_MSG", "회원이 아니다");
	RequestDispatcher reDis = request.getRequestDispatcher("Login.jsp");
	reDis.forward(request, response);
}

//방법2
MemberDTO memberDTO = dao.getMemberDTO(id, pw); 
if(memberDTO.getId() != null) {
	session.setAttribute("USER_ID", memberDTO.getId());
	session.setAttribute("USER_PW", memberDTO.getPass());
	session.setAttribute("USER_NAME", memberDTO.getName());
	
	response.sendRedirect("Login.jsp");
} else {
	request.setAttribute("ERROR_MSG", "넌 회원이 아니");
	request.getRequestDispatcher("Login.jsp")
		.forward(request, response);
}
*/







Map<String, String> memberInfo = dao.getMemberMap(id, pw);

if(memberInfo.get("id") !=null){
	session.setAttribute("USER_ID", memberInfo.get("id"));
	session.setAttribute("USER_PW", memberInfo.get("pw"));
	session.setAttribute("USER_NAME", memberInfo.get("name"));
	
	response.sendRedirect("Login.jsp");
} else {
	request.setAttribute("ERROR_MSG", "너는 회원이 아닙니다.");
	request.getRequestDispatcher("Login.jsp")
		.forward(request, response);
}


%>