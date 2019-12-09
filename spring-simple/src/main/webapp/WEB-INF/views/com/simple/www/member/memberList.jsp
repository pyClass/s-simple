<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<link rel="stylesheet" href="/css/w3.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<style>
	.mt3 {
		margin-top : 3px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$('#btn2').click(function(){
			$('#detail').css('display', 'none');
		});
		
		$('.mt3').click(function(){
			// 회원번호를 mt3 클래스가 적용된 태그에 아이디 값으로 입력해놨으므로
			// 해당태그의 아이디 값을 읽어온다.
			var tno = $(this).attr('id');
			// 이제 화면 전체가 리로드 되어야 하는 것이 아니고
			// detail 아이디가 부여된 태그에만 적용이 되어야 하므로
			// 비동기 통신으로 데이터를 받아서
			// 해당 태그에 적용시켜주면 된다.
			
			$.ajax({
				url : "/member/membDetail.nop",
				type : "post",
				dataType : "json",
				data : {
					mno : tno
				},
				success : function(data){
					alert("success");
					$('#mno').html(data.mno);
					$('#mid').html(data.mid);
					$('#mname').html(data.mname);
					$('#mmail').html(data.mmail);
					$('#mtel').html(data.mtel);
					$('#mdate').html(data.mdate);
					$('#detail').css('display', 'block');
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6 w3-container w3-center w3-padding-bottom">
		<!-- 리스트제목 -->
		<h2 class="w3-lime w3-padding w3-card">회원 리스트</h2>
		<div class="w3-margin-top w3-margin-bottom">
			<div class="w3-col w3-border w3-card">
				<div class="w3-col m3 w3-light-gray w3-border-right"><h6>회원번호</h6></div>
				<div class="w3-col m3 w3-light-gray w3-border-right"><h6>회원이름</h6></div>
				<div class="w3-col m6 w3-light-gray"><h6>전화번호</h6></div>
			</div>
			
			<c:forEach var="data" items="${LIST}">
			<div class="w3-col w3-border mt3 w3-card" id="${data.mno}">
				<div class="w3-col m3 w3-border-right"><h6><small>${data.mno}</small></h6></div>
				<div class="w3-col m3 w3-border-right"><h6><small>${data.name}</small></h6></div>
				<div class="w3-col m6"><h6><small>${data.tel}</small></h6></div>
			</div>
			</c:forEach>
		</div>
		
		<!-- 회원 상세정보 보기 -->
		<div class="w3-modal" id="detail">
			<div class="w3-modal-content">
				<div class="w3-contatiner w3-col w3-white w3-padding">
					<h2 class="w3-col w3-purple w3-padding w3-card">회원 정보</h2>
					<div class="w3-col w3-border-bottom">
						<h5 class="w3-col m3">회원번호 : </h5><h5 class="w3-col m9" id="mno"></h5>
					</div>
					<div class="w3-col w3-border-bottom">
						<h5 class="w3-col m3">아 이 디 : </h5>
						<h5 class="w3-col m9" id="mid"></h5>
					</div>
					<div class="w3-col w3-border-bottom">
						<h5 class="w3-col m3">회원이름 : </h5>
						<h5 class="w3-col m9" id="mname"></h5>
					</div>
					<div class="w3-col w3-border-bottom">
						<h5 class="w3-col m3">이 메 일 : </h5>
						<h5 class="w3-col m9" id="mmail"></h5>
					</div>
					<div class="w3-col w3-border-bottom">
						<h5 class="w3-col m3">전화번호 : </h5>
						<h5 class="w3-col m9" id="mtel"></h5>
					</div>
					<div class="w3-col w3-border-bottom w3-margin-bottom">
						<h5 class="w3-col m3">가 입 일 : </h5>
						<h5 class="w3-col m9" id="mdate"></h5>
					</div>
        			<span id="btn2" class="w3-button w3-display-topright w3-margin-right w3-margin-top">&times;</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>