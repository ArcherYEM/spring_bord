<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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
				<li>번호:<c:out value="${free.seq }"/></li>
				<li>제목:<c:out value="${free.title }"/></li>
				<li>내용:<br>
					<pre><c:out value="${free.content }"/></pre>
				</li>
				<li>작성자:<c:out value="${free.writer }"/></li>
				<li>작성일시:<c:out value="${free.write_date2 }"/></li>
				<li>첨부파일:
					<c:if test="${null != file }">
						<c:out value="${file.o_filename }"/>
						<input type="button" id="btnDownload" value="다운로드"
							data-seq="<c:out value='${file.seq }'/>"
						>
					</c:if>
				</li>
			</ul>
		</div>
		<div style="text-align: center">
			<span style="margin: 20px">
				<img id="btnRec" src="<c:url value='/cdn/images/rec_cnt.png'/>"/>
				<span id="spanRecCnt"><c:out value="${free.rec_cnt }"/></span>
			</span>
			<span style="margin: 20px">
				<img id="btnNRec" src="<c:url value='/cdn/images/nrec_cnt.png'/>"/>
				<span id="spanNRecCnt"><c:out value="${free.nrec_cnt }"/></span>
			</span>
		</div>
		<div>
			<input type="button" id="btnUpd" value="수정">
			<input type="button" id="btnDel" value="삭제">
		</div>
		<hr>
		<div>
			<input type="text" id="repCont" style="width:70%" placeholder="댓글을 입력하세요">
			<input type="button" id="btnRepWrite" value="작성">
		</div>
		<div>
			<ul id="repArea"></ul>
		</div>
		<form id="frm1" action="<c:url value='/board/free/delete'/>" method="post">
			<input type="hidden" id="seq" name="seq">
		</form>
		<form id="frm2" action="<c:url value='/common/file/download'/>" method="post">
			<input type="hidden" id="seq2" name="seq">
		</form>
		<script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
		<script>
			document.getElementById('btnUpd').addEventListener('click',function(){
				location.href = '<c:url value="/board/free/updateView?seq=${free.seq }"/>';
			});
			
			document.getElementById('btnDel').addEventListener('click',function(){
				if ( confirm('정말 삭제하시겠습니까?') ) {
					document.getElementById('seq').value = '<c:out value="${free.seq }"/>';
					document.getElementById('frm1').submit();
				}
			});
			
			document.getElementById('btnRec').addEventListener('click',function(){
				$.ajax({
				  method: 'post'
				  ,url: '<c:url value="/board/free/updateRec"/>'
				  ,data: {
					  	seq: '<c:out value="${free.seq }"/>'
					   ,recYN: 'Y'
				  }
				}).done(function( msg ) {
					if ( 'success' == msg.result ) {
						$('#spanRecCnt').html(msg.data.rec_cnt);
						$('#spanNRecCnt').html(msg.data.nrec_cnt);
					} else {
						alert('서버 장애가 발생했습니다.잠시후 다시 시도해주세요.');
					}
				});
			});
			
			document.getElementById('btnNRec').addEventListener('click',function(){
				$.ajax({
				  method: 'post'
				  ,url: '<c:url value="/board/free/updateRec"/>'
				  ,data: {
					  	seq: '<c:out value="${free.seq }"/>'
					   ,recYN: 'N'
				  }
				}).done(function( msg ) {
					if ( 'success' == msg.result ) {
						$('#spanRecCnt').html(msg.data.rec_cnt);
						$('#spanNRecCnt').html(msg.data.nrec_cnt);
					} else {
						alert('서버 장애가 발생했습니다.잠시후 다시 시도해주세요.');
					}
				});
			});
			
			document.getElementById('btnRepWrite').addEventListener('click',function(){
				$.ajax({
				  method: 'post'
				  ,url: '<c:url value="/board/free/addRep"/>'
				  ,data: {
					  	f_seq: '<c:out value="${free.seq }"/>'
					   ,content: $('#repCont').val()
				  }
				}).done(function( msg ) {
					if ( 'success' == msg.result ) {
						$('#repCont').val('');
						$('#repArea').html('');
						let repHtml = '';
						$.each(msg.data, function(i, reply){
							repHtml += '<li>(' + reply.write_date + ') ' + reply.content + '</li>';
						});
						$('#repArea').append(repHtml);
					} else {
						alert('서버 장애가 발생했습니다.잠시후 다시 시도해주세요.');
					}
				});
			});
			
			$(function(){
				$.ajax({
				  method: 'post'
				  ,url: '<c:url value="/board/free/getRep"/>'
				  ,data: {
					  	f_seq: '<c:out value="${free.seq }"/>'
				  }
				}).done(function( msg ) {
					if ( 'success' == msg.result ) {
						$('#repCont').val('');
						$('#repArea').html('');
						let repHtml = '';
						$.each(msg.data, function(i, reply){
							repHtml += '<li>(' + reply.write_date + ') ' + reply.content + '</li>';
						});
						$('#repArea').append(repHtml);
					} else {
						alert('서버 장애가 발생했습니다.잠시후 다시 시도해주세요.');
					}
				});
			});
			
			$('#btnDownload').on('click', function(){
				$('#seq2').val($(this).data('seq'));
				$('#frm2').submit();
			});
			
				
				
		</script>
		
		
		
		
		
		
		
		
		
	</body>
</html>