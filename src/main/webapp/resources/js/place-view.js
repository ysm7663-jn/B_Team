$(function(){
	$.each(facilityList, function(index, item){
		let facilities = $('.facilities'+(index+1));
		$.each(item, function(key, value){
			$(facilities).append($('<div class="facility">').text(value));
		});
	});
	
	$(document).on('click', 'input:checkbox', function(){
		$('input:checkbox').closest('.hidden-box').removeClass('active');
		$('input:checkbox:checked').closest('.hidden-box').addClass('active');
	});
	fn_scrollEvent();
	fn_getMap();
	fn_datepiacker();
	fn_star();
	
	let rn = $('.review-list input[type="hidden"][name="review-rn"]').last().val();
	if(rn == lastReviewRN){
		$('#more').text('마지막 리뷰입니다.')
		isEnd=true;
	}
	
})

/* scroll 이벤트 */
function fn_scrollEvent(){
	if($('body').height() > $(window).height()) {
		$(window).scroll(function(){
			let $window = $(this);
			let scrollTop = $window.scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();
	
			if (scrollTop + windowHeight >= documentHeight){
				fn_reviewList();
			}
		});
	};
}
/* 지도 */
function fn_getMap(){
	let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    'center': new kakao.maps.LatLng(37.5547568183065, 126.941630702293), // 지도의 중심좌표
	    'level': 3 // 지도의 확대 레벨
	};  
	
	// 지도를 생성합니다    
	let map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	let geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${placeDto.p_addr}', function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
		
			let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			// 결과값으로 받은 위치를 마커로 표시합니다
			let marker = new kakao.maps.Marker({
			    'map': map,
			    'position': coords
			});
		
			// 인포윈도우로 장소에 대한 설명을 표시합니다
			let infowindow = new kakao.maps.InfoWindow({
		    'content': '<div style="width:150px;text-align:center;padding:6px 0;">${placeDto.p_title}</div>'
			});
			infowindow.open(map, marker);
		
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		} else if(status === kakao.maps.services.Status.ZERO_RESULT) {
			let marker = new kakao.maps.Marker({
		 	   'map': map,
		 	   'position': new kakao.maps.LatLng(37.5547568183065, 126.941630702293)
			});
	
			let infowindow = new kakao.maps.InfoWindow({
				'content': '<div style="width:150px;text-align:center;padding:6px 0;">주소를 찾지 못했어요!</div>'
			});
			infowindow.open(map, marker);
		}
	});
}

/* Datepicker */
function fn_datepiacker(){
	$('.calendar-wrap').datepicker({
		dateFormat: 'yy-mm-dd',
		autoSize: true,
		gotoCurrent: true,
		maxDate:'+2m',
		minDate:0,
		prevText: '<i class="fas fa-chevron-circle-left"></i>',
        nextText: '<i class="fas fa-chevron-circle-right"></i>',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        onSelect: function(d){
        	$('input:hidden[name="res_date"]').val(d);
        }
	});
}

/* 리뷰 수정 modal 띄우기 */
function fn_modal(f){
	let rv_no = f.rv_no.value;
	let rv_star = f.rv_star.value;
	let rv_content = f.rv_content.value;
	$('.modal-star').empty();
	for(let i = 0 ; i<5 ; i++){
		if(i<rv_star){
			$('.modal-star').append('<i class="fas fa-star"></i>');
		} else {
			$('.modal-star').append('<i class="far fa-star"></i>');
		}
	}
	$('#modal-rv-content').val(rv_content);
	$('#modal-rv-no').val(rv_no);
	$('.modal').addClass('active');
}

/* 리뷰 수정 modal 닫기 */
function fn_modalClose(){
	$('.modal').removeClass('active');
}

/* 전화번호 modal 열기 */
function fn_modalPhone(){
	$('.modal-phone').addClass('active');
}

/* 전화번호 modal 닫기 */
function fn_modalPhoneClose(){
	$('.modal-phone').removeClass('active');
}


