<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@ page import="com.model2.mvc.service.domain.*" %>


<%
	Purchase vo=(Purchase)request.getAttribute("purchase");
%>

<%
	String menu = request.getParameter("menu");
%>
--%>


<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView" method="post">

다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<td>${purchase.buyer.userId}</td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>
		<c:if test="${purchase.paymentOption=='1'}">
			현금구매
		</c:if>
		<c:if test="${purchase.paymentOption !='1'}">
			카드구매
		</c:if>
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>받는이</td>
		<td>${purchase.receiverName}</td>
		<td></td>
	</tr>
	<tr>
		<td>받는이연락처</td>
		<td>${purchase.receiverPhone}</td>
		<td></td>
	</tr>
	<tr>
		<td>받는이주소</td>
		<td>${purchase.divyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>
		<td>${purchase.divyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<td>${purchase.divyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>