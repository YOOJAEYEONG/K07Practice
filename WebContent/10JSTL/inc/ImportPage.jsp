<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8"); %>


<hr />
<h3>포함된 페이지</h3>
<h5>리퀘스트영역에 저장된 속성값</h5>
저장된 값(방법1) : ${requestVar}<br>
저장된 값(방법2) : ${requestScope.requestVar}




<h5>파라미터로 전달된 값</h5>
파라미터 1 : ${param.user_id}<br>
파라미터 2 : ${param.user_pw}<hr>