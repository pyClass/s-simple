<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Test V.0.9</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<style>
	body {
		background-color: #6DC1F5;
		font-family: calnin;
	}

	.container {
		width:500px;
		margin: 0 auto;
		color: white;
	}
	
	.joinLogo{
		
		font-size: 40px;
		text-align: center;
	}
	
	.ulcl{
		position: relative;
		top: -30px;
		
		list-style: none;	
	} 
	
	.ulcl input {
		width:100%;
		height: 15px;
		border: none;
		outline: none;
		background: none;
		border-bottom: 1px dotted white;
	}
	
	.pcl {
		position: absolute;
		left: 150px;
		font-size: 10px;
	
	}

	li{	
		height:1px;
		font-size: 20px;
		margin: 30px;
		padding: 30px;
	}
	.inputcl{
		position: relative;
		top: -20px;
		left: 115px;
	}

	.subcl{

		border: 1px solid white;
		width: 150px;
		height: 50px;
		outline: none;
		background: none;
		color:white;
	}
	
	button {
		border: 1px solid white;
		width: 150px;
		height: 50px;
		outline: none;
		background: none;
		color:white;
	}
	
	.avt1 {
		width: 100%;
		padding: 5px;
	}
	.pic1 {
		width: 120px;
		height: auto;
		padding: 5px;
	}
	
	.h50 {
		height: 150px;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('.avtM').css('display', 'none');
		$('.avtF').css('display', 'none');
		$('#avtChoice').css('display', 'none');
		
		$('#btn').click(function(){
			var sid = $('#id').val();
			
			$.ajax({
				url : "/member/idCheck.ck",
				type : "post",
				dataType : "json",
				data : {
					"id" : sid
				},
				success : function(data){
					var ck = data.cnt;
					if(ck == 1){
						// 이미 회원 가입한 사람이 있는 경우
						$('#id').val("");
						$('#id_check').attr('class', '');
						$('#id_check').toggleClass('w3-text-red');
						$('#id_check').html("### 이미 가입된 아이디입니다. ###");
					} else {
						// 아직 해당아이디로 회원가입한 사람이 없는 경우
						// 따라서 사용할 수 있는 아이디
						$('#id_check').attr('class', '');
						$('#id_check').toggleClass('w3-text-green');
						$('#id_check').html("*** 사용가능한 아이디입니다. ***");
					}
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
		});
		
		$('.profIn').change(function(e){
			var tmp = URL.createObjectURL(e.target.files[0]);
			$('#profImg').attr('src', tmp);
		});
		/*
		var evt = document.getElementById('prof');
		evt.onchange = function(e){
			var tmp = URL.createObjectURL(e.target.files[0]);
			$('#profImg').attr('src', tmp);
		}
		*/
		// gen을 클릭했을 때 이벤트가 발생할 것이고.. 그때마다 적절한 행동을 하면 될것 같다.
		$('.gen').click(function(){
			var sgen = $(this).val();
			$('#avtChoice').css('display', 'block');
			if(sgen == 'M'){
				$('.avtF').stop().slideUp(10);
				$('.avtM').stop().slideDown(500);
			} else {
				$('.avtM').stop().slideUp(10);
				$('.avtF').stop().slideDown(500);
			}
		});
	});
</script>

</head>
	

<body>
	<div class="container">
		<div class="joinLogo">J O I N</div>
		<div class="listbox">
	<form method="POST" action="/member/joinProc.cls" enctype="multipart/form-data">
		<ul class="ulcl w3-margin-bottom w3-padding">
			<li id="idli">
				<label for="id">I D</label>
				<input type="text" id="id" name="id" required class="">
				<input type="button" id="btn" value="idCheck" class="w3-button w3-right" style="width: 150px; height: 30px; padding: 0px;">
			<p class="" id="id_check" ></p>
			</li>
			
			<li><label for="pw">Password</label><input type="password" id="pw" name="pw"  required >
			<p class="pcl" id="pw_check"></p></li>
			
			<li><label for="pw_e">Password Confirm</label><input type="password" id="pw_c" name="pw_c">
			<p class="pcl" id="pwc_check"></p></li>
			
			<li><label for="name">Name</label><input type="text" id="name" name="name"  required >
			<p class="pcl" id="name_check"></p></li>
			
			<li><label for="email">E-mail</label><input type="text" id="mail" name="mail"  required ></li>
			<p class="pcl" id="email_check"></p>
			
			<li><label for="num">Phone Number</label><input type="text" id="tel" name="tel" placeholder="예] 010-1111-1111" required >
			<p class="pcl" id="num_check"></p>
			</li>
			
			<li class="w3-margin-bottom">
				<label for="gen">성 별</label>
				<div class="w3-row w3-margin-bottom">
					<div class="w3-col m3"><p></p></div>
					<div class="w3-col m4">
						<span><input class="w3-col m2 w3-radio gen" type="radio" name="gen" value="M" > 남 자</span>
					</div>
					<div class="w3-col m4 ">
						<span><input class="w3-col m2 w3-radio gen" type="radio" name="gen" value="F" > 여 자</span>
					</div>
				</div>
					<hr class="w3-light-grey">
			</li>
			<li id="avtChoice">
				<label for="avt">아바타</label>
				<div class="w3-col avtM">
					<div class="w3-col m4">
						<input type="radio" name="avt" value="11">
						<div>
							<img src="/img/avatar/img_avatar1.png" class="avt1">
						</div>
					</div>
					<div class="w3-col m4">
						<input type="radio" name="avt" value="12">
						<div>
							<img src="/img/avatar/img_avatar2.png" class="avt1">
						</div>
					</div>
					<div class="w3-col m4">
						<input type="radio" name="avt" value="13">
						<div>
							<img src="/img/avatar/img_avatar3.png" class="avt1">
						</div>
					</div>
				</div>
				<div class="w3-col avtF">
					<div class="w3-col m4">
						<input type="radio" name="avt" value="14">
						<div>
							<img src="/img/avatar/img_avatar4.png" class="avt1">
						</div>
					</div>
					<div class="w3-col m4">
						<input type="radio" name="avt" value="15">
						<div>
							<img src="/img/avatar/img_avatar5.png" class="avt1">
						</div>
					</div>
					<div class="w3-col m4">
						<input type="radio" name="avt" value="16">
						<div>
							<img src="/img/avatar/img_avatar6.png" class="avt1">
						</div>
					</div>
				</div>
			</li>
			
			<!-- 프로필사진 업로드기능 -->
			<li>
				<div class="w3-col">
					<label for="prof">프로필사진</label>
					<div class="w3-col w3-padding prof">
						<input type="file" name="prof" id="prof" 
								class="w3-file profIn" style="height: 50px;">
					</div>
					<div id="" class="w3-padding w3-center">
						<img src="/img/profile/noimage.jpg" alt="noimage" class="pic1" id="profImg">
					</div>
				</div>
			</li>
		</ul>
		
		<div class="inputcl w3-margin-bottom">
			<input class="subcl" type="submit" id="join" value="Sign Up">
			<button id="returnBtn">Back</button>
		</div>
	</form>
	</div>
</div>
</body>
</html>