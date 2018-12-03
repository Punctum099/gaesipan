<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="//code.jquery.com/jquery.min.js"></script>

<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap.min-theme.css" rel="stylesheet" type="text/css">
<link href="/css/semantic.min.css" rel="stylesheet" type="text/css">

<script src="/js/bootstrap.min.js" type="text/javascript"></script>

<style type="text/css">
  #map {
            position: absolute;
            width: 100%;
            min-height: 100%;
            left: 0;
            top: 0;
        }
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
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
    .modes {position: absolute;top: 20px;right: 30px;z-index: 1;}
    .A {position: absolute;top: 5px;right: 10px;z-index: 1;}
	#footer {
	   position: fixed;
	   bottom:0px;
	   height:500px;
	   width:100%;
	   background:white;
	   color: black;
	   z-index: 1;
	   display: none;
	}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

	<div id="map"></div> 
	   
	<p class="modes">
	    <button id="toggle" class="btn btn-info">�Է��ϱ�</button>
	</p>

	 <script type="text/javascript">
		 jQuery('#toggle').click(function () {  
		    if($("#footer").css("display") == "none"){   
		        $('#footer').slideDown();  
		    } else {  
		        $('#footer').slideUp();  
		    }  
		}); 
	</script> 
	
	<div id="footer">
		<div class="container"> 
		<div class="row"> 
			<div class="col-md-12"> 
				<div class="page-header"> 
					<h1>��Ŀ ����ϱ�</h1> 
				</div> 
				<form> 
					<div class="col-xs-6"> 
						<div class="form-group"> 
							<label for="title">��� �̸�</label> 
							<input type="text" class="form-control" id="title"placeholder="�̸��� �����ּ���."> 
						</div> 
					</div> 
					<div class="col-xs-6"> 
						<div class="form-group">
							<label for="category">ī�װ�</label> 
							<select class="form-control" id="category"> 
								<option value="����">����</option> 
								<option value="ī��">ī��</option> 
								<option value="����">����</option> 
								<option value="��Ÿ">��Ÿ</option> 
							</select> 
						</div> 
					</div> 
					<div class="col-xs-12"> 
						<div class="form-group"> 
							<label for="contents">����</label> 
							<textarea class="form-control" id="contents" rows="5"placeholder="������ �����ּ���."></textarea> 
						</div> 
					</div> 
					<div class="col-xs-2"> 
						<div class="form-group"> 
							<label for="tel">��ȭ��ȣ</label> 
							<input type="text" class="form-control" id="tel" placeholder="000-0000-0000"> 
						</div> 
					</div> 
					<div class="col-xs-5"> 
						<div class="form-group"> 
							<label for="road_address">���θ��ּ�</label> 
							<input type="text" class="form-control" id="road_address" placeholder="����Ư���� ������ ����� �Ϳ��� 94"> 
						</div> 
					</div> 
					<div class="col-xs-5"> 
						<div class="form-group"> 
							<label for="address">�����ּ�</label> 
							<input type="text" class="form-control" id="address" placeholder="���� ������ ����� 72-1"> 
						</div> 
					</div> 
					<div class="form-group"> 
						<input type="hidden" id="x_coordinate" value=""> 
					</div> 
					<div class="form-group">  
						<input type="hidden" id="y_coordinate" value=""> 
					</div> 
					<div class="col-xs-12"> 
						<div class="form-group"> 
							<button type="submit" class="btn btn-info">�Է�</button> 
						</div> 
					</div> 
				</form> 
			</div> 
		</div> 
	</div>
		
	</div>
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec5b3d5f8ba1f47ea94627cd7422ba47&libraries=drawing"></script>
	
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.55087, 126.92555), // ������ �߽���ǥ
		        level: 3, // ������ Ȯ�� ����
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // ��������
		    }; 

		// ������ �����Ѵ� 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var markers = [];
		
		var positions = [
			<c:forEach items="${markerList}" var="marker" varStatus="index">
				{
			        latlng: null,
					category: null,
					overlay: null
			    }<c:if test="${!index.last}">,</c:if>
			</c:forEach>
		];
			<c:forEach items="${markerList}" var="marker" varStatus="index">
					positions[${index.index}].latlng = new daum.maps.LatLng("${marker.x_coordinate}", "${marker.y_coordinate}");
					positions[${index.index}].category = "${marker.category}";
					
					positions[${index.index}].overlay = new daum.maps.CustomOverlay({});
					
					var wrap = document.createElement('div');
					wrap.setAttribute("class", "wrap");
					
					var info = document.createElement('div');
					info.setAttribute("class", "info");
					
					var title = document.createElement('div');
					title.setAttribute("class", "title");
					
					var close = document.createElement('div');
					close.setAttribute("class", "close");
					close.onclick = function() {positions[${index.index}].overlay.setMap(null);};
					close.setAttribute("title", "�ݱ�");
					
					var body = document.createElement('div');
					body.setAttribute("class", "body");
					
					var img = document.createElement('div');
					img.setAttribute("class", "img");
					
					var img_img = document.createElement('img');
					img_img.setAttribute("src", "http://cfile181.uf.daum.net/image/250649365602043421936D");
					img_img.setAttribute("width", "73");
					img_img.setAttribute("height", "70");
					
					var desc = document.createElement('div');
					desc.setAttribute("class", "desc");
					
					var ellipsis = document.createElement('div');
					ellipsis.setAttribute("class", "ellipsis");
					
					var tel = document.createElement('div');
					tel.setAttribute("class", "jibun ellipsis");

					var jibun_ellipsis = document.createElement('div');
					jibun_ellipsis.setAttribute("class", "jibun ellipsis");

					var road_ellipsis = document.createElement('div');
					road_ellipsis.setAttribute("class", "jibun ellipsis");
					
					title.appendChild(document.createTextNode("${marker.title}"));
					ellipsis.appendChild(document.createTextNode("${marker.contents}"));
					tel.appendChild(document.createTextNode("${marker.tel}"));
					jibun_ellipsis.appendChild(document.createTextNode("${marker.address}"));
					road_ellipsis.appendChild(document.createTextNode("${marker.road_address}"));
					
			        desc.appendChild(ellipsis);
			        desc.appendChild(tel);
			        desc.appendChild(jibun_ellipsis);
			        desc.appendChild(road_ellipsis);
			        img.appendChild(img_img);
			        body.appendChild(img);
			        body.appendChild(desc);
			        title.appendChild(close);
			        info.appendChild(title);
			        info.appendChild(body);
			        wrap.appendChild(info);
					
					positions[${index.index}].overlay.setContent(wrap);
					positions[${index.index}].overlay.setMap(map);
			</c:forEach>
		
		drawMarker();
		
		function drawMarker(){
			for (var i = 0; i < positions.length; i ++) {
			    // ��Ŀ�� �����մϴ�
			    var marker = addMarker(positions[i].latlng, positions[i].category);
				
			    var customOverlay = positions[i].overlay;
			    
			    customOverlay.setPosition(marker.getPosition());

			    customOverlay.setMap(null);
			    
			    daum.maps.event.addListener(marker, 'click', OpenOverlay(map, marker, customOverlay));
			}
		}
		
		function CloseOverlay(overlay) {
		    return function() {
		    	overlay.setMap(null);
		    };
		}
		
		function OpenOverlay(map, marker, overlay) {
		    return function() {
		    	overlay.setMap(map);
		    };
		}
		
		function addMarker(position, category) {
		    		marker = new daum.maps.Marker({
		            position: position, // ��Ŀ�� ��ġ
		            title: category
		        });

		    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
		    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

		    return marker;
		}
		
		var marker = new daum.maps.Marker({
		    map: map, 
		    position: new daum.maps.LatLng(33.450701, 126.570667)
		});
		
	</script>
		    
</body>
</html>