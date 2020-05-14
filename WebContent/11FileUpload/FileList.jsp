<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%
String saveDirectory = application.getRealPath("/Upload");

File file = new File(saveDirectory);
File[] filelist = file.listFiles();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList</title>
</head>
<body>
	<h2>업로드된 파일 리스트 보기(디렉토리 읽어오기)</h2>
<%

for(File f : filelist) {
%>
	<li>
		파일명 : <%=f.getName() %>&emsp;
		파일크기 : <%=(int)f.length()/1024 %>kb&emsp;
		<a href="Download1.jsp?fileName=<%=
				URLEncoder.encode(f.getName(), "UTF-8")%>">다운로드</a>
	</li>
<%
}
%>






















</body>
</html>