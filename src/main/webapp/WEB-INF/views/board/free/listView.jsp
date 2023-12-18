<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
	</head>
	<body>
		<div>
			<h1>자유게시판</h1>
		</div>
		<div>
			<input style="width:30%;" type="text" id="titleSearch" value="<c:out value='${rp.title }'/>" placeholder="제목을 입력하세요"/>
			<input type="button" id="btnSearch" value="조회">
		</div>
		<div >
			<ul>
				<c:forEach var="free" items="${list }">
					<li>
						<c:out value="${free.seq }"/> | 
						<a href="<c:url value='/board/free/detail?seq=${free.seq }'/>">
							<c:out value="${free.title }"/> |
						</a> 
						<c:out value="${free.writer }"/> | 
						<c:out value="${free.write_date }"/>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<c:forEach var="page" begin="1" end="${totalPage }">
				<span style="margin:4px;">
				<a href="<c:url value='/board//free/listView?page=${page }'/>">[ ${page } ]</a></span>
			</c:forEach>
		</div>
		<form id="frm1" action="<c:url value='/board/free/listView'/>" method="post">
			<input type="hidden" name="title" id="title"/>
			<input type="hidden" name="title" id="fwrite"/>
			<input type="hidden" name="title" id="twrite"/>
		</form>
		<script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
		<script>
			$('#btnSearch').on('click', function(){
				$('#title').val($('#titleSearch').val());
				$('#frm1').submit();
			});
		</script>
	</body>
</html>