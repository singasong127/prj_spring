<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<title>project</title>
<%@ include file="../../include/includeView.jsp"%>
<div id="left_content">
	<div id="info">
		<div id="search" class="mb-3">
			<form autocomplete="off">
				<input type="text" class="form-control" id="inputSearch"
					placeholder="식당 이름을 입력해주세요">
			</form>
			<button type="button" id="btnSearch">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</div>
		<div id="content">
			<div id="weather">
				<h4>경기도 김포시</h4>
				<ul id="weather_info">
					<li class="w_info">흐림</li>
					<li class="w_info">30℃</li>
					<li class="w_info">어제보다 0℃ 낮아요</li>
					<li class="w_info">미세먼지: 보통</li>
				</ul>
			</div>
			<div id="favorites">
				<h4>즐겨찾기</h4>
				<ul id="favorlist">
					<li>맛있는 식당</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="bar">
		<span id="infoToggleHide"><i class="fa-solid fa-caret-left"></i></span>
		<span id="infoToggleShow"><i class="fa-solid fa-caret-right"></i></span>
	</div>
</div>

<div id="map"></div>
<div id="login">
	<c:choose>
		<c:when test="${not empty sessionId }">
			<a class="nav-link" href="#" role="button" data-bs-toggle="dropdown"
				aria-expanded="false" id="profile" style="color: #000;"> <i
				class="mdi mdi-account"></i>
			</a>

			<ul class="dropdown-menu">
				<li><a href="./app-profile.html" class="dropdown-item"> <i
						class="icon-user"></i> <span class="ml-2">프로필 </span>
				</a></li>
				<li><a href="/user" class="dropdown-item" id="btnLogout"> <i
						class="icon-key"></i> <span class="ml-2">로그아웃 </span>
				</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
		</c:otherwise>
	</c:choose>
</div>
<div id="btnChat">
	<i class="fa-regular fa-comments"></i>
</div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54c60ae7f8e07cf5112b5b1d3980bd2d&libraries=services"></script>
<script type="text/javascript" src="/resources/js/kakaomap.js"></script>
<script type="text/javascript">
	// 기타 기능
	$("#infoToggleHide").on("click", function() {
		$("#info").fadeOut();
		$("#infoToggleHide").css("display", "none");
		$("#infoToggleShow").css("display", "flex");
	});

	$("#infoToggleShow").on("click", function() {
		$("#info").fadeIn();
		$("#infoToggleHide").css("display", "flex");
		$("#infoToggleShow").css("display", "none");
	});

	$("#btnLogin").on("click", function() {

		location.href = "/loginusr";

	});

	$("#btnLogout").on(
			"click",
			function() {
				$.ajax({
					async : true,
					cache : false,
					type : "post",
					url : "/logoutUsrProc",
					data : {},
					success : function(response) {
						location.href = "/user"
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("ajaxUpdate " + jqXHR.textStatus + " : "
								+ jqXHR.errorThrown);
					}
				});
			});
</script>
