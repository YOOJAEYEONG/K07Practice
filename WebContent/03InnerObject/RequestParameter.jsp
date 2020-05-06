<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	if( !(name==null || name.equals("")) ){
		out.print("이름:" + name);
	}
	else {
		out.print("<script>"
				+"	alert('이름을 입력하세요')"
				+"	history.back();"
				+"</script>");
	}
	String[] sexArr = request.getParameterValues("sex");
	String sexStr = null;
	if(sexArr != null) sexStr = sexArr[0];
	
	String[] favo = request.getParameterValues("favorite");
	String favStr = "";
	if(favo != null)
		for(int i=0; i<favo.length ; i++)
			if(i==favo.length-1)
				favStr += favo[i];
			else favStr += favo[i] +",";
	String self_intro = 
			request.getParameter("self_intro")
				.replace("\r\n", "<br>");
	
	%>
	<ul>
		<li>이름: <%=name %></li>
		<li>id: <%=id %></li>
		<li>gender:<%=sexStr %></li>
		<li>favorite:<%=favStr %></li>
		<li>intro:<%=self_intro %></li>
	
	</ul>
	<%
	Enumeration names = request.getParameterNames();
	
	while(names.hasMoreElements()){
		String paramName = (String)names.nextElement();
		System.out.print("파라미터명:"+paramName);
		
		if(paramName.equals("sex")||paramName.equals("favorite")){
			System.out.println("getParameterValues()로 읽기");
			out.println("파라미터용 getParameterValues()로"
					+"얻어서 값 출력함<br>");
		}
		else {
			System.out.println("getParameter()로 읽기");
			out.println("파라미터명을 메소드로 얻어서 출력");
			out.println(request.getParameter(paramName)+"<br>");
		}
	}
	
	
	
	%>
</body>
</html>
























