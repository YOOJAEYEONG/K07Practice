<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUploadMain</title>
	<script>
		var isValidate = function(frm) {
			if(frm.file.value == null){
				return false;
			}
			return true;
		};
	
	</script>
</head>
<body>
	<h2>파일 업로드 폼(DB처리)</h2>
	<h3>파일업로드 1 원본파일명 그대로 업로드</h3>
	<h4 style="color: red; ">${errormessage }</h4>

	<a href="FileList.jsp">파일 목록 바로가기</a>
	
	<form action="UploadProc.jsp" method="post" name="filefrm" 
		onsubmit="return isValidata(this)" 
		enctype="multipart/form-data">
		
		첨부파일 : <input type="file" name="file"/>
		<input type="submit" value="upload"/>
	</form>
	
	<h2>파일업로드2</h2>
	<h3>파일업로드2-원본파일명 숫자로 변경후 업로드</h3>	
	<form action="UploadProc2.jsp" method="post" name="fileFrm2"
		onsubmit="return isValidate(this)"
		enctype="multipart/form-data">
	첨부파일1 :
	<input type="file" name="file" />
	<input type="submit" value="Upload" />
		
	</form>


























</body>
</html>