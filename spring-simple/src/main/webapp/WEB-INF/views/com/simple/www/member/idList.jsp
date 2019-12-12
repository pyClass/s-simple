<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID List</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<style>
	.w250 {
		width: 250px;
		margin: 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('.w250').click(function(){
			var sno = $(this).attr('id');
			var avt = $('#avt'+sno).attr('src');
			avt = avt.substring(avt.lastIndexOf('/') + 1);
			//alert(avt);
			$('#mno').val(sno);
			$('#avt').val(avt);
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<form method="post" action="/www/member/showName.van" id="frm">
		<input type="hidden" name="mno" id="mno" />
		<input type="hidden" name="avt" id="avt" />
	</form>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-half w3-container w3-center">
		<h3 class="w3-orange w3-card">Member ID List</h3>
		<c:forEach var="data" items="${LIST}">
			<div class="w3-col w3-card w250 w3-margin-top" id="${data.mno}">
			  <img src="/www/img/avatar/${data.avatar}" alt="${data.id}" id="avt${data.mno}" style="width:100%">
			  <div class="w3-container">
			    <h4><b>${data.id}</b></h4>
			    <p>가입일 : ${data.sDate}</p>
			  </div>
			</div>
		</c:forEach>
	</div>
</body>
</html>