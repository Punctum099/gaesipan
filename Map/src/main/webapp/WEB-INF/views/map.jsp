<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:750px;height:350px;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec5b3d5f8ba1f47ea94627cd7422ba47"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.55087, 126.92555), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 

		var SeqList = new Array();
		var XList = new Array();
		var YList = new Array();
		var CategoryList = new Array();
		
		<c:forEach items="${markerList}" var="marker">
			SeqList.push("${marker.seq}");
			XList.push("${marker.x_coordinate}");
			YList.push("${marker.y_coordinate}");
			CategoryList.push("${marker.category}");
		</c:forEach>
		
		for(var i = 0; i < SeqList.length; i++){
			console.log(SeqList[i]);
			console.log(XList[i]);
			console.log(YList[i]);
			console.log(CategoryList[i]);
		}
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
		    {
		        title: '카카오', 
		        latlng: new daum.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        title: '생태연못', 
		        latlng: new daum.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        title: '텃밭', 
		        latlng: new daum.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        title: '근린공원',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
		    }
		];
		    
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		    });
		}
		
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.55087, 126.92555), // 마커의 좌표
		    draggable : true, // 마커를 드래그 가능하도록 설정한다
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new daum.maps.InfoWindow({
		    content : '<div style="padding:5px;">인포윈도우 :D</div>' // 인포윈도우에 표시할 내용
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		daum.maps.event.addListener(marker, 'click', function() {
		    alert('마커를 클릭했습니다!');
		});

		// 마커에 mouseover 이벤트를 등록한다
		daum.maps.event.addListener(marker, 'mouseover', function() {
		    console.log('마커에 mouseover 이벤트가 발생했습니다!');
		});

		// 마커에 mouseout 이벤트 등록
		daum.maps.event.addListener(marker, 'mouseout', function() {
		    console.log('마커에 mouseout 이벤트가 발생했습니다!');
		});
		
		// 지도 중심 좌표 변화 이벤트를 등록한다
		daum.maps.event.addListener(map, 'center_changed', function () {
			console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
		});
		
		daum.maps.event.addListener(map, 'center_changed', function () {
			console.log(marker.getPosition());
		});
		
		// 커스텀 오버레이를 생성하고 지도에 표시한다
		var customOverlay = new daum.maps.CustomOverlay({
			map: map,
			content: '<div style="padding:0 5px;background:#fff;">+</div>', 
			position: new daum.maps.LatLng(37.55087, 126.92555), // 커스텀 오버레이를 표시할 좌표
			xAnchor: -0.7, // 컨텐츠의 x 위치
			yAnchor: -7 // 컨텐츠의 y 위치
		});
		
	</script>
	
	<table class="ui celled table">
				<c:forEach var="marker" items="${markerList}">
			        <tr>
			            <td>핑 번호 : ${marker.seq}</td>
			        </tr>
			        <tr>
			            <td>x 좌표 : ${marker.x_coordinate}</td>
			        </tr>
			        <tr>
			            <td>y 좌표 : ${marker.y_coordinate}</td>
			        </tr>
			        <tr>
			            <td>카테고리 : ${marker.category}</td>
			        </tr>
			    </c:forEach>
	</table>
		    
</body>
</html>