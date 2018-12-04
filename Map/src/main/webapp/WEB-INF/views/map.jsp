<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="//code.jquery.com/jquery.min.js"></script>

<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
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
    .title {font-weight:bold;display:block;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
	    <button id="toggle" class="btn btn-info">입력하기</button>
	</p>

	 <script type="text/javascript">
	 jQuery('#toggle').click(function () {  
		    if($("#footer").css("display") == "none"){   
		        $('#footer').slideDown();  	//보이게한다
		        document.getElementById("toggle").className = "btn btn-danger";
		        $("#toggle").html("취소");
		    } else {  
		        $('#footer').slideUp();  	//안 보이게한다
		        document.getElementById("toggle").className = "btn btn-info";
		        $("#toggle").html("입력");
		        infowindow.close();
		        userMarker.setMap(null);
		    }  
		}); 
	</script> 
	
	<div id="footer">
		<div class="container"> 
		<div class="row"> 
			<div class="col-md-12"> 
				<div class="page-header"> 
					<h1>마커 등록하기</h1> 
				</div> 
				<form method="POST" action="/markerInsert"> 
					<div class="col-xs-6"> 
						<div class="form-group"> 
							<label for="title">장소 이름</label> 
							<input type="text" class="form-control" id="title" name="title" placeholder="이름을 적어주세요."> 
						</div> 
					</div> 
					<div class="col-xs-6"> 
						<div class="form-group">
							<label for="category">카테고리</label> 
							<select class="form-control" id="category" name="category"> 
								<option value="음식">음식</option> 
								<option value="카페">카페</option> 
								<option value="오락">오락</option> 
								<option value="기타">기타</option> 
							</select> 
						</div> 
					</div> 
					<div class="col-xs-12"> 
						<div class="form-group"> 
							<label for="contents">설명</label> 
							<textarea class="form-control" id="contents" name="contents" rows="5" placeholder="설명을 적어주세요."></textarea> 
						</div> 
					</div> 
					<div class="col-xs-2"> 
						<div class="form-group"> 
							<label for="tel">전화번호</label> 
							<input type="text" class="form-control" id="tel" name="tel" placeholder="000-0000-0000"> 
						</div> 
					</div> 
					<div class="col-xs-5"> 
						<div class="form-group"> 
							<label for="road_address">도로명주소</label> 
							<input type="text" class="form-control" id="road_address" name="road_address" placeholder="서울특별시 마포구 상수동 와우산로 94"> 
						</div> 
					</div> 
					<div class="col-xs-5"> 
						<div class="form-group"> 
							<label for="address">지번주소</label> 
							<input type="text" class="form-control" id="address" name="address" placeholder="서울 마포구 상수동 72-1"> 
						</div> 
					</div> 
					<div class="form-group"> 
						<input type="hidden" id="x_coordinate" name="x_coordinate" value=""> 
					</div> 
					<div class="form-group">  
						<input type="hidden" id="y_coordinate" name="y_coordinate" value=""> 
					</div> 
					<div class="col-xs-12"> 
						<div class="form-group"> 
							<button type="submit" class="btn btn-info">입력</button> 
							<button type="button" class="btn btn-info" id="findingMarker">지번 주소로 마커 찾기</button>
						</div> 
					</div> 
				</form> 
			</div> 
		</div> 
	</div>
		
	</div>
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec5b3d5f8ba1f47ea94627cd7422ba47&libraries=services"></script>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.55087, 126.92555), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		var userMarker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		
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
					close.setAttribute("title", "닫기");
					
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
			    // 마커를 생성합니다
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
		            position: position, // 마커의 위치
		            title: category
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';

		            if($("#footer").css("display") != "none"){
			            // 마커를 클릭한 위치에 표시합니다 
			            userMarker.setPosition(mouseEvent.latLng);
			            userMarker.setMap(map);
			            
			            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
			            infowindow.setContent(content);
			            infowindow.open(map, userMarker);
		            }
		            
		            $('#x_coordinate').val(String(userMarker.getPosition().getLat()));
		            $('#y_coordinate').val(String(userMarker.getPosition().getLng()));
		            
					searchDetailAddrFromCoords(mouseEvent.latLng, displayCenterInfo);
		        }   
		    });
		});
		    
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		//비어있는지 아닌지 확인
		var isEmpty = function(value){ 
			if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
						return true 
					}else{ 
						return false 
				} 
			};
			
		// 주소 입력창에 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        for(var i = 0; i < result.length; i++) {
		        	if(isEmpty(result[i].road_address)){
		            	$('#road_address').val("");
		            	$('#address').val(result[i].address.address_name);
		            }else{
		            	$('#road_address').val(result[i].road_address.address_name);
		            	$('#address').val(result[i].address.address_name);
		            }
		                break;
		        }
		    }    
		}
	
		function findingMarker() {
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($('#address').val(), function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
	
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        userMarker.setPosition(coords);
	
				    searchDetailAddrFromCoords(coords, function(result, status) {
				        if (status === daum.maps.services.Status.OK) {
				            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
				            
				            var content = '<div class="bAddr">' +
				                            '<span class="title">주소정보</span>' + 
				                            detailAddr + 
				                        '</div>';

				            if($("#footer").css("display") != "none"){
					            
					            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					            infowindow.setContent(content);
					            infowindow.open(map, userMarker);
				            }
				            
							searchDetailAddrFromCoords(coords, displayCenterInfo);
				        }   
				    });
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 
		}   
		
		function validityCheck(){
			
		}
	
		document.getElementById('findingMarker').addEventListener('click', findingMarker); // 이벤트 연결
	</script>
		    
</body>
</html>