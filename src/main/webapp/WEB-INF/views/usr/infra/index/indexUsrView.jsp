<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
   
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<title>project</title>
<%@ include file="../../include/includeView.jsp" %>

	<div id="info">
       <div id="search" class="mb-3">
           <form autocomplete="off">
               <input type="text" class="form-control" id="inputSearch" placeholder="식당 이름을 입력해주세요">
           </form>
           <button type="button" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
       </div>
       <div id="content">
           <div id="weather">
               <span>임시 텍스트</span>
               <ul>
                   <li>날씨</li>
                   <li>기온</li>
                   <li>기온차</li>
                   <li>미세먼지</li>
                   <li>초미세먼지</li>
               </ul>
           </div>
           <div id="favorites">
               <span>즐겨찾기</span>
           </div>
       </div>
   </div>
   <div id="bar">
       <span id="infoToggle"><i class="fa-solid fa-caret-left"></i></span>
   </div>
   
   <div id="map"></div>
   <div id="login"><a href="#">로그인</a></div>
   <div id="btnChat"><i class="fa-regular fa-comments"></i></div>

   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54c60ae7f8e07cf5112b5b1d3980bd2d&libraries=services"></script>
   <script type="text/javascript">
   		
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
		
		
		
	</script>
