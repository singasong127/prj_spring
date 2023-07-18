// 카카오맵 api 스크립트


	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
 	        center: new kakao.maps.LatLng(37.63973003, 126.6713378), // 지도의 중심좌표
 	        draggable: true,
 	        level: 3 // 지도의 확대 레벨
 	    };

   	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   	
   	function setDraggable(draggable) {
   	    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
   	    map.setDraggable(draggable);    
   	}
   	
   	map.setCopyrightPosition(kakao.maps.CopyrightPosition.BOTTOMRIGHT, true);
   	
 	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
   	var zoomControl = new kakao.maps.ZoomControl();
   	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
   	var center = map.getCenter().toString();
   	
   	console.log(center);
   	
   	// 주소-좌표 간 변환 서비스 객체 생성
   	var geocoder = new kakao.maps.services.Geocoder();
   	
   	var cbGeo = function(result, status) {
   	    if (status === kakao.maps.services.Status.OK) {
   	        console.log(result);
   	    }
   	};

   	geocoder.addressSearch('김포시 장기동', cbGeo);
   	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
   	// 카테고리 코드 검색
   	var cbPl = function(result, status) {
   	    if (status === kakao.maps.services.Status.OK) {
   	        console.log(result);
   	    }
   	};

   	// 문화시설 코드 검색
   	ps.categorySearch('CT1', cbPl, {
   	    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
   	    location: new kakao.maps.LatLng(37.63973003, 126.6713378)
   	});
   	
   	
   	// 키워드로 검색
   	ps.keywordSearch(document.getElementById("inputSearch").value, placesSearchCB);
   	
   	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
    	if (status === kakao.maps.services.Status.OK) {

        	// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        	// LatLngBounds 객체에 좌표를 추가합니다
        	var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}


