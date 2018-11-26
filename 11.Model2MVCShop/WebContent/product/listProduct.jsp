<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>

<html lang="ko">

<head>

	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>상품 목록조회</title>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	 <!-- Bootstrap Dropdown Hover JS -->
   	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<!-- jQuery UI toolTip 사용 JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
		function fncGetProductList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
		   	$("#currentPage").val(currentPage)
			//document.detailForm.submit();
		   	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
		$(function() {
			 
			//==> 검색 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
			 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				fncGetProductList(1);
			});
			
			$( ".ct_list_pop td:nth-child(7)" ).on("click" , function() {
				var prodNo= $(this).data("param");
				var tranCode= $(this).data("param2");
				//var role= ${role};
				
				if(${role=='user'}){
					if(tranCode==0){
						/* self.location ="/product/getProduct?prodNo="+prodNo */
						$.ajax( 
								{
									url : "/product/json/getProduct/"+prodNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
	
										//Debug...
										//alert(status);
										//Debug...
										//alert("JSONData : \n"+JSONData);
										
										var displayValue = "<h3>"
																	+"상품명 : "+JSONData.prodName+"<br/>"
																
																	+"</h3>";
										//Debug...									
										//alert(displayValue);
										$("h3").remove();
										$( "#"+prodNo+"" ).html(displayValue);
									}
							});		
					}else{
						$( this ).css("color" , "gray")
						$( this ).text("재고가 없습니다.");
					}
					
						
				}else{
					if(tranCode==0){
						self.location ="/product/updateProductView?prodNo="+prodNo+"&menu=admin"
					}else{
						$( this ).css("color" , "gray")
						alert("판매된상품은 수정불가입니다.");
					}
					
				}
	
			});
				
				//$(".ct_list_pop td:nth-child(11)").css("background-color" , "red");
				//self.location ="/product/getProduct?prodNo="+prodNo+"&menu=${role}";	
				///* 
				$( ".ct_list_pop td:nth-child(11)" ).on("click" , function() {
					var prodNo= $(this).data("param1");
					var tranCode= $(this).data("param2").trim();
					
					if(tranCode==1){
						self.location ="/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=2";
					}
					else if(tranCode==3){
						self.location ="/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=4";
					}
					
						
						//self.location ="/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=2";
						
						//self.location ="/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=4";
	
				}); 
			
				//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
				$( ".ct_list_pop td:nth-child(5)" ).css("color" , "skyblue");
				$("h7").css("color" , "red");
				
				
				//==> 아래와 같이 정의한 이유는 ??
				//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
				$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
				//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
				//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
				//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
				//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
				//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
				//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
				//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
			});	
		
		
		
	</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header text-info">
	       <h3>회원목록조회</h3>
	    </div>
	
	
	
	
	

<div style="width:98%; margin-left:10px;">
<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
<form name="detailForm" action="/product/listProduct?menu=${role}" method="post">
////////////////////////////////////////////////////////////////////////////////////////////////// -->
<form name="detailForm">

<input type="hidden" id="currentPage" name="currentPage" value=""/>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<c:if test="${ role=='admin'}">
						상품 관리
					</c:if>
					
					<c:if test="${ role=='user'}">
						상품목록조회
					</c:if>
				
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
		
			<td align="right">
				<input onclick="fncGetProductList('1')" type="checkbox" name="instockOnly" value="y" 
					${ ! empty search.instockOnly? "checked='checked'" : "" }>재고없음제외
				<select name="searchCondition" class="ct_input_g" style="width:80px">
				<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
					<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option>
					<option value="1"<%=(searchCondition.equals("1") ? "selected" : "") %>>상품명</option>
					<option value="2"<%=(searchCondition.equals("2") ? "selected" : "") %>>상품가격</option>
					/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
					<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
					<option value="1"${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					<option value="2"${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
				</select>
				<%-- <input type="text" name="searchKeyword"  value="<%= searchKeyword %>"class="ct_input_g" style="width:200px; height:19px" />--%>
				<input type="text" name="searchKeyword"
						value="${! empty search.searchKeyword ? search.searchKeyword : ""} 
						class="ct_input_g" style="width:200px; height:20px" > 
			</td>	
			<td align="right" width="70">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23">
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
							<!--  <a href="javascript:fncGetProductList('1');">검색</a>-->
							검색
						</td>
						
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23">
						</td>
					</tr>
				</table>
			</td>
		</tr>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<%-- 
		<td colspan="11" >전체  <%= resultPage.getTotalCount()%> 건수, 현재 <%= resultPage.getCurrentPage() %> 페이지</td>
	--%>
		<td colspan="11" align="left">
			전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		</td>
	</tr>
	
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">브랜드</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">사진</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
		상품명
		<input onclick="fncGetProductList('1')" type="checkbox" name="sort" value="1" 
					${ search.sort==1 ? "checked='checked'" : "" }>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격
		<input onclick="fncGetProductList('1')" type="checkbox" name="sort" value="2" 
					${ search.sort==2 ? "checked='checked'" : "" }>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일
		<input onclick="fncGetProductList('1')"  type="checkbox" name="sort" value="3" 
					${ search.sort==3 ? "checked='checked'" : "" }>
		</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
	<c:set var="i" value="${ i+1 }" />
		
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="center">
			${product.brandName.brandNam}
			</td>
			<td></td>
			<td>
			<img width="100px" src="/uppic/${product.fileName}">
			</td>
			<td></td>
			<td align="left" data-param="${ product.prodNo}" data-param2="${product.proTranCode}">
			<c:if test="${ role=='user'}">
				<c:choose>
					<c:when test="${fn:trim(product.proTranCode)=='0'}">
						 ${ product.prodName}
					</c:when>
					<c:otherwise>
						<span>${ product.prodName}</span>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${ role=='admin'}">
				 <c:choose>
					<c:when test="${fn:trim(product.proTranCode)=='0'}">
						${product.prodName}
				</c:when>
				<c:otherwise>
					<span>${ product.prodName}</span>
				</c:otherwise>
				</c:choose>
			</c:if>
			</td>
			
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}
			</td>
			<td></td>
			<td align="left" data-param1="${product.prodNo}" data-param2="${product.proTranCode}">
				<c:if test="${role=='admin'}">
					<c:choose>
						<c:when test="${fn:trim(product.proTranCode)=='1'}" >
							배송하기
						</c:when>
						<c:when test="${fn:trim(product.proTranCode)=='2'}">
							배송중
						</c:when>
						<c:when test="${fn:trim(product.proTranCode)=='3'}">
							구매완료하기
						</c:when>
						<c:when test="${fn:trim(product.proTranCode)=='4'}">
							구매완료상품
						</c:when>
						<c:otherwise>
							판매중
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${role !='admin' }">
					<c:choose>
						<c:when test="${fn:trim(product.proTranCode)=='0'}">
							판매중
						</c:when>
						<c:when test="${fn:trim(product.proTranCode)!='0'}">
							재고없음
						</c:when>
					
					</c:choose>
				</c:if>
			</td>			
		</tr>
		<tr>
		<!-- 
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		 -->
		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
		
	</c:forEach>
</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		<jsp:include page="../common/pageNavigator.jsp">	
				<jsp:param value="Product" name="type"/> 
		</jsp:include>
			
    	</td>
	</tr>

</table>
<!-- PageNavigation End... -->

</form>
</div>
</body>
</html>
