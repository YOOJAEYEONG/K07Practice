<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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


File oldFile = null;
File newFile = null;
String realFileName = null;
try{
	mr = new MultipartRequest(
			request, saveDirectory, maxPostSize, encoding, policy);
	
	String fileName = mr.getFilesystemName("file");
	String nowTime = 
			new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
	int idx = -1;
	idx = fileName.lastIndexOf(".");
	realFileName = nowTime+fileName.substring(idx, fileName.length());
	oldFile = new File(saveDirectory+File.separator+fileName);
	newFile = new File(saveDirectory+File.separator+realFileName);
	
	oldFile.renameTo(newFile);
	
}catch(Exception e ){
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일업로드오류");
	request.getRequestDispatcher("FileUploadMain.jsp")
		.forward(request, response);
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
	서버에 저장된 파일명(변경전) : <%=mr.getFilesystemName("file") %><br>
	서버에 저장된 파일명(변경후) : <%=realFileName %><br>
	파일크기 : <%=(int)newFile.length()/1024 %>Kb<br>
	이미지표현 : <img src="../Upload/<%=realFileName %>"  /><br>

	<a href="FileList.jsp">파일목록바로가기</a>




























</body>
</html>