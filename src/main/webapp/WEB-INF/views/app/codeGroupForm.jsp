<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<link href="/resources/admin/css/style.css" rel="stylesheet">

<form name="form" method="post">
	<input type="text" name="cgSeq" id="cgSeq" value="<c:out value="${item.cgSeq }"/>">
	<input type="text" name="cgName" id="cgName" value="<c:out value="${item.cgName }"/>">
	<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
	<button type="button" class="btn btn-danger" id="btnUelete">Uelete</button>
	<button type="button" class="btn btn-success" id="btnInsert">등록</button>
	<button type="button" class="btn btn-success" id="btnUpdate">저장</button>
	<button type="button" class="btn btn-primary" id="btn">검색</button>
</form>

<script src="/resources/admin/vendor/global/global.min.js"></script>
<script src="/resources/admin/js/quixnav-init.js"></script>
<script src="/resources/admin/js/custom.min.js"></script>

<script type="text/javascript">

	$("#btnUpdate").on("click", function() {
		
		$("form[name=form]").attr("action", "/cgupdate").submit();
		
	});
	
	$("#btnUelete").on("click", function() {
		
		$("form[name=form]").attr("action", "/cguelect").submit();
		
	});
	
	$("#btnDelete").on("click", function() {
		
		$("form[name=form]").attr("action", "/cgdelete").submit();
		
	});
	
	$("#btnInsert").on("click", function() {
		
		$("form[name=form]").attr("action", "/cginsert").submit();
		
	});

</script>

