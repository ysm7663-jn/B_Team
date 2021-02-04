$(function(){
	$.each(facilityList, function(index, item){
		let facilities = $('.facilities'+index);
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
