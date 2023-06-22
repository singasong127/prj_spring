<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>project</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/html/css/style.css">
    <script src="/resources/html/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/3ba321c6f5.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.jsappkey=54c60ae7f8e07cf5112b5b1d3980bd2d"></script>
    <script src="/resources/html/js/script.js"></script>
</head>
<body>
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

    <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>
