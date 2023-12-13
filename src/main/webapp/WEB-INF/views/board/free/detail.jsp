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
			<ul>
				<li>순번 : <c:out value="${free.seq }"/></li>
				<li>제목 : <c:out value="${free.title }"/></li>
				<li>내용<br>
					<pre><c:out value="${free.content }"/></pre></li>
				<li>작성자 : <c:out value="${free.writer }"/></li>
				<li>작성일시 : <c:out value="${free.write_date2 }"/></li>
				<li>좋아요 : <c:out value="${free.rec_cnt }"/></li>
				<li>싫어요 : <c:out value="${free.nrec_cnt }"/></li>
			</ul>
		</div>
	</body>
</html>