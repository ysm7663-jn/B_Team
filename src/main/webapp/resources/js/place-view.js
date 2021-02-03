$(function(){
	$.each(facilityList, function(index, item){
		let facilities = $('.facilities'+(index+1));
		$.each(item, function(key, value){
			$(facilities).append($('<div class="facility">').text(value));
		});
	});
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
	
	$(document).on('click', 'input:checkbox', function(){
		$('input:checkbox').parent().next().removeClass('active');
		$('input:checkbox:checked').parent().next().addClass('active');
	});
	
	
})

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