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
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.55087, 126.92555), // ������ �߽���ǥ
		        level: 4, // ������ Ȯ�� ����
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // ��������
		    }; 

		// ������ �����Ѵ� 
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
		
		// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
		var positions = [
		    {
		        title: 'īī��', 
		        latlng: new daum.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        title: '���¿���', 
		        latlng: new daum.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        title: '�Թ�', 
		        latlng: new daum.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        title: '�ٸ�����',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
		    }
		];
		    
		for (var i = 0; i < positions.length; i ++) {
		    // ��Ŀ�� �����մϴ�
		    var marker = new daum.maps.Marker({
		        map: map, // ��Ŀ�� ǥ���� ����
		        position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
		        title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
		    });
		}
		
		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.55087, 126.92555), // ��Ŀ�� ��ǥ
		    draggable : true, // ��Ŀ�� �巡�� �����ϵ��� �����Ѵ�
		    map: map // ��Ŀ�� ǥ���� ���� ��ü
		});

		// ��Ŀ ���� ǥ���� ���������츦 �����Ѵ�
		var infowindow = new daum.maps.InfoWindow({
		    content : '<div style="padding:5px;">���������� :D</div>' // ���������쿡 ǥ���� ����
		});

		// ���������츦 ������ ǥ���Ѵ�
		infowindow.open(map, marker);

		// ��Ŀ�� Ŭ�� �̺�Ʈ�� ����Ѵ� (��Ŭ�� : rightclick)
		daum.maps.event.addListener(marker, 'click', function() {
		    alert('��Ŀ�� Ŭ���߽��ϴ�!');
		});

		// ��Ŀ�� mouseover �̺�Ʈ�� ����Ѵ�
		daum.maps.event.addListener(marker, 'mouseover', function() {
		    console.log('��Ŀ�� mouseover �̺�Ʈ�� �߻��߽��ϴ�!');
		});

		// ��Ŀ�� mouseout �̺�Ʈ ���
		daum.maps.event.addListener(marker, 'mouseout', function() {
		    console.log('��Ŀ�� mouseout �̺�Ʈ�� �߻��߽��ϴ�!');
		});
		
		// ���� �߽� ��ǥ ��ȭ �̺�Ʈ�� ����Ѵ�
		daum.maps.event.addListener(map, 'center_changed', function () {
			console.log('������ �߽� ��ǥ�� ' + map.getCenter().toString() +' �Դϴ�.');
		});
		
		daum.maps.event.addListener(map, 'center_changed', function () {
			console.log(marker.getPosition());
		});
		
		// Ŀ���� �������̸� �����ϰ� ������ ǥ���Ѵ�
		var customOverlay = new daum.maps.CustomOverlay({
			map: map,
			content: '<div style="padding:0 5px;background:#fff;">+</div>', 
			position: new daum.maps.LatLng(37.55087, 126.92555), // Ŀ���� �������̸� ǥ���� ��ǥ
			xAnchor: -0.7, // �������� x ��ġ
			yAnchor: -7 // �������� y ��ġ
		});
		
	</script>
	
	<table class="ui celled table">
				<c:forEach var="marker" items="${markerList}">
			        <tr>
			            <td>�� ��ȣ : ${marker.seq}</td>
			        </tr>
			        <tr>
			            <td>x ��ǥ : ${marker.x_coordinate}</td>
			        </tr>
			        <tr>
			            <td>y ��ǥ : ${marker.y_coordinate}</td>
			        </tr>
			        <tr>
			            <td>ī�װ� : ${marker.category}</td>
			        </tr>
			    </c:forEach>
	</table>
		    
</body>
</html>