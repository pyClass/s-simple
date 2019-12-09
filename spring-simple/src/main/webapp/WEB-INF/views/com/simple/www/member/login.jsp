<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Test 1st</title>

<c:if test="${not empty SID}">
	<meta http-equiv="Refresh" content="3;url=/" />
</c:if>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/w3.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<style>
	.h1 {
		line-height: 350%;
	}
</style>
<script type="text/javascript">
/* 	
	var sid = '${SID}';
	$(function(){
		if(!sid || sid.length != 0){
			$(location).attr('href', '/');
		}
	}); */
</script>
</head>
<body>
	<div class="w3-col m3"><p></p></div>
	<!-- 로그인 폼 페이지 -->
	<c:if test="${empty SID}">
<!-- 		<form method="POST" action="/member/loginExec.nop" id="frm"  class="w3-col m6 w3-center w3-margin-top" > -->
		<form method="POST" action="/member/loginProc.cls" id="frm"  class="w3-col m6 w3-center w3-margin-top" >
			<h2 class="w3-col w3-padding w3-card w3-center w3-blue">Login</h2>
			<div class="w3-col w3-card w3-padding">
				<div class="w3-col">
					<label for="id" class="w3-col m2 w3-right-align w3-center h1">
						<i class="fa fa-user-o w3-text-blue h1"></i><span class="w3-right"> I D : </span>
					</label>
					<div class="w3-col m10 w3-padding">
						<input class="w3-input w3-border" type="text" id="id" name="id">
					</div>
				</div>
				<div class="w3-col">
					<label for="pw" class="w3-col m2 w3-right-align w3-center h1">
						<i class="fa fa-key w3-text-blue h1"></i><span class="w3-right"> P W : </span>
					</label>
					<div class="w3-col m10 w3-padding">
						<input class="w3-input w3-border" type="password" id="pw" name="pw">
					</div>
				</div>
			</div>
			<div class="w3-col w3-margin-top">
			<input class="w3-button m2 w3-red w3-left" type="button" id="home" value="취소">
			<input class="w3-button m2 w3-blue w3-right" type="submit" id="btn" value="로그인">
			</div>
		</form>
	</c:if>
	
	<c:if test="${not empty SID}">
		<div class="w3-col m6 w3-center" id="d1">
			<h3>${SID} 님은 이미로그인 했습니다.</h3>
			<h6>메인 페이지로 이동합니다.</h6>
		</div>
	</c:if>
</body>
</html>