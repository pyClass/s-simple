<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1st Test</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$('#login').click(function(){
			$(location).attr('href', '/www/member/login.van');
		});
		$('#join').click(function(){
			$(location).attr('href', '/www/member/join.van');
		});
		$('#logout').click(function(){
			$(location).attr('href', '/www/member/logout.van');
		});
		
		/* 회원 정보보기 비동기 처리 */
		$('#memberInfo').click(function(){
			// 회원번호를 mt3 클래스가 적용된 태그에 아이디 값으로 입력해놨으므로
			// 해당태그의 아이디 값을 읽어온다.
			var tid = '${SID}';
			// 이제 화면 전체가 리로드 되어야 하는 것이 아니고
			// detail 아이디가 부여된 태그에만 적용이 되어야 하므로
			// 비동기 통신으로 데이터를 받아서
			// 해당 태그에 적용시켜주면 된다.
			
			$.ajax({
				url : "/member/membInfo.ck",
				type : "post",
				dataType : "json",
				data : {
					mid : tid
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
					
					$('#infoEdit').click(function(){
						$('#no').html(data.mno);
						$('#id').html(data.mid);
						$('#name').html(data.mname);
						$('#mail').val(data.mmail);
						$('#tel').val(data.mtel);
						$('#date').html(data.mdate);
						$('#detail').css('display', 'none');
						$('#edit').css('display', 'block');			
					});
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
		});
		
		$('#save').click(function(){
			// 할일
			// 데이터읽어오고
			var mail1 = $('#mmail').text();
			var mail2 = $('#mail').val();
			var tel1 = $('#mtel').text();
			var tel2 = $('#tel').val();
			var no = $('#no').text();
			var code = 1;
			
			if(mail1 == mail2 && tel1 == tel2){
				return;
			} else if(mail1 == mail2){
				// 전화번호만 수정한 경우
				code = 3;
			} else if(tel1 == tel2){
				// 메일만 수정한 경우
				code = 2;
			} else {
				// 전화번호와 메일 둘다 수정한 경우
				code = 1;
			}
			
			$.ajax({
				url : "/member/infoEdit.ck",
				type: "post",
				dataType: "json",
				data : {
					"mno" : no,
					"mail" : mail2,
					"tel" : tel2,
					"code" : code
				},
				success : function(data){
					if(data.cnt == 1){
						$('#edit').css('display', 'none');
						alert('회원 정보가 수정 되었습니다.');
					} else {
						alert('회원 정보 수정이 실패했습니다.');
					}
				},
				error : function(){
					alert('서버 오류');
				}
			});
		});
		
		/*
		$('#close').click(function(){
			$('#detail').css('display', 'none');
		});
		$('#btn2').click(function(){
			$('#detail').css('display', 'none');
		});
		
		$('#cancel').click(function(){
			$('#edit').css('display', 'none');
		});
		$('#btn3').click(function(){
			$('#edit').css('display', 'none');
		});
		*/
		
		$('.w3-button').click(function(){
			var bid = $(this).attr('id');
			if(bid == 'close' || bid == 'cancel' || bid == 'btn2' || bid == 'btn3'){
				if(bid == 'btn2' || bid == 'btn3'){
					$(this).parent().parent().parent().css('display', 'none');
				} else {
					$(this).parent().parent().parent().parent().css('display', 'none');
				}
			} else {
				return;
			}
		});
		
		$('#boardList').click(function(){
			$(location).attr('href', '/board/boardList.cls');
		});
		
		$('#reboard').click(function(){
			$(location).attr('href', '/board/reboard.cls');
		});
		
		$('#survey').click(function(){
			$(location).attr('href', '/survey/survey.cls');
		});
		
		
/* 		
		$('#memberEdit').click(function(){
			$('#edit').css('display', 'block');
		});
*/
	});
</script>
</head>
<body>
	<div class="w3-col m2"><p></p></div>
	<div class="w3-col m8 w3-center w3-margin-top">
		<h1 class="w3-col w3-blue">Welcome My Home!!!</h1>
		<div class="w3-col">
			<c:if test="${empty SID}">
				<div class="w3-col m2 w3-red w3-button" id="login">로그인</div>
				<div class="w3-col m2 w3-purple w3-button" id="join">회원가입</div>
			</c:if>
			<c:if test="${not empty SID}">
				<div class="w3-col m2 w3-pink w3-button" id="logout">로그아웃</div>
				<div class="w3-col m2 w3-deep-purple w3-button" id="memberInfo">회원정보보기</div>
				<!-- <div class="w3-col m2 w3-indigo w3-button" id="memberEdit">회원정보수정</div> -->
				<div class="w3-col m2 w3-aqua w3-button" id="boardList">파일업로드게시판</div>
				<div class="w3-col m2 w3-blue-grey w3-button" id="reboard">댓글게시판</div>
				<div class="w3-col m2 w3-khaki w3-button" id="survey">설문조사</div>
			</c:if>
		</div>
	</div>
	
	
	<!-- 회원 상세정보 보기 -->
	<div class="w3-modal m3" id="detail">
		<div class="w3-modal-content w3-center w3-padding">
			<div class="w3-container w3-white w3-padding">
       			<div id="btn2" 
       				class="w3-button w3-display-topright w3-margin-right w3-margin-top w3-purple">&times;</div>
				<h2 class="w3-col w3-purple w3-padding w3-card">회원 정보</h2>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">회원번호 : </h5>
					<h5 class="w3-col m9 w3-center" id="mno"></h5>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">아 이 디 : </h5>
					<h5 class="w3-col m9 w3-center" id="mid"></h5>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">회원이름 : </h5>
					<h5 class="w3-col m9 w3-center" id="mname"></h5>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">이 메 일 : </h5>
					<h5 class="w3-col m9 w3-center" id="mmail"></h5>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">전화번호 : </h5>
					<h5 class="w3-col m9 w3-center" id="mtel"></h5>
				</div>
				<div class="w3-col w3-border-bottom w3-margin-bottom">
					<h5 class="w3-col m3 w3-right-align">가 입 일 : </h5>
					<h5 class="w3-col m9 w3-center" id="mdate"></h5>
				</div>
				<div class="w3-col w3-center">
					<div class="w3-cell m1 w3-button w3-red w3-left" id="close">닫기</div>
					<div class="w3-cell m1 w3-button w3-blue w3-right" id="infoEdit">수정</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 회원 정보 수정 모달 -->
	<div class="w3-modal" id="edit">
		<div class="w3-modal-content">
			<div class="w3-container w3-col w3-white w3-padding">
       			<span id="btn3" 
       				class="w3-button w3-display-topright w3-margin-right w3-margin-top">&times;</span>
				<h2 class="w3-col w3-purple w3-padding w3-card">회원 정보 수정</h2>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">회원번호 : </h5>
					<h5 class="w3-col m9 w3-center" id="no"></h5>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">아 이 디 : </h5>
					<h5 class="w3-col m9 w3-center" id="id"></h5>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">회원이름 : </h5>
					<h5 class="w3-col m9 w3-center" id="name"></h5>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">이 메 일 : </h5>
					<div class="w3-col m9 w3-padding"><input class="w3-input w3-border" type="text" id="mail" name="mail"></div>
				</div>
				<div class="w3-col w3-border-bottom">
					<h5 class="w3-col m3 w3-right-align">전화번호 : </h5>
					<div class="w3-col m9 w3-padding"><input class="w3-input w3-border" type="text" name="tel" id="tel"></div>
				</div>
				<div class="w3-col w3-border-bottom w3-margin-bottom">
					<h5 class="w3-col m3 w3-right-align">가 입 일 : </h5>
					<h5 class="w3-col m9 w3-center" id="date"></h5>
				</div>
				<div class="w3-col w3-center">
					<div class="w3-cell m1 w3-button w3-red w3-left" id="cancel">취소</div>
					<div class="w3-cell m1 w3-button w3-blue w3-right" id="save">저장</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>