<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.CareBoard"%>
<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/carezone.css">
</head>
<!--  <form onsubmit="searchPlaces(); return false;"></form> -->
<body>
<%
Member member = (Member)session.getAttribute("member");
String care_id = "";
if(member!=null){care_id = member.getMem_id();
}else{care_id = "로그인먼저하세요";}

List<CareBoard> careList = (List<CareBoard>)request.getAttribute("careList");

%>

	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="대의동" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	
	
	<!-- 클릭한 좌표의 위도, 경도 넘겨주는 폼태그 -->
	<form action="insertAddress.do" method="post">
	<!-- 나중에 이거 전부 hidden으로 바꿀것 -->
		급식소 이름 : <input type="text" name="care_name" placeholder=" ex) OO고양터"> <br>
		<input type="text" name="care_addr"> <br>
		<input type="text" name="care_latitude"> <br>
		<input type="text" name="care_longitude"> <br>
		<input type="text" name="care_id" value=<%=care_id%> readonly> <br>

		<input type="submit" value="급식소 등록하기">
	</form>

	<!-- 주소 -->
	<span id="centerAddr"></span>
	<div id="result"></div>



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a2cd6f2777e0f89378c802f40822eb3&libraries=services"></script>
	<script>
		//마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		//키워드로 장소를 검색합니다
		searchPlaces();

		//키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		//-------------검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'),
			menuEl = document.getElementById('menu_wrap'),
			fragment = document.createDocumentFragment(),
			bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,places[i].x),
				marker = addMarker(placePosition, i),
				itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		} //-------------검색 결과 목록과 마커를 표출하는 함수끝!!

		//검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'upload/cat_icon2.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 36),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 36), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		//지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
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

		//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		//인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		//----------------------------------------------------------클릭시 좌표생성 함수----------------------------------------------------------
		//지도에 클릭 이벤트를 등록합니다
		//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			var message = '클릭한 위치의 좌표 (경도,위도) : ' + latlng.getLat() + ', '+ latlng.getLng();
			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;
			//input태그 내에 경도, 위도 넣기
			$('input[name=care_latitude]').val(latlng.getLat());
			$('input[name=care_longitude]').val(latlng.getLng());
			

		});

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					
					//틈새공략으로 input태그에 상세주소값 넣기
					$('input[name=care_addr]').val(result[0].road_address.address_name)		
					
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">' +

					detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
					
					
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');
				

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
				
				//
			}
		}

		//----------------------------------------목록에있는 주소들 차례로 마킹하는 함수
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,places[i].x),
				 marker = addMarker(placePosition, i)	// ----------------------------------------------------------------------------------얘는 지워야됨.. 고양터아니고 그냥 동 표시 위한것
				itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'click', (function(
							placePosition) {
						displayInfowindow(marker, title);
						return function() {
							// 좌표정보를 파싱하기 위해 hidden input에 값 지정
							$("#latitude").val(placePosition.La);
							$("#longitude").val(placePosition.Ma);
							$("#placeName").val(title);
							// #result 영역에 좌표정보 출력
							var resultDiv = document.getElementById('result');
							resultDiv.innerHTML = '선택하신 위치는 ' + '"' + title + '"' + placePosition + ' 입니다';
							
							
							
						}
					})(placePosition));

					itemEl.onmouseover = function() {
						infowindow.close();
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		//---------------------------------------------------------------------------
		// 커스텀 오버레이에 표시할 내용입니다     
		// HTML 문자열 또는 Dom Element 입니다 
		<%for (int i=0; i<careList.size(); i++){ %>
		var content = '<div class="overlaybox">'
				+ '    <div class="boxtitle"> <%=careList.get(i).getCare_name()%> </div>'
				+ '    <div class="first">'
				+ '        <div class="movietitle text"><%=careList.get(i).getCare_addr()%></div>'
				+ '    </div>' + '    <ul>' + '        <li class="up">'
				+ '            <span class="number">2</span>'
				+ '            <span class="title">고양이이름1(a태그로 캣카드이동)</span>'
				
				+ '            <span class="count">2</span>' + '        </li>'
				+ '        <li>' + '            <span class="number">3</span>'
				+ '            <span class="title">고양이이름2</span>'
				
				+ '            <span class="count">6</span>' + '        </li>'
				+ '        <li>' + '            <span class="number"></span>'
				+ '            <span class="title">고양이이름3</span>'
			
				+ '            <span class="count">3</span>' + '        </li>'
				+ '        <li>' + '            <span class="number">5</span>'
				+ '            <span class="title">고양이이름4</span>'
		
				+ '            <span class="count">1</span>' + '        </li>'
				+ '    </ul>' + '</div>';

		// 커스텀 오버레이가 표시될 위치입니다 
		
		var position = new kakao.maps.LatLng(<%=careList.get(i).getCare_latitude()%>, <%=careList.get(i).getCare_longitude()%>);
		addMarker(position, <%=i%>);
		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
			position : position,
			content : content,
			xAnchor : 0.3,
			yAnchor : 0.91
		});
		// 커스텀 오버레이를 지도에 표시합니다
		customOverlay.setMap(map); //이거를 ->> itemEl.onmouseover = function() { <<-여기에 추가하면 어떨까?!
									//또는!!! hidden 해놓고, 마커클릭시 
		
			
		<%}%>


			
		
	</script>

</body>
</html>