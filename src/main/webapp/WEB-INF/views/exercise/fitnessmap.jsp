<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITRALPARK</title>
<%@ include file="/WEB-INF/views/common/asset.jsp" %>
    <style>
        body {
        background-color: rgb(218, 243, 211);
        
        }  
        .grid{
            display: grid;
		    grid-template-rows: 125px auto 1fr;
		    grid-template-columns: 1fr;
        }
        .grid_top{
        	/* border: 1px solid black; */
            grid-row: 1;
        }
        .grid_center{
        	/* border: 1px solid black; */
            grid-row: 2;
		    display: grid;
		    grid-template-columns: calc(50% - 424px) auto;
        }
        .grid_center_L{
        /* border: 1px solid black; */
        }
        .grid_center_R{
        /* border: 1px solid black; */
        	width: 1000px;
        }
        .grid_bottom{
        /* border: 1px solid black; */
            grid-row: 3;
        }
        
		#map {
			border: 2px solid white;
			border-radius: 5px;
			width: 1060px;
			height: 800px;
			margin-bottom: 20px;
		}
		
		#keyword {
			border: 1px solid black;
			border-radius: 3px;
		}
		
		button[type=submit] {
			border: 1px solid black;
			border-radius: 3px;
			background-color: #f2f2f2;
		}
		
		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255);z-index: 1;font-size:12px;border-radius: 10px; border: 2px solid black;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
		
    </style>
