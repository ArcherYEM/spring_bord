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
	<div style="text-align:center; margin-top:60px">
		<h1>자유게시판</h1>
	</div>
	<div style="width: 850px; border: 2px solid blue; margin:0 auto;">
		<ul>
			<li>순번 : <c:out value="${free.seq }" /></li>
			<li>제목 : <c:out value="${free.title }" /></li>
			<li>내용<br>
			<pre style="width: 800px; white-space: pre-wrap; word-wrap: break-word;"><c:out value="${free.content }" /></pre>
			</li>
			<li>작성자 : <c:out value="${free.writer }" /></li>
			<li>작성일시 : <c:out value="${free.write_date2 }" /></li>
			<li>좋아요 : <c:out value="${free.rec_cnt }" /></li>
			<li>싫어요 : <c:out value="${free.nrec_cnt }" /></li>
		</ul>
	</div>
	<div style="text-align:center;">
		<span style="margin:60px; font-size:50px; color:blue;">
			<img id="btnRec" src="<c:url value='/cdn/images/rec_cnt.png'/>" style="width:100px;">
			<span id="spanRecCnt"><c:out value="${free.rec_cnt }"/></span>
		</span>
		<span style="margin:60px; font-size:50px; color:red;">
			<img id="btnNRec" src="<c:url value='/cdn/images/nrec_cnt.png'/>" style="width:100px;">
			<span id="spanNRecCnt"><c:out value="${free.nrec_cnt }"/></span>
		</span>
	</div>
	<div style="text-align:center; margin-top:50px">
		<input style="margin-right:30px;" type="button" id="btnUpd" value="수정" />
		<input style="margin-left:30px;" type="button" id="btnDel" value="삭제" />
	</div>
	<form id="frm1" action="<c:url value='/board/free/delete' />"
		method="post">
		<input type="hidden" id="seq" name="seq">
	</form>
	<script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
	<script>
		document.getElementById('btnUpd').addEventListener('click', function() {
			location.href = "<c:url value='/board/free/updateView?seq=${free.seq }' />";
		});
		document
				.getElementById('btnDel')
				.addEventListener(
						'click'
						,function() {
							if (confirm('해당 게시글을 삭제하시겠습니까?')) {
								document.getElementById('seq').value = '<c:out value="${free.seq }" />';
								document.getElementById('frm1').submit();
							}
						});
		
		document.getElementById('btnRec').addEventListener('click', function() {
			$.ajax({
  			method: "post"
  			,url: "<c:url value='/board/free/updateRec'/>"
  			,data: {
  				seq: "<c:out value='${free.seq }'/>"
  	  			,recYN: "Y" 
  				}
			}).done(function( msg ) {
			    if ('success' == msg.result){
			    	$('#spanRecCnt').html(msg.data.rec_cnt);
			    	$('#spanNRecCnt').html(msg.data.nrec_cnt);
			    } else {
			    	alert('서버 장애가 발생했습니다. 잠시후 다시 시도해 주세요');
			    }
				});
		  });
		
		document.getElementById('btnNRec').addEventListener('click', function() {
		    $.ajax({
		        method: "post",
		        url: "<c:url value='/board/free/updateRec'/>",
		        data: { 
		            seq: "<c:out value='${free.seq }'/>",
		            recYN: "N" 
		        }
		    })
		    .done(function(msg) {
	        if ('success' == msg.result){
			    	$('#spanRecCnt').html(msg.data.rec_cnt);
			    	$('#spanNRecCnt').html(msg.data.nrec_cnt);
			 	  } else {
			    	alert('서버 장애가 발생했습니다. 잠시후 다시 시도해 주세요');
			    }
		    });
		});

	</script>
</body>
</html>