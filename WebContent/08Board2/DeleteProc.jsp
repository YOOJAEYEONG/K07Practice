<%@page import="Util.JavascriptUtil"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@include file="../common/isLogin.jsp" %>


<%
System.out.println("DeleteProc.jsp진입");
String num = request.getParameter("num");

BbsDTO dto = new BbsDTO();
BbsDAO dao = new BbsDAO(application);

dto = dao.selectView(num);

String session_id = 
	session.getAttribute("USER_ID").toString();

int affected = 0;

if(session_id.equals(dto.getId())){
	dto.setNum(num);
	affected = dao.delete(dto);
} else {
	JavascriptUtil.jsAlertBack("본인만 사용가능합니다.", out);
	return;
}

if(affected==1){
	JavascriptUtil.jsAlertLocation("삭제되었습", "BoardList.jsp", out);
} else {
	out.print("삭제실패하였습니다");
}


%>