<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp home.jsp</title>
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var sno = 3;
	$(function(){
		$('p').click(function(){
			$.ajax({
				url: "/www/member/getNo.van",
				type: "post",
				dataType: "json",
				data: {
					"mno": sno
				},
				success: function(data){
					alert(data.cnt);
				},
				error: function(){
					alert("### server error")
				}
			});
		});
	});
</script>
</head>
<body>
	<p>여기는 webapp/home.jsp</p>
</body>
</html>