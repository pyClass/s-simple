<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Board Write</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<style>
</style>
<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			$(location).attr('href', 'boardList.van');
		});
		
		function s1(){
			var ttl = $('#title').val();
			var db = $('#body').val();
			
			if(!ttl || !db){
				alert('필수 입력 사항을 확인하세요!');
				return;
			}
			
			$('#frm').attr('method', 'post');
			$('#frm').attr('action', '/www/board/fboardWriteProc.van');
			$('#frm').submit();
		}
		
		$('#submit').click(s1);
	});
</script>
</head>
<body>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6 w3-center">
		<h2 class="w3-col w3-padding w3-blue w3-margin-bottom">
			파일 업로드 게시판 글쓰기
		</h2>
		
		<div class="w3-col w3-padding w3-margin-bottom">
			<form id="frm" enctype="multipart/form-data" class="w3-col w3-card" >
				<input type="hidden" id="id" name="id" value="${SID}" >
				<div class="w3-row">
					<h4 class="w3-col m2 w3-right-align">Title : </h4>
					<div class="w3-col m10 w3-padding">
						<input class="w3-input w3-border" type="text" id="title" name="title" placeholder="# 제목을 입력하세요!">
					</div>
				</div>
				<div class="w3-row">
					<h4 class="w3-col m2 w3-right-align">Content : </h4>
					<div class="w3-col m10 w3-padding">
						<textarea class="w3-input w3-border" id="body" name="body" 
									placeholder="글 내용 입력" 
									cols="50" rows="10" style="resize: none"></textarea>
					</div>
				</div>
				<div class="w3-row w3-margin-top">
					<h4 class="w3-col m2 w3-right-align">File : </h4>
					<div class="w3-col m10 w3-padding">
						<input class="w3-input w3-border" type="file" id="file" name="file" 
																		placeholder="# 파일 선택!">
					</div>
				</div>
			</form>
			<div class="w3-col w3-margin-top">
				<div class="w3-button w3-small w3-red w3-hover-amber w3-left" id="cancel" >cancel</div>
				<div class="w3-button w3-small w3-green w3-hover-lime w3-right" id="submit">글등록</div>
			</div>
		</div>
	</div>
</body>
</html>