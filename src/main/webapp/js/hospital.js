var MARKER_SPRITE_POSITION = {
		"a" : [ 37.753016, 127.070478 ],
		"b" : [ 35.190166, 126.857920 ],
		"c" : [ 33.455327, 126.561618 ],
		"d" : [ 37.657406, 127.066727 ],
		"e" : [ 37.682394, 126.753808 ],
		"f" : [ 36.377199, 127.342904 ],
		"g" : [ 35.137420, 129.069288 ],
		"h" : [ 35.819407, 128.536173 ],
};

$(document).ready(function() {

	var HOME_PATH = window.HOME_PATH || '.';
	
	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(36.377199, 127.342904),
		zoom : 6
	});
	
	var bounds = map.getBounds(), southWest = bounds.getSW(), northEast = bounds
			.getNE(), lngSpan = northEast.lng() - southWest.lng(), latSpan = northEast
			.lat()
			- southWest.lat();
	
	var markers = [], infoWindows = [];
	
	for ( var key in MARKER_SPRITE_POSITION) {
	
		var name = $('#' + key + '').text();
		var tel = $('#'+ key +'Tel').text();
		var addr = $('#'+ key +'Addr').text();
		
		var contentString = [
		    '<div class="marker_inner">',
		    '   <h3>'+name+'</h3>',
		    '   <p>'+tel+'<br>',
		    '       '+addr+'<br>',
		    '   </p>',
		    '</div>'
		].join('');
	
		var position = new naver.maps.LatLng(MARKER_SPRITE_POSITION[key][0],
				MARKER_SPRITE_POSITION[key][1]);
	
		var marker = new naver.maps.Marker({
			map : map,
			position : position,
//			title : key,
//			icon : {
//				url : HOME_PATH + '/img/example/sp_pins_spot_v3.png',
//				size : new naver.maps.Size(24, 37),
//				anchor : new naver.maps.Point(12, 37),
//				origin : new naver.maps.Point(MARKER_SPRITE_POSITION[key][0],
//						MARKER_SPRITE_POSITION[key][1])
//			},
//			zIndex : 100
		});
	
		var infoWindow = new naver.maps.InfoWindow({
			content : contentString
		});
	
		markers.push(marker);
		infoWindows.push(infoWindow);
	};
	
	naver.maps.Event.addListener(map, 'idle', function() {
		updateMarkers(map, markers);
	});
	
	function updateMarkers(map, markers) {
	
		var mapBounds = map.getBounds();
		var marker, position;
	
		for (var i = 0; i < markers.length; i++) {
	
			marker = markers[i]
			position = marker.getPosition();
	
			if (mapBounds.hasLatLng(position)) {
				showMarker(map, marker);
			} else {
				hideMarker(map, marker);
			}
		}
	}
	
	function showMarker(map, marker) {
	
		if (marker.setMap())
			return;
		marker.setMap(map);
	}
	
	function hideMarker(map, marker) {
	
		if (!marker.setMap())
			return;
		marker.setMap(null);
	}
	
	// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	function getClickHandler(seq) {
		return function(e) {
			var marker = markers[seq], infoWindow = infoWindows[seq];
	
			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				infoWindow.open(map, marker);
			}
		}
	}
	
	for (var i = 0, ii = markers.length; i < ii; i++) {
		naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
	}

	$('.name').click(function() {
		$('#map').empty();
		
		var name = $(this).text();
		var tel = $(this).next().text();
		var addr = $(this).next().next().text();
		
		var key = $(this).attr("id");
		
		var position = new naver.maps.LatLng(MARKER_SPRITE_POSITION[key][0],
				MARKER_SPRITE_POSITION[key][1]); 
		
		var map = new naver.maps.Map('map', {
			center: position,
			zoom: 15
		});
		
		var contentString = [
			'<div class="marker_inner">',
			'   <h3>'+name+'</h3>',
			'   <p>'+tel+'<br>',
			'       '+addr+'<br>',
			'   </p>',
			'</div>'
			].join('');
		
		var marker = new naver.maps.Marker({
			map: map,
			position: position
		});
		
		var infowindow = new naver.maps.InfoWindow({
			content: contentString
		});
		
		naver.maps.Event.addListener(marker, "click", function(e) {
			if (infowindow.getMap()) {
				infowindow.close();
			} else {
				infowindow.open(map, marker);
			}
		});
	});
});