/* 리뷰 수정 */
function fn_reviewUpdate(f){
	let rv_content = $('#modal-rv-content').val();
	let rv_no = $('#modal-rv-no').val();
	let sendObj = {
			'rv_no' : rv_no,
			'rv_content' : rv_content
	};
	$.ajax({
		url:'reviewUpdate.review',
		type:'put',
		data: JSON.stringify(sendObj),
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		success:function(responseObj){
			if(responseObj.result > 0){
				alert('수정되었습니다.');
				location.href='placeViewPage.place?no=${placeDto.p_no}';
			} else{
				alert('실패');
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	
	});
}

/* 리뷰 삭제 */
function fn_reviewDelete(f){
	
	if(confirm('정말삭제하시겠습니까?')){
		$.ajax({
			url:'reviewDelete.review/'+f.rv_no.value,
			type:'put',
			contentType: 'application/json; charset=utf-8',
			dataType:'json',
			success:function(responseObj){
				if(responseObj.result > 0) {
					alert('삭제되었습니다.');
					location.href='placeViewPage.place?no=${placeDto.p_no}#place-review';
				} else {
					alert('삭제에 실패했습니다.');
				}
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
}

/* 별 클릭 시 이전 형제요소들(input)의 checked 속성 true/false */
/*
	좀 더 보완이 필요할 것 같다.
	현재 문제는 체크박스라서 클릭한 요소까지 체크가 해제되어 버린다.
	-> 해결
*/
function fn_star(){
	$('.star').click(function(){
		if($(this).prop('checked')){
			$(this).prevAll('input').prop('checked', true);
			$('#star-score').val($(this).val());
		} else {
			$(this).nextAll('input').prop('checked', false);
			$(this).prop('checked', true);
			$('#star-score').val($(this).val());
		}
		
	});
}

/* 리뷰 삽입 전 검사 */
function fn_reviewInsert(f){
	let contentRegExp = /.{5}/;
	if(!contentRegExp.test(f.rv_content.value)){
		alert('리뷰는 5글자 이상 작성해주세요');
		f.rv_content.focus();
		return;
	}
	if(f.rv_star.value == '' || f.rv_star.value == null){
		alert('별점을 선택해주세요');
		return;
	}
	f.action='reviewInsert.review';
	f.submit();
}

function fn_reviewList(){
	let rn = $('.review-list input[type="hidden"][name="review-rn"]').last().val();
	let sendObj = {
			'rn':rn,
			'p_no':no
	};
	// 더이상 불러올 목록이 없을 경우 return
	if(isEnd) {
		return;
	}
	
	// ajax요청한지 1초가 지나지 않았으면 return
	if(isProgress){
		return;
	}
	
	isProgress = true;
	
	$.ajax({
		url:'reviewListAppend.review/'+rn+'/'+no,
		type:'get',
		contentType:'application/json; charset=utf-8',
		dataType:'json',
		success:function(responseObj){
			let list = responseObj.reviewList;
			if (list.length !=0) {
				appendList(list);
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		complete:function(){
			setTimeout(function(){isProgress=false}, 1000);
		}
	});
}


function appendList(list){
	
	$.each(list,function(index, reviewDto){
		$('<form>').append('<input type="hidden" name="review-rn" value="'+reviewDto.rn+'" />')
		.append($('<div>').addClass('review').append($('<div>').addClass('reviewer-info')))
		.appendTo($('.review-list'));
		if(reviewDto.m_nick == null){
			$('.reviewer-info').last().append($('<span>').addClass('review-id').text('ID : '+reviewDto.m_id));
		} else {
			$('.reviewer-info').last().append($('<span>').addClass('review-id').text('Nick name : '+reviewDto.m_nick))
			.append('<br/>')
			.append($('<span>').addClass('review-id').text('ID : '+reviewDto.m_id));
		}
		$('.review').last().append('<div class="review-star">');
		for(let i=1;i<=5;i++){
			if(i < reviewDto.rv_star){
				$('.review-star').last().append('<i class="fas fa-star"></i>')
			} else {
				$('.review-star').last().append('<i class="far fa-star"></i>')
			}
		}
		$('.review').last().append($('<div class="review-date">').append('작성일 : '+reviewDto.rv_postDate+'<br/>'));
		if(reviewDto.rv_modifyDate != reviewDto.rv_postDate && reviewDto.rv_modifyDate != null){
			$('.review-date').last().append('최근수정일 : '+reviewDto.rv_modifyDate);
		}
		$('.review').last().append($('<div class="review-content">').append('<p>'+reviewDto.rv_content+'</p'));
		if(reviewDto.rv_img != null){
			let reviewImgArray = JSON.parse(reviewDto.rv_img); 
			$('.review').last().append($('<div class="review-img-box">').append('<ul class="img-list">'));
			$.each(reviewImgArray,function(index, reviewImage){
				$('.img-list').last().append($('<li>').append('<img alt="'+reviewImage+'" src="resources/images/ReviewImages/'+reviewImage+'"/>'));
			});
		}
		$('.review').last().append('<div class="review-btns">');
		if(loginDtoMNo==reviewDto.m_no){
			$('.review-btns').last().append('<input type="hidden" name="rv_star" value="'+reviewDto.rv_star+'" />')
			.append('<input type="hidden" name="rv_content" value="'+reviewDto.rv_content+'" />')
			.append('<input type="hidden" name="rv_no" value="'+reviewDto.rv_no+'" />')
			.append('<input type="button" value="수정하기" onclick="fn_modal(this.form)" />')
			.append('<input type="button" value="삭제하기" onclick="fn_reviewDelete(this.form)" />');
		}
		if(lastReviewRN==reviewDto.rn){
			$('#more').text('마지막 리뷰입니다.');
			alert('마지막 리뷰입니다.');
			isEnd=true;
		}
	});
}