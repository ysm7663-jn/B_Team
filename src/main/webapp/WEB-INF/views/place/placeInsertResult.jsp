<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="BaraON :: 예약" name="title"/>
</jsp:include>


<section>
<h1 id="result"></h1>

<c:if test="${insertResult eq 1}">
	<button type="button" id="view-btn" class="btn">게시글 확인</button>
</c:if>
<button type="button" id="list-btn" class="btn">목록으로 돌아가기</button>
</section>

<script>
	$(function(){
		if('${insertResult}'==-1 ){
			$('#result').text('이미지 파일 형식이 맞지 않아 취소되었습니다.');
		} else if('${insertResult}'==-2) {
			$('#result').text('이미지가 첨부되지 않은 항목이 있습니다.');
		} else if('${insertResult}'==-3) {
			$('#result').text('첨부되지 않은 세부공간이 있습니다. 공간관리에서 확인해주세요');
		} else {
			$('#result').text('등록 완료!');
			fn_btnUrl('#view-btn', 'placeViewPage.place?no=${currPNo}');
		}
		fn_btnUrl('#list-btn', 'placeListPage.place');
		
	});
	function fn_btnUrl(btn, url){
		$(btn).click(function(){
			location.href=url;
		})
	}
</script>
<%@ include file="../template/footer.jsp" %>