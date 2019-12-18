<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<style>
	.lpad25 {
		padding-left: 25px;
	}
	.w90 {
		display: inline-block;
		width: 90px;
		padding: 5px;
		margin: 0px;
	}
	
	.w80 {
		width: 80px;
	}
	
	.margin_01 {
		margin-top: 5px;
		margin-right: 0px;
	}
	
	.mt10 {
		margin-top: 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		/*
		$('#login').click(function(){
			$(location).attr('href', '/member/login.cls');
		});
		$('#logout').click(function(){
			$(location).attr('href', '/member/logout.cls');
		});
		$('#home').click(function(){
			$(location).attr('href', '/');
		});
		
			위의 버튼이벤트를 하나로 처리를 하세요.
		*/
		
		if('${PAGE.startPage}' == 1){
			$('#startbtn').toggleClass('pbutton');
			$('#startbtn').toggleClass('w3-light-grey');
		}
		if('${PAGE.endPage}' == '${PAGE.totalPage}'){
			$('#endbtn').toggleClass('pbutton');
			$('#endbtn').toggleClass('w3-light-grey');
		}
		
		$('.w3-button').click(function(){
			var tid = $(this).attr('id');
			var target = '';
			if(tid == 'login'){
				target = '/www/member/login.van';
			} else if(tid == 'logout'){
				target = '/www/member/logout.van';
			} else if(tid == 'home'){
				target = '/';
			} else if(tid == 'write'){
				target = '/www/board/reboardWrite.van';
			}
			$(location).attr('href', target);
		});
		
		$('.pbutton').click(function(){
			var sPage = $(this).html();
			var ltxt = $('#startbtn').html();
			var rtxt = $('#endbtn').html();
			if(sPage == '${PGE.nowPage}') return;
			
			if(sPage == ltxt){
				sPage = '${PAGE.startPage - 1}';
				$('#nowPage').val(sPage);
			} else if(sPage == rtxt){
				sPage = '${PAGE.endPage + 1}';
				$('#nowPage').val(sPage);
			} else {
				$('#nowPage').val(sPage);
			}
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<form method="post" action="/www/board/reBoardForm.van" id="frm">
		<input type="hidden" name="nowPage" id="nowPage">
	</form>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6">
		<h2 class="w3-container w3-margin-top w3-purple w3-card w3-center w3-padding">댓글 게시판</h2>
		<div>
			<div class="w3-button w3-small w3-green w3-left" id="home">home</div>
			<c:if test="${empty SID}">
				<div class="w3-button w3-small w3-lime w3-left" id="login">login</div>
			</c:if>
			<c:if test="${not empty SID}">
				<div class="w3-button w3-small w3-lime w3-left" id="logout">logout</div>
				<div class="w3-button w3-small w3-blue w3-right" id="write">글쓰기</div>
			</c:if>
		</div>
		
		<div class="w3-col w3-content w3-margin-top">
			
			<c:forEach var="data" items="${LIST}">
			<div style="padding-left: ${data.lvl * 70}px;" class="mt10">
				<div class="w3-container w3-card">
					<div class="w3-col w90 w3-center">
						<div class="w3-content w3-circle">
							<img src="/www/img/avatar/${data.avatar}" class="w80 w3-circle">
						</div>
						<h6>${data.id}</h6>
					</div>
					<div class="w3-rest lpad25">
						<h6 class="w3-col m5"><span>${data.wDate} <small>${data.wTime}</small></span></h6>
						<div class="w3-col m7 w3-padding">
						<c:if test="${data.id eq SID}">
						<div class="w3-button w3-tiny w3-red w3-right">삭제</div>
						<div class="w3-button w3-tiny w3-green w3-right">수정</div>
						</c:if>
						<c:if test="${not empty SID}">
						<div class="w3-button w3-tiny w3-blue w3-right">댓글</div>
						</c:if>
						</div>
						<hr class="w3-col" style="margin-top: 0px;">
						<div class="w3-container">
							${data.body}
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
		</div>
		
		
		<!-- https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_pagination_border -->
		<div class="w3-center">
			<div class="w3-bar w3-border w3-margin-top w3-margin-bottom">
			  <div class="w3-bar-item w3-hover-blue pbutton" id="startbtn">&laquo;</div>
			  <c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			  <div class="w3-bar-item w3-hover-blue pbutton">${page}</div>
			  </c:forEach>
			  <div class="w3-bar-item w3-hover-blue pbutton" id="endbtn">&raquo;</div>
			</div>
		</div>
		
	</div>
</body>
</html>