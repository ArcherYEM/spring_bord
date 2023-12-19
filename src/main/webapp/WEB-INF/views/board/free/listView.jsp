<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		<link rel="stylesheet" href="<c:url value='/cdn/css/jquery-ui.min.css'/>"/>
	</head>
	<body style="text-decoration-line: none;">
		<div>
			<h1>자유게시판</h1>
		</div>
		<div>
			<input type="text" id="fCalendar" style="width:100px" value="<c:out value="${rp.fWrite }"/>">
			 ~ <input type="text" id="tCalendar" style="width:100px" value="<c:out value="${rp.tWrite }"/>">
		</div>
		<div>
			<input type="text" id="titleSearch" value="<c:out value="${rp.title }"/>" placeholder="제목을 입력하세요" style="width:30%">
			<input type="button" id="btnSearch" value="조회">
		</div>
		<div>
			<ul>
				<c:forEach var="free" items="${list }">
					<li>
						<c:out value="${free.seq }" /> | 
						<a href="<c:url value='/board/free/detail?seq=${free.seq }'/>">
							<c:out value="${free.title }" /> |
						</a>
						<c:out value="${free.writer }" /> | 
						<c:out value="${free.write_date }" />
					</li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<c:forEach var="page" begin="1" end="${totalPage }">
				<c:if test="${page == rp.page}">
					<span class="spanPage" data-page="${page }"
						style=".spanPage:hover; background-color: lightgray; cursor: pointer; margin: 4px; color: red; font-weight: bold;">
						[${page }]
					</span>
				</c:if>
				<c:if test="${page != rp.page}">
					<span class="spanPage" data-page="${page }"
						style=".spanPage:hover; cursor: pointer; margin: 4px; color: gray; font-weight: normal;">
						[${page }]
					</span>
				</c:if>
			</c:forEach>
		</div>
		<form id="frm1" action="<c:url value='/board/free/listView'/>" method="post">
			<input type="hidden" name="page" id="page" />
			<input type="hidden" name="title" id="title" />
			<input type="hidden" name="fWrite" id="fWrite" />
			<input type="hidden" name="tWrite" id="tWrite" />
		</form>
		
		<script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/cdn/js/jquery-ui.min.js'/>"></script>
		<script>
			$(function(){
				$('#fCalendar').datepicker({
					dateFormat:'yymmdd'
				});
				$('#tCalendar').datepicker({
					dateFormat:'yymmdd'
				});
			});
		
			$('.spanPage').on('mouseover', function(){
				$('.spanPage').css('background-color','');
				$(this).css('background-color','pink');
				$(this).css('cursor','pointer');
			});
			
			$('.spanPage').on('click', function(){
				$('#page').val($(this).data('page'));
				$('#title').val($('#titleSearch').val());
				$('#frm1').submit();
			});
		
			$('#btnSearch').on('click', function(){
				$('#title').val($('#titleSearch').val());
				$('#fWrite').val($('#fCalendar').val());
				$('#tWrite').val($('#tCalendar').val());
				$('#frm1').submit();
			});
		</script>
	
	</body>
</html>