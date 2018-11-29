<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>
<script type="text/javascript">

function resetData(){
	//console.log("hi")
	//$("#nationally" ).css("background-color" , "red");
	
	self.close();
	
}

function fncAddBrand(){
	document.detailForm.action='/brand/addBrand';
	document.detailForm.submit();
}

function closeWin(){
	window.close();
}
$(function() {
	$( ".ct_btn01:contains('등록')" ).on("click" , function() {
		
		$.ajax( 
				{
					url : "/brand/json/addBrand" ,
					method : "post" ,
					dataType : "json" ,
					data : JSON.stringify({
						national : $("#nationally").val() ,
						brandNam : $("#brandNams").val() 
						
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						
						closeWin();
						
					}
			});
		
	});
	
});


//<a href="javascript:fncAddProduct();">등록</a>
//<a href="javascript:resetData();">취소</a>

</script>
</head>

<body bgcolor="#ffffff" text="#000000">



<form name="detailForm" method="post" onsubmit="javascript:close();">


<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			국가 <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
					<select id="nationally" name="national" class="ct_input_g" 
									style="width: 100px; height: 25px" maxLength="20">
						<option>구분</option>
						<option value="국산">국산</option>
						<option value="수입">수입</option>
						
					</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			브랜드명 <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input id="brandNams" type="text" name="brandNam" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<!-- 
					<a href="javascript:fncAddBrand();">등록</a>
					 -->
					등록
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
					<a href="javascript:resetData();">취소</a>
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>


</form>
</table>
</body>
</html>