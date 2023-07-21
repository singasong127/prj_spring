<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html >
<html lang="ko" xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	layout:decorator="board/layout/defaultLayout">
<%@ include file="../include/head.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<body>
<div>
    <%@ include file="../include/header.jsp" %>
    <main>
        <div class="mainBox">
            <div class="mainContainer">
            <%--FORM CONTENT STARTS FROM HERE!!--%>
            <%--FORM CONTENT STARTS FROM HERE!!--%>
			<%--FORM CONTENT ENDS FROM HERE!!--%>
        	<%--FORM CONTENT ENDS FROM HERE!!--%>
        	<div class="map_wrap">
    			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;">
    				<!-- <ul id="category">
				        <li id="BK9" data-order="0"> 
				            <span class="category_bg bank"></span>
				            은행
				        </li>       
				        <li id="MT1" data-order="1"> 
				            <span class="category_bg mart"></span>
				            마트
				        </li>  
				        <li id="PM9" data-order="2"> 
				            <span class="category_bg pharmacy"></span>
				            약국
				        </li>  
				        <li id="OL7" data-order="3"> 
				            <span class="category_bg oil"></span>
				            주유소
				        </li>  
				        <li id="CE7" data-order="4"> 
				            <span class="category_bg cafe"></span>
				            카페
				        </li>  
				        <li id="CS2" data-order="5"> 
				            <span class="category_bg store"></span>
				            편의점
				        </li>      
				    </ul> -->
    			</div>

			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;" class="row g-3">
			                    <div class="d-flex">
			                    	<div class="col-auto">
					                    <input type="text" value="장기동" id="keyword" size="15" class="form-control form-control-sm"> 
			                    	</div>
			                    	<div class="col-auto">
					                    <button type="submit" class="btn btn-success btn-sm">검색하기</button> 
			                    	</div>
			                	</div>
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
	
	<th:block layout:fragment="title">
		<title>Weather</title>
	</th:block>

	<th:block layout:fragment="content">
	
	<label>날씨</label>

	<form class="form-horizontal">
		<div class="form-group">
			<select id="step1" class="emptyCheck" title="시/도">
				<option id="city" value="">시/도</option>
			</select>

			<select id="step2">
				<option id="county" value="">시/군/구</option>
			</select>

			<select id="step3">
				<option id="town" value="">읍/면/동</option>
			</select>

			<span>날짜 선택: <input type="text" id="datepicker" disabled="disabled" class="emptyCheck" title="날짜"></span>

			<select id="time" class="emptyCheck" title="시간">
				<option value="" selected>시간</option>
				<option th:each="i : \${#numbers.sequence(0,23)}" th:value="${i}" th:text="${i} + 시"></option>
			</select>

			<button type="button" class="btn btn-primary waves-effect waves-light" th:onclick="getWeather()">
				<span>실행</span>
			</button>

			<div>
				<table id="resultWeather" class="table"></table>
			</div>
		</div>
	</form>
	</th:block>

            </div>
        </div>
    </main>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54c60ae7f8e07cf5112b5b1d3980bd2d&libraries=services"></script>
<script type="text/javascript" src="/resources/team/js/kakaomap.js"></script>



<th:block layout:fragment="script">
	<script th:inline="javascript"><script type="text/javascript">
		/*<![CDATA[*/
		window.onload = function() {
			$('#datepicker').datepicker({
				showOn: 'button',
				buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
				buttonImageOnly: true,
				showButtonPanel: true,
				dateFormat: 'yymmdd',
				minDate: "-1D",
				maxDate: 0,
				closeText: "닫기",
				currentText: "오늘",
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				weekHeader: "주",
				yearSuffix: '년',
				showMonthAfterYear: true
			});
		};
        
		$('#datepicker').on("change", function(){
			$('#time option:eq(0)').prop("selected", true);
			var now = new Date();
			var currentHour = now.getHours();
			var month = (now.getMonth()+1) < 10 ? "0" + (now.getMonth()+1) : (now.getMonth()+1);
			var nowDate = now.getDate() < 10 ? "0" + now.getDate() : now.getDate();
			var today = now.getFullYear() + "" + month + "" + nowDate;
			var datepickerValue = $(this).val();

			/* 오늘 날짜라면 */
			$('#time').children('option:not(:first)').remove();
			var html = '';
			if (datepickerValue == today ){
				for (var i=0; i<=currentHour; i++){
					html += '<option value="'+ i +'">'+ i +'시</option>';
				}
			}
			/* 어제였다면 */
			else{
				if (currentHour != 23){
					for (var i=currentHour + 1; i<24; i++){
						html += '<option value="'+ i +'">'+ i +'시</option>';
					}
				}
				else{
					alert(datepickerValue + " 날짜의 제공 가능한 날씨 데이터가 없습니다.")
					$(this).val('');
				}
			}
			$('#time').append(html);
		});
	</script>
</th:block>

	
