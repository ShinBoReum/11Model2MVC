<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 조회</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
		
		$(function() {
			$( ".nation" ).on("change" , function() {
				
				var idx = $(".nation").index(this);
				var nationally =$(this).val();
				
				$.ajax( 
						{
							url : "/brand/json/compare?nation="+nationally ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								
								var list="";
								list+="<option>브랜드</option>";
								for(i in JSONData.list){
									var brand = JSONData.list[i];
									
									list+="<option value='"+brand.brand_id+"'>"+brand.brandNam+"</option>";
							}
								$( ".brand_ids:eq("+idx+")" ).empty().append(list);
							}
					});
				
			});
			
		});
		
		$(function(){
			$( ".brand_ids" ).on("change" , function() {
				var idx = $(".brand_ids").index(this);
				var brand_ids=$(this).val();
				//console.log(brand_ids);
				$.ajax( 
						{
							url : "/product/json/compare2?brand_ids="+brand_ids ,
							method : "GET" ,
							dataType : "json" ,
							/* data : JSON.stringify({
								national : $("#nation").val() ,
								brandNam : $("#brandNams").val() 
								
							}), */
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
																
								var list="";
								list+="<option>이름</option>";
								for(i in JSONData.list){
									var product = JSONData.list[i];
									
									list+="<option value='"+product.prodNo+"'>"+product.prodName+"</option>";
							}
								$( ".brandNams:eq("+idx+")" ).empty().append(list);
							}
							
					});
				
			});
		});
		
		$(function(){
			$( ".brandNams" ).on("change" , function() {
				var idx = $(".brandNams").index(this);
				var prodNo=$(this).val();
				console.log(idx);
				
			  $.ajax( 
						{
							url : "/product/json/getProduct?prodNo="+prodNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								console.log(JSONData);
								
								var list="";
								
								list+="<div class='col-sm-6 col-md-6'>";
								list+="<div class='thumbnail' style='width: 400px; height: 500px; '>";
							    list+="<img src='/uppic/"+JSONData.fileName+"'>";
								list+="<div class='caption'>";
								list+="<h3>"+JSONData.brandName.brandNam +"&nbsp"+ JSONData.prodName+"</h3>"
								list+="<p>"+JSONData.prodDetail+"</p>";
								list+="<p>"+numberWithCommas(JSONData.price)+"원</p>";
								list+="<p><a href='/product/getProduct?prodNo="+JSONData.prodNo+"' class='btn btn-default' role='button'>상세보기</a></p>"
								list+="</div></div></div>"
							
								$( ".myList:eq("+idx+")" ).html(list);
							}//success 끝
							
					}); //ajax끝
				
			});
		});
		
			
		</script>



</head>

<body role="document">
<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		 
	
	      <div class="row">
	        <div class="col-md-3">
	          <table class="first_table">
	            <thead>
	              <tr>
	                <th>선택하세요</th>
	                <th></th>
	                <th>선택하세요</th>
	              </tr>
	            </thead>
	            <tbody>
	              <tr>
	                <td align="center">
	                	<div class="btn-group" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <select name="national" class="ct_input_g nation"
									style="width: 100px; height: 25px" maxLength="20">
								<option >구분</option>
								
								
									<option value="국산">국산</option>
									<option value="수입">수입</option>
								
							</select>
						  </div>
						</div>
						<div class="btn-group" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <select name="brand_id" class="ct_input_g brand_ids"
									style="width: 100px; height: 25px" maxLength="20">
								<option >브랜드</option>
								
								<c:forEach var="brand" items="${list}">
									<option value="${brand.brand_id}">${brand.brandNam }</option>
								</c:forEach>
							</select>
						  </div>
						</div>
						<div class="btn-group" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <select name="s" class="ct_input_g brandNams" 
									style="width: 100px; height: 25px" maxLength="20">
								<option >이 름</option>
								
								<c:forEach var="brand" items="${list}">
									<option value="${brand.brand_id}">${brand.brandNam }</option>
								</c:forEach>
							</select>
						</div>
	                
	                </td>
	                <td></td>
	                <td align="center">
	                	<div class="btn-group" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <select name="national" class="ct_input_g nation"
									style="width: 100px; height: 25px" maxLength="20">
								<option >구분</option>
								
								
									<option value="국산">국산</option>
									<option value="수입">수입</option>
								
							</select>
						  </div>
						</div>
						<div class="btn-group" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <select name="brand_id" class="ct_input_g brand_ids"
									style="width: 100px; height: 25px" maxLength="20">
								<option >브랜드</option>
								
								<c:forEach var="brand" items="${list}">
									<option value="${brand.brand_id}">${brand.brandNam }</option>
								</c:forEach>
							</select>
						  </div>
						</div>
						<div class="btn-group" role="group" aria-label="...">
						  <div class="btn-group" role="group">
						    <select name="s" class="ct_input_g brandNams" 
									style="width: 100px; height: 25px" maxLength="20">
								<option >이 름</option>
								
								<c:forEach var="brand" items="${list}">
									<option value="${brand.brand_id}">${brand.brandNam }</option>
								</c:forEach>
							</select>
						</div>
	                
	                </td>
	              </tr>
	              <tr>
	              	<th>
	              		<div class="row myList">
							  <div class="col-sm-6 col-md-6">
							  <input type="hidden" value="${i}">
							    <div class="thumbnail" style="width: 400px; height: 500px; ">
								  
								      <img src="/uppic/carcompare.png">
								      <div align="center" class="caption">
								        <h3></h3>
								        <p></p>
								        <p></p>
								        <%-- <p data-param="${ product.prodNo}" data-param2="${product.proTranCode}"><a class="btn btn-primary" role="button">구매</a> 
								        <a class="btn btn-default" role="button">상세보기</a></p> --%>
								      </div>
							    </div>
							  </div> 
						</div>
	              	</th>
	              	<th>
	              	<img src="/uppic/img_addvs.gif">
	              	</th>
	              	<th>
	              		<div class="row myList">
							  <div class="col-sm-6 col-md-6">
							  <input type="hidden" value="${i}">
							    <div class="thumbnail" style="width: 400px; height: 500px; ">
								  
								      <img src="/uppic/carcompare.png">
								      <div align="center" class="caption">
								        <h3></h3>
								        <p></p>
								        <p></p>
								        <%-- <p data-param="${ product.prodNo}" data-param2="${product.proTranCode}"><a class="btn btn-primary" role="button">구매</a> 
								        <a class="btn btn-default" role="button">상세보기</a></p> --%>
								      </div>
							    </div>
							  </div> 
						</div>
	              	</th>
	              </tr>
	              
	              
	            </tbody>
	            
	          </table>
	        </div>
	</div>
	</div>
</body>
</html>