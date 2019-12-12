<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Name</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<style>
	.w250 {
		width: 250px;
		margin: 10px;
	}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-half w3-container w3-center">
		<h3 class="w3-orange w3-card">Member Name</h3>
		<div class="w3-col w3-card w250 w3-margin-top w3-center w3-padding">
		  <img src="/www/img/avatar/${avatar}" alt="${name}" style="width:100%">
		  <div class="w3-container">
		    <h4><b>${name}</b></h4>
		  </div>
		</div>
	</div>
</body>
</html>