</head>
<body>
	<div class="grid">
	
		<div class="grid_top">

				<!-- 메인메뉴 -->
			    <%@ include file="/WEB-INF/views/common/header.jsp" %>
			    <!-- 오른쪽메뉴 -->
			    <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			    <!-- 왼쪽메뉴 -->
			    <%@ include file="/WEB-INF/views/common/left_menu1.jsp" %>
		</div>
		
		<div class="grid_center">
		
			<div class="grid_center_L"></div>
			
			<div class="grid_center_R">
				<!-- 컨텐츠페이지 -->
    			
    			<div class="map_wrap">
				    <div id="map" style="position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                    키워드 : <input type="text" value="역삼역 피트니스" id="keyword" size="15"> 
				                    <button type="submit">검색하기</button> 
				                </form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div> 
				</div>
				
			</div>
			
		</div>
		
		<div class="grid_bottom">
				<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ceabb00e227e1609c08780b00a4ecaa5&libraries=services"></script>
	<script type="text/javascript">TiaraTracker.getInstance()
    .setSvcDomain('apis.map.kakao.com')
    .setDeployment("production")
    .setEnableHash(true)
    .setSection('web')
    .setPage('sample_snippet')
    .trackPage('sample_snippet')
    .track();</script>
	<script type="text/javascript" src="//t1.daumcdn.net/mapapisdoc/cssjs/1741245086703/js/service.min.js"></script>
    <script>
	 	// 모든 메뉴 항목을 선택
	    const menuItems = document.querySelectorAll('.sf_submenu_1 div');
	
	    // 클릭 이벤트 추가
	    menuItems.forEach(item => {
	      item.addEventListener('click', () => {
	        // 모든 항목의 스타일 초기화
	        menuItems.forEach(menu => {
	          menu.classList.remove('active'); // active 클래스 제거
	          menu.style.backgroundColor = 'lightgray'; // 기본 배경색 설정
	          menu.style.fontWeight = 'normal'; // 기본 글씨 굵기 설정
	        });
	
	        // 클릭된 항목에 스타일 적용
	        item.classList.add('active'); // active 클래스 추가
	        item.style.backgroundColor = 'oldlace'; // 클릭된 항목 배경색 설정
	        item.style.fontWeight = 'bold'; // 클릭된 항목 글씨 굵게 설정
	      });
	    });
	    
	    // 마커를 담을 배열입니다
	    var markers = [];

	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	        mapOption = {
	            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 서울시청을 중심으로 설정
	            level: 3 // 지도의 확대 레벨
	        };  

	    // 지도를 생성합니다    
	    var map = new kakao.maps.Map(mapContainer, mapOption); 

	    // 장소 검색 객체를 생성합니다
	    var ps = new kakao.maps.services.Places();  

	    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	    // 키워드로 장소를 검색합니다
	    function searchPlaces() {
	        var keyword = document.getElementById('keyword').value;

	        if (!keyword.replace(/^\s+|\s+$/g, '')) {
	            alert('키워드를 입력해주세요!');
	            return false;
	        }

	        // 이전 마커 제거
	        removeMarker();
	        
	        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	        ps.keywordSearch(keyword, placesSearchCB, {
	            useMapBounds: true,  // 지도 영역을 검색 범위로 설정
	            page: 1,  // 페이지 번호
	            size: 15  // 한 페이지에 보여줄 결과 수
	        }); 
	    }

	    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	    function placesSearchCB(data, status, pagination) {
	        if (status === kakao.maps.services.Status.OK) {
	            // 검색 결과가 있을 때
	            displayPlaces(data);
	            displayPagination(pagination);
	        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	            alert('검색 결과가 존재하지 않습니다.');
	        } else if (status === kakao.maps.services.Status.ERROR) {
	            alert('검색 중 오류가 발생했습니다.');
	        }
	    }

	    // 검색 결과 목록과 마커를 표출하는 함수입니다
	    function displayPlaces(places) {
	        var listEl = document.getElementById('placesList');
	        var menuEl = document.getElementById('menu_wrap');
	        var fragment = document.createDocumentFragment();
	        var bounds = new kakao.maps.LatLngBounds();
	        
	        // 검색 결과 목록 초기화
	        removeAllChildNods(listEl);
	        
	        for (var i = 0; i < places.length; i++) {
	            // 마커 생성 및 표시
	            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
	            var marker = addMarker(placePosition, i);
	            
	            // 검색 결과 항목 생성
	            var itemEl = getListItem(i, places[i]);
	            
	            // 지도 범위 설정을 위한 좌표 추가
	            bounds.extend(placePosition);
	            
	            // 마커와 검색결과 항목에 이벤트 등록
	            (function(marker, title) {
	                // 마커에 마우스오버 이벤트 등록
	                kakao.maps.event.addListener(marker, 'mouseover', function() {
	                    displayInfowindow(marker, title);
	                });
	                
	                // 마커에 마우스아웃 이벤트 등록
	                kakao.maps.event.addListener(marker, 'mouseout', function() {
	                    infowindow.close();
	                });
	                
	                // 검색결과 항목에 마우스오버 이벤트 등록
	                itemEl.onmouseover = function() {
	                    displayInfowindow(marker, title);
	                };
	                
	                // 검색결과 항목에 마우스아웃 이벤트 등록
	                itemEl.onmouseout = function() {
	                    infowindow.close();
	                };
	            })(marker, places[i].place_name);
	            
	            fragment.appendChild(itemEl);
	        }
	        
	        // 검색결과 목록 추가
	        listEl.appendChild(fragment);
	        menuEl.scrollTop = 0;
	        
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정
	        map.setBounds(bounds);
	    }

	    // 검색결과 항목을 Element로 반환하는 함수입니다
	    function getListItem(index, places) {

	        var el = document.createElement('li'),
	        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                    '<div class="info">' +
	                    '   <h5>' + places.place_name + '</h5>';

	        if (places.road_address_name) {
	            itemStr += '    <span>' + places.road_address_name + '</span>' +
	                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
	        } else {
	            itemStr += '    <span>' +  places.address_name  + '</span>'; 
	        }
	                     
	          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                    '</div>';           

	        el.innerHTML = itemStr;
	        el.className = 'item';

	        return el;
	    }

	    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	    function addMarker(position, idx, title) {
	        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	            imgOptions =  {
	                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	            },
	            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	                marker = new kakao.maps.Marker({
	                position: position, // 마커의 위치
	                image: markerImage 
	            });

	        marker.setMap(map); // 지도 위에 마커를 표출합니다
	        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	        return marker;
	    }

	    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	    function removeMarker() {
	        for ( var i = 0; i < markers.length; i++ ) {
	            markers[i].setMap(null);
	        }   
	        markers = [];
	    }

	    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	    function displayPagination(pagination) {
	        var paginationEl = document.getElementById('pagination'),
	            fragment = document.createDocumentFragment(),
	            i; 

	        // 기존에 추가된 페이지번호를 삭제합니다
	        while (paginationEl.hasChildNodes()) {
	            paginationEl.removeChild (paginationEl.lastChild);
	        }

	        for (i=1; i<=pagination.last; i++) {
	            var el = document.createElement('a');
	            el.href = "#";
	            el.innerHTML = i;

	            if (i===pagination.current) {
	                el.className = 'on';
	            } else {
	                el.onclick = (function(i) {
	                    return function() {
	                        pagination.gotoPage(i);
	                    }
	                })(i);
	            }

	            fragment.appendChild(el);
	        }
	        paginationEl.appendChild(fragment);
	    }

	    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	    // 인포윈도우에 장소명을 표시합니다
	    function displayInfowindow(marker, title) {
	        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	        infowindow.setContent(content);
	        infowindow.open(map, marker);
	    }

	     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	    function removeAllChildNods(el) {   
	        while (el.hasChildNodes()) {
	            el.removeChild (el.lastChild);
	        }
	    }

	    // 페이지 로드 시 초기 검색 실행
	    window.onload = function() {
	        searchPlaces();
	    };

    </script>
    
</body>
</html>