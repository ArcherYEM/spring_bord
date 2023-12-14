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
	<div style="width: 850px; border: 2px solid blue;">
		<form id="frm1" action="<c:url value='update' />" method="post">
			<input type="hidden" name="seq" value="<c:out vaule="${free.seq }"/>">
			<ul>
				<li>순번 : <c:out value="${free.seq }" /></li>
				<li>제목 : <input type="text" name="title"
					value="<c:out value="${free.title }" />"></li>
				<li>내용<br> <textarea name="content"><c:out
							value="${free.content }" /></textarea>
				</li>
				<li>작성자 : <c:out value="${free.writer }" /></li>
				<li>작성일시 : <c:out value="${free.write_date2 }" /></li>
				<li>좋아요 : <c:out value="${free.rec_cnt }" /></li>
				<li>싫어요 : <c:out value="${free.nrec_cnt }" /></li>
			</ul>
		</form>
	</div>
	<div>
		<input type="button" id="btnUpd" value="수정완료" />
	</div>
	<form id="frm1" action="<c:url value='/board/free/delete' />"
		method="post">
		<input type="hidden" id="seq" name="seq">
	</form>
	<script>
		document.getElementById('btnUpd').addEventListener('click', function() {
			if (confirm('해당 게시글을 삭제하시겠습니까?')) {
				document.getElementById('frm1').submit();
			}
		});
	</script>
</body>
</html>