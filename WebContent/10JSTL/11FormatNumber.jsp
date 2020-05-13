<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11FormatNumber</title>
</head>
<body>

	<fmt:formatNumber value="999999999" type="currency" currencySymbol="$"/>
	<hr />
	<c:set var="money" value="100000"/>
	
	<h3>1. EL로 출력</h3>
	money : ${money }
	<h3>2. JSTL 국제화 태그로 출력</h3>
	money : <fmt:formatNumber value="${money }"/>
	<h3>3. JSTL 국제화 태그로 출력 - 천단위 콤마 생략</h3>
	money : <fmt:formatNumber value="${money }" groupingUsed="false" />
	<hr />
	<h3>4. type="currency" </h3>
	money : <fmt:formatNumber value="${money }" type="currency" />
	
	<h3>5. type= "percent"</h3>
	money : <fmt:formatNumber value="0.5" type="percent"/>


	<h3>6. var속성 : 원하는 위치에 출력하고 싶을대</h3>
	<fmt:formatNumber value="${money }" type="currency" var="price"/>
	
	가격이 <strike>15,000</strike>원 => <b>${price }</b>
	<hr />
	<h2>자바코드로 1000단위 콤마 표시하기</h2>
	
	<%
	String moneyStr = pageContext.getAttribute("money").toString();
	out.print(moneyStr);
	int money = Integer.parseInt(moneyStr);
	NumberFormat nf = NumberFormat.getInstance();
	%>
	
	
	<h3>천단위 콤마찍기전</h3>
	<%=money %>
	<h3>천단위 콤마찍기 후</h3>
	<%=nf.format(money) %>
	
	<h3>자바로 현재통화 기호 얻어오기 </h3>
	<%
	Currency currency = nf.getCurrency();
	String currencySymbol = currency.getSymbol();
	out.print(nf.format(money)+currencySymbol);
	%>
	<hr />
	1.<%=currency.getCurrencyCode() %><!--KRW-->	
	2.<%=currency.getDisplayName() %><!--대한민국 원-->	
	3.<%=currency.getSymbol() %><!--￦-->	
	
	
	
	
	
	
	
























</body>
</html>