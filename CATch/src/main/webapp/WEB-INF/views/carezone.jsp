<%@page import="com.smhrd.domain.CatCard"%>
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
<style>
element .style {
	display: none;
}
</style>
</head>
<!--  <form onsubmit="searchPlaces(); return false;"></form> -->
<body>
	<%
		Member member = (Member) session.getAttribute("member");
	String care_id = "";
	if (member != null) {
		care_id = member.getMem_id();
	} else {
		care_id = "로그인먼저하세요";
	}

	List<CareBoard> careList = (List<CareBoard>)request.getAttribute("careList");
	List<CatCard> catcardList = (List<CatCard>)request.getAttribute("catcardList");
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
		급식소 이름 : <input type="text" name="care_name" placeholder=" ex) OO고양터">
		<br> <input type="text" name="care_addr"> <br> <input
			type="text" name="care_latitude"> <br> <input
			type="text" name="care_longitude"> <br> <input
			type="text" name="care_id" value=<%=care_id%> readonly> <br>

		<input type="submit" value="급식소 등록하기" id="carezone_submit">
	</form>

	<!-- 주소 -->
	<span id="centerAddr"></span>
	<div id="result"></div>



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a2cd6f2777e0f89378c802f40822eb3&libraries=services"></script>
	<script>
	// 급식소 위치 담을 변수
	
	var positions = [ 
	<%for (int i = 0; i < careList.size(); i++) {%>
		{
	        title: "<%=careList.get(i).getCare_name()%>", 
	        latlng: new kakao.maps.LatLng(<%=careList.get(i).getCare_latitude()%>, <%=careList.get(i).getCare_longitude()%>)
	    },
	<%}%>
		];
	
	console.log[positions];
	
	
	var imageSrc = "upload/cat_icon2.png"; 
    
	
	
		//마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		
		mapOption = {
			center : new kakao.maps.LatLng(126.8526012, 35.1595454), // 지도의 중심좌표
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
	        }, 
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), 
	        marker = new kakao.maps.Marker({ position : position, // 마커의 위치
				image : markerImage
				
			});
		
		//	marker.setMap(map); // 지도 위에 마커를 표출합니다
		//	markers.push(marker); // 배열에 생성된 마커를 추가합니다

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
		/*
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
		*/

		//---------------------------------------------------------------------------
		//================================================================
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(36, 36); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지

		    });
		}
		//================================================================	
		// 커스텀 오버레이에 표시할 내용입니다     
		// HTML 문자열 또는 Dom Element 입니다 
		var mark_content = [
		<%for (int i = 0; i < careList.size(); i++) {%>
		{
		 content : '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title"><%=careList.get(i).getCare_name()%><div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="ellipsis"><%=careList.get(i).getCare_addr()%></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>',
        latlng: new kakao.maps.LatLng(<%=careList.get(i).getCare_latitude()%>, <%=careList.get(i).getCare_longitude()%>)
		},
	<%}%>
		];
		

		

		// 커스텀 오버레이가 표시될 위치입니다 
		
		for (var i = 0; i < mark_content.length; i++) {
		

			
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(36, 36); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    var marker = new kakao.maps.Marker({
			map:map,
			position : mark_content[i].latlng,
			image : markerImage
			
		});
		var infowindow1 = new kakao.maps.InfoWindow({
			content : mark_content[i].content
		});
		kakao.maps.event.addListener(marker,'click',markClick(map, marker, infowindow1));
		kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow1));
		}
		
	
			
		
		//클릭시 말풍선뜨는거 ㅎㅎ
		function markClick(map, marker, infowindow1) {
		    return function() {
		        infowindow1.open(map, marker);
		        
		        var catList = [
		        	{	
		        		
		        		name:'야웅이',
		        		age:'2살',
		        		gender:'암컷',
		        		spec:'귀여움',
		        		neut:'완료',
		        		cat_seq:'7',
		        		url:'abc'
		        	},
		        	{
		        		name:'나비',
		        		age:'3살',
		        		gender:'암컷',
		        		spec:'츄르 좋아함',
		        		neut:'완료',
		        		cat_seq:'12',
		        		url:'abc'
		        	},
		        	{
		        		name:'냥냥이',
		        		age:'4살',
		        		gender:'수컷',
		        		spec:'사람을 잘 따름',
		        		neut:'없음',
		        		cat_seq:'3',
		        		url:'abc'
		        	}
		        ]
		        
		        //클릭시 하단에 고양이목록 추가하는 함수
		        for(var i=0; i<3; i++){ $('#carezone_submit').after('<table border="1px solid black"><tr><td>이름</td><td>'+catList[i].name+'</td></tr><tr><td>나이</td><td>'+catList[i].age+'</td></tr><tr><td>중성화</td><td>'+catList[i].neut+'</td></tr></table>')}
		       
		        
		        
	
		        
		    };
		}

		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow1) {
		    return function() {
		        infowindow1.close();
		        
		       
		    };
		}
		

		<%-- var position = new kakao.maps.LatLng(<%=careList.get(i).getCare_latitude()%>, <%=careList.get(i).getCare_longitude()%>);
		addMarker(position, <%=i%>);
		// 커스텀 오버레이를 생성합니다
		var infowindow1 = new kakao.maps.InfoWindow({
			position : position,
			content : content,
});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow1));

	function makeOverListener(map, marker, infowindow1) {
	    return function() {
	        infowindow1.open(map, marker);
	    };
	}
	
	function makeOutListener(infowindow1) {
	    return function() {
	        infowindow1.close();
	    };
	} --%>
	
/* 			kakao.maps.event.addListener(marker, 'click', function() {
      // 마커 위에 인포윈도우를 표시합니다
      customOverlay.open(map, marker);  
});
      */
			
			
			
			
			
			
			
	</script>

</body>
</html>