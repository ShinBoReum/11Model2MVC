<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">

	function fncGetPurchaseList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
	
	$(function(){
		$(".ct_list_pop td:nth-child(3)").on("click",function(){
			//$( this ).text("서버 업데이트중....");	
			var userId= $(this).data("param");
			console.log(userId);
			
			self.location="/user/getUser?userId="+userId
		});
		$(".ct_list_pop td:nth-child(5)").on("click",function(){
			//$( this ).text("서버 업데이트중....");	
			var tranNo= $(this).data("param");
			//console.log(tranNo);
			
			self.location="/purchase/getPurchase?tranNo="+tranNo
		});
		
		$(".ct_list_pop td:nth-child(9)").on("click",function(){
			//$( this ).text("서버 업데이트중....");	
			var tranCode= $(this).data("param").trim();
			var prodNo= $(this).data("param2");
			console.log("dkdkdk"+tranCode+"dhddhd");
			if(tranCode=='2'){
				self.location="/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=3&page=${resultPage.currentPage}"
			}
		});
	});
	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">
<input type="hidden" id="currentPage" name="currentPage" value=""/>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문상품</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">구매일</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
	<c:set var="i" value="${ i+1 }" />
	<%-- 
	<% 	
		for(int i=0; i<list.size(); i++) {
		Purchase vo = (Purchase)list.get(i);
	%>
	--%>
	
	<tr class="ct_list_pop">
		<td align="center">
			${i}
		</td>
		<td></td>
		<td align="left" data-param="${purchase.buyer.userId}">
		<%-- 
			<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
			 --%>
		${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left" data-param="${purchase.tranNo}">
		<%-- 
		<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.prodName.prodName}</a>
		 --%>
		${purchase.prodName.prodName}
		</td>
		<td></td>
		<td align="left">${purchase.orderDate}</td>
		<td></td>
		<td align="left" data-param="${purchase.tranCode}" data-param2="${purchase.purchaseProd.prodNo}">
		<c:if test="${fn:trim(purchase.tranCode)=='1'}">
			배송대기중입니다.
		</c:if>
		<c:if test="${fn:trim(purchase.tranCode)=='2'}">
			배송중 입니다.<br/>
			-구매확정-
			<%-- 
			<a href="/purchase/updateTranCodeByProd?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3&page=${resultPage.currentPage}">물건도착</a>
		 --%>
		
		</c:if>
		<c:if test="${fn:trim(purchase.tranCode)=='3'}">
			배송완료
		</c:if>
		<c:if test="${fn:trim(purchase.tranCode)=='4'}">
			구매완료
		</c:if>
		
		</td>
		<td></td>
		<td align="left">
			
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<jsp:include page="../common/pageNavigator.jsp">	
				<jsp:param value="Purchase" name="type"/>
		</jsp:include>
		</td>
	</tr>
</table>
</form>

</div>

</body>
</html>