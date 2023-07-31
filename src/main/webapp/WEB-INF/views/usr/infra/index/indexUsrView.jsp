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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

<title>유저 메인</title>
<%@ include file="../../include/includeView.jsp"%>
<div id="left_content">
	<div id="info">
		<div id="search" class="mb-3">
			<form autocomplete="on" class="d-flex" onsubmit="searchPlaces(); return false;">
				<input type="text" class="form-control" id="keyword"
					placeholder="식당 이름을 입력해주세요" value="" >
				<!-- <button type="submit" id="btnSearch">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button> -->
			</form>
		</div>
		<div id="main_content">
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
			<div id="list" class="bg_white">
		        <div class="option"></div>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
		<div id="list_detail">
			<div id="detail_top">
				<button type="button" class="btn-success btn" id="btnToList"
					style="color: #fff"><i class="fa-solid fa-bars"></i></button>
				<h5 id="diningName"></h5>
				<button type="button" class="btn-primary btn-sm" id="btnWait">대기하기</button>
			</div>
				<span class="ratingScore" id="detail_rating">5.0</span>
			<div id="detail_img">
				<ul>
					<li class="image">
						<img alt="" src="">img1
					</li>
					<li class="image">
						<img alt="" src="">img2
					</li>
					<li class="image">
						<img alt="" src="">img3
					</li>
					<li class="image">
						<img alt="" src="">img4
					</li>
				</ul>
			</div>
			<div id="detail_tag">
				<span class="tag btn-sm btn-primary">#</span>
				<span class="tag btn-sm btn-primary">#</span>
				<span class="tag btn-sm btn-primary">#</span>
			</div>
			<div id="detail_info">
				<ul class="dinfo d-flex">
					<li class="dinfo_label mr-2">영업 시간  </li>
					<li class="dinfo_desc">AM 10:00 ~ PM 08:00</li>
				</ul>
				<ul class="dinfo">
					<li class="dinfo_label">주소  </li>
					<li class="dinfo_desc" id="diningAddress"></li>
				</ul>
				<ul class="dinfo d-flex">
					<li class="dinfo_label mr-2">전화번호  </li>
					<li class="dinfo_desc" id="diningPhone"></li>
				</ul>
				<ul class="dinfo d-flex">
					<li class="dinfo_label" id="nowWaitLabel">현재 대기 번호  </li>
					<li class="dinfo_desc"><div class="wait">0</div></li>
				</ul>
			</div>
			<div id="detail_menu">
				<div class="menu_list">
					<figure class="menu_img">
						<img src="" alt="">
						<figcaption class="menu_name">음식 이름</figcaption>
					</figure>
				</div>
				<div class="menu_list">
					<figure class="menu_img">
						<img src="" alt="">
						<figcaption class="menu_name">음식 이름</figcaption>
					</figure>
				</div>
				<div class="menu_list">
					<figure class="menu_img">
						<img src="" alt="">
						<figcaption class="menu_name">음식 이름</figcaption>
					</figure>
				</div>
				<div class="menu_list">
					<figure class="menu_img">
						<img src="" alt="">
						<figcaption class="menu_name">음식 이름</figcaption>
					</figure>
				</div>
			</div>
			<div id="review">
				<div class="review_list">
					<div class="user_img"></div>
					<div class="review_desc">
						<span class="review_usrName">유저 이름</span>
						<span class="review_rating">5.0</span>
						<p>리뷰 내용</p>
						<span class="review_time">00:00</span>
					</div>
				</div>
				<div id="review_textarea">
					<textarea name="rv_textarea" id="rv_textarea" class="form-control" placeholder="내용을 입력해주세요."></textarea>
					<!-- <button type="button" class="btn btn-primary" id="btnReview" 
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">리뷰 남기기</button> -->
				</div>
			</div>
		</div>
	</div>
	<div id="bar">
		<span id="infoToggleHide"><i class="fa-solid fa-caret-left"></i></span>
		<span id="infoToggleShow"><i class="fa-solid fa-caret-right"></i></span>
	</div>
</div>

<div id="map" style="width: 100%; height: 100%;"></div>
<div id="login">
	<c:choose>
		<c:when test="${not empty sessionId }">
			<a class="nav-link" href="#" role="button" data-bs-toggle="dropdown"
				aria-expanded="false" id="profile" style="color: #000;"> <i
				class="mdi mdi-account"></i>
			</a>

			<ul class="dropdown-menu">
				<li><a href="/profileusr" class="dropdown-item"> <i
						class="icon-user"></i> <span class="ml-2">프로필 </span>
				</a></li>
				<li><a href="/user" class="dropdown-item" id="btnLogout"> <i
						class="icon-key"></i> <span class="ml-2">로그아웃 </span>
				</a></li>
			</ul>
			<a href="#" class="wait" id="waitNum" role="button" data-bs-toggle="dropdown" aria-expanded="false">0</a>
			<ul class="dropdown-menu" id="waiting">
				<li class="dropdown-item d-flex justify-content-center">
					<span class="fs-5">맛있는 식당</span>
				</li>
				<li class="dropdown-item">
					<img alt="" src="" id="vw_img">
				</li>
				<li class="dropdown-item">
					<span class="fs-6">영업 시간</span>
				</li>
				<li class="dropdown-item">
					<span class="fs-6">AM 10:00 ~ PM 08:00</span>
				</li>
				<li class="dropdown-item d-flex">
					<span class="fs-6">현재 대기 번호 </span>
					<div class="wait ml-3">0</div>
				</li>
				<li class="dropdown-item">
					<button type="button" class="btn btn-primary mx-auto" id="btnReview" 
						data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰 남기기</button>
				</li>
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
<div id="chat">
	
</div>

<!-- Modal -->
<div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" 
	aria-labelledby="reviewModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="reviewModalLabel">리뷰</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <div class="mb-3">
            <label for="reviewText" class="col-form-label mx-auto">식당에 대한 리뷰를 남겨주세요!</label>
            <div class="rating mx-auto my-2">
            	<span class="rating_result"></span> 
			    <i class="rating_star far fa-star"></i>
			    <i class="rating_star far fa-star"></i>
			    <i class="rating_star far fa-star"></i>
			    <i class="rating_star far fa-star"></i>
			    <i class="rating_star far fa-star"></i>
			</div>
            <textarea class="form-control" id="reviewText"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54c60ae7f8e07cf5112b5b1d3980bd2d&libraries=services"></script>
<script type="text/javascript" src="/resources/js/kakaomap.js"></script>
<script type="text/javascript">
	// 기타 기능
	
	// 별점 소스
	const ratingStars = [...document.getElementsByClassName("rating_star")];
	
	const ratingResult = document.querySelector(".rating_result");

	printRatingResult(ratingResult);

	function executeRating(stars, result) {
	   const starClassActive = "rating_star fas fa-star";
	   const starClassUnactive = "rating_star far fa-star";
	   const starsLength = stars.length;
	   let i;
	   stars.map((star) => {
	      star.onclick = () => {
	         i = stars.indexOf(star);

	         if (star.className.indexOf(starClassUnactive) !== -1) {
	            printRatingResult(result, i + 1);
	            for (i; i >= 0; --i) stars[i].className = starClassActive;
	         } else {
	            printRatingResult(result, i);
	            for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
	         }
	      };
	   });
	}

	function printRatingResult(result, num = 0) {
	   result.textContent = `${num}/5`;
	}

	executeRating(ratingStars, ratingResult);
	
	
	$("#btnToList").on("click", function() {
		$('#list_detail').css('display', 'none');
		$('#main_content').css('display', 'block');
	});
		
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
