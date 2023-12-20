<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유 게시판</title>
		<link rel="stylesheet" href="<c:url value='/cdn/CLEditor1_4_5/jquery.cleditor.css'/>"/>
	</head>
	<body>
		<div>
			<h1>게시글 등록 화면</h1>
		</div>
		<div>
			<form id="frm1" method="post" action="<c:url value='/board/free/write'/>" enctype="multipart/form-data">
				<input type="text" name="title" placeholder="제목"><br>
				<input type="file" name="file"><br>
				<textarea id="content" name="content"></textarea><br>
				<input type="button" id="btnWrite" value="작성"><br>
			</form>
		</div>
		<script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/cdn/CLEditor1_4_5/jquery.cleditor.min.js'/>"></script>
		<script>
		 	$(document).ready(function () { $("#content").cleditor(); });
		 
			document.getElementById('btnWrite').addEventListener('click',function(){
				document.getElementById('frm1').submit();
			});
		</script>
		
	</body>
</html>