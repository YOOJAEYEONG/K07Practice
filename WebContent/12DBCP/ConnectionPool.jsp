<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Context initCtx = new InitialContext();
Context ctx = (Context)initCtx.lookup("java:comp/env");
DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
Connection con = source.getConnection();


String conStr = "";
if(con!=null)	conStr = "<h2>DBCP연결성공</h2>";
else   conStr = "<h2>DBCP연결실패</h2>";
out.print(conStr);
%>


<%--  
[server.xml의 GlobalNamingResources 태그안에 다음과 같이 설정한다.]
<!-- Global JNDI resources
       Documentation at /docs/jndi-resources-howto.html
  -->
  <GlobalNamingResources>
    <!-- Editable user database that can also be used by
         UserDatabaseRealm to authenticate users
    -->
    <Resource auth="Container" driverClassName="oracle.jdbc.OracleDriver" maxActive="20" maxIdle="10" maxWait="-1" name="jdbc/myoracle" password="1234" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:orcl" username="kosmo"/>
	
	
  </GlobalNamingResources>
--%>


























