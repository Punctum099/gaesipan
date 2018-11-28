<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
  #map {
            position: absolute;
            width: 100%;
            min-height: 100%;
            left: 0;
            top: 0;
        }
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: pre-line;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="map"></div>
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec5b3d5f8ba1f47ea94627cd7422ba47&libraries=drawing"></script>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.55087, 126.92555), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var markers = [];
		
		// 마커를 표시할 위치 객체 배열입니다 
		var positions = [
			<c:forEach items="${markerList}" var="marker" varStatus="index">
				{
			        latlng: new daum.maps.LatLng("${marker.x_coordinate}", "${marker.y_coordinate}"),
					category: "${marker.category}",
					content: '<div class="wrap">' + 
			        '    <div class="info">' + 
			        '        <div class="title">' + 
			        '            ${marker.title}' + 
			        '            <div class="close" onclick="closeOverlay();" title="닫기"></div>' + 
			        '        </div>' + 
			        '        <div class="body">' + 
			        '            <div class="img">' +
			        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        '           </div>' + 
			        '            <div class="desc">' + 
			        '                <div class="ellipsis">${marker.contents}</div>' + 
			        //'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			        //'                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			        '            </div>' + 
			        '        </div>' + 
			        '    </div>' +    
			        '</div>'
			    }<c:if test="${!index.last}">,</c:if>
			</c:forEach>
		];
		
		drawMarker();
		
		function drawMarker(){
			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = addMarker(positions[i].latlng, positions[i].category);
				
			    var overlay = new daum.maps.CustomOverlay({
				    content: positions[i].content,
				    map: map,
				    position: marker.getPosition()       
				});

			    overlay.setMap(null);
			    
			    daum.maps.event.addListener(marker, 'click', OpenOverlay(map, marker, overlay));
			}
		}

		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
			console.log((this).overlay);
		    (this).overlay.setMap(null);     
		}
		
		function OpenOverlay(map, marker, overlay) {
		    return function() {
		    	overlay.setMap(map);
		    };
		}
		
		function addMarker(position, category) {
		    		marker = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            title: category
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}
		
		var marker = new daum.maps.Marker({
		    map: map, 
		    position: new daum.maps.LatLng(33.450701, 126.570667)
		});
		
	</script>
		    
</body>
</html>