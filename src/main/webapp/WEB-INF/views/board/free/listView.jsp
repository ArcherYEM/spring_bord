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
		<div style="text-align:center;">
			<h1>자유게시판</h1>
		</div>
		<div style="text-align:center;" >
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
		<div style="text-align:center">
			<c:forEach var="page" begin="1" end="${totalPage }">
				<span>[ ${page } ]</span>&nbsp;
			</c:forEach>
		</div>
	</body>
</html>