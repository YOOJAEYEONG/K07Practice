<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
request.setCharacterEncoding("UTF-8");
//1
String saveDirectory = application.getRealPath("/Upload");

//2
int maxPostSize = 1024*5000;

//3
String encoding = "UTF-8";

//4
FileRenamePolicy policy = new DefaultFileRenamePolicy();


MultipartRequest mr = null;

try{
	mr = new MultipartRequest(
			request, saveDirectory, maxPostSize, encoding, policy);
	
}catch(Exception e ){
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일업로드오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadProc</title>
</head>
<body>
	<h2>파일 업로드 결과</h2>
	<h5>첨부파일</h5>
	원본파일명 : <%=mr.getOriginalFileName("file") %><br>
	서버에 저장된 파일명 : <%=mr.getFilesystemName("file") %><br>
	파일크기 : <%=(int)mr.getFile("file").length()/1024 %>Kb<br>
	이미지표현 : <img src="../Upload/<%=mr.getFilesystemName("file") %>"  /><br>






























</body>
</html>