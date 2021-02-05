$(function(){
	$('#addr-search-btn').click(fn_searchPopUp);
	$('#place-addr').click(fn_searchPopUp);
})

function fn_searchPopUp(){
	new daum.Postcode({
		oncomplete : function(data){
			let addr = '';
			let extraAddr = '';
			
			if(data.userSelectedType ==='R'){
				addr = data.roadAddress;
				extraAddr = data.bname;
			} else {
				addr = data.jibunAddress;
				extraAddr = data.bname;
			}
			$('#place-addr').val(addr);
			$('#place-bname').val(extraAddr);
			$('#place-addr-detail').focus();
		}
	}).open();
}