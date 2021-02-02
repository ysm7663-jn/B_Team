<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BaraON :: 공간보기" name="title" />
</jsp:include>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/style/place/place-view.css">
<script type="text/javascript" src="resources//js/place-view.js" ></script> 
<script>
	let facilityList = JSON.parse('${facilityList}');
	/* 리뷰작성 성공 */
	if('${insertResult}'>0){
		alert('작성해주셔서 감사합니다.');
	} else if ('${insertResult}') {
		alert('리뷰 작성에 실패했습니다.');
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
			error:function(){
				alert('오류가 발생했습니다.');
			}
		
		});
	}
	
	/* 리뷰 삭제 */
	function fn_reviewDelete(f){
		
		if(confirm('정말삭제하시겠습니까?')){
			let sendObj = {
				'rv_no' : f.rv_no.value
			};
			$.ajax({
				url:'reviewDelete.review',
				type:'put',
				data:JSON.stringify(sendObj),
				contentType: 'application/json; charset=utf-8',
				dataType:'json',
				success:function(responseObj){
					if(responseObj.result > 0) {
						alert('삭제되었습니다.');
						location.href='placeViewPage.place?no=${placeDto.p_no}';
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
	
	/* 이벤트 부여를 위한 onload 이벤트 */
	$(function(){
		fn_star();
	})
	
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
		/*
			before선택자 대체할 방법 생각하기
		$('.star').hover(function(){
			let cssObj = {
				'content' : '\f005',
				'font-family' : 'Font Awesome 5 Free',
				'font-weight' : 400
			}
			$(this).prevAll('label:before').css(cssObj);
		});
		*/
	}
	
	/* 리뷰 삽입 전 검사 */
	function fn_reviewInsert(f){
		let contentRegExp = /.{5}/;
		if(!contentRegExp.test(f.rv_content.value)){
			alert('리뷰는 5글자 이상 작성해주세요');
			f.rv_content.focus();
			return;
		}
		f.action='reviewInsert.review';
		f.submit();
	}
</script>

<div class="modal">
	<div class="modal-content">
		<div class="close" onclick="fn_modalClose()">&times;</div>
		<div class="content-wrap">
		<span>ID : ${loginDto.m_id}</span><br/>
		
		<span class="modal-star">
			
		</span>
		<br/>
		<textarea id="modal-rv-content" rows="5" cols="50"></textarea>
		<input id="modal-rv-no" type="hidden" />
		<input type="button" value="수정완료" onclick="fn_reviewUpdate()" />
		<input type="button" value="돌아가기" onclick="fn_modalClose()" />
		</div>
	</div>
</div>
<!-- 전화버튼눌렀을때 나올 modal -->
<div class="modal2">
	<div class="modal-content2">
		전화번호
		
		<button type="button" onclick="fn_modalClose()"> 확인</button>
	</div>
</div>
<div class="title-area">
	<div class="place-title">
		<h1>${placeDto.p_title}</h1>
	</div>
	<div class="place-line-desc1">
		<h3>${placeDto.p_desc}</h3>
	</div>
	<div>
		<span># ${categoryName}</span>
	</div>
</div>
<section>
	<aside>
		<h4>세부 공간 선택</h4>
		<!-- Todo : 세부옵션 추가 -->
		<form class="reserve-form">
			<c:if test="${optionList eq null}">
				<div>
					<h4>등록된 공간이 없습니다.</h4>
				</div>
			</c:if>
			<c:if test="${optionList ne null}">
				<div class="place-option-wrap">
					<c:forEach var="optionDto" items="${optionList}" varStatus="k">
						<label>
							<input type="checkbox" name="po_no" value="${optionDto.po_no}" />
							<strong>${optionDto.po_name}</strong>
						</label>
							
						<div class="hidden-box">
							<div class="day-price">&#92; ${optionDto.po_dayPrice}/day</div>
							<div class="holiday-price">&#92; ${optionDto.po_holiday}/day</div>
							<div class="option-info-box">
								<div class="img-box">
									<img alt="" src="resources/images/PlaceOptionImages/${optionDto.po_img1}" />
									<!-- 옵션의 이미지는 한개만하고 공간의 썸네일을 많이 받는게 나을거 같다. -->
								</div>
								<div class="person-count">
									<strong>수용인원</strong>
									<span>최소 ${optionDto.po_min}명 ~ 최대 ${optionDto.po_max}</span>
								</div>
								<div class="facilities${k.count}">
								<!-- Todo : 각 방마다의 편의시설을 불러올 방법 -->
								<!-- DB에 저장되어있는 편의시설정보는 json -->
								</div>
								<div class="calendar-wrap">
								<input type="hidden" name="res_date" />
								</div>
							</div>
						</div>
						
					</c:forEach>
				</div>		
			</c:if>
			<div class="btn-wrap">
				<button type="button"><span><i class="fas fa-mobile-alt"></i>전화</span></button>
				<button>예약신청하기</button>
			</div>
		</form>
	</aside>
	<article>
		<div class="thumbnail-box">
		<img alt="썸네일" src="resources/images/PlaceImages/${placeDto.p_img}" >
		</div>
		<div class="place-line-desc2">
			${placeDto.p_desc}
		</div>
		<div class="place-nav">
			<ul>
				<li><a href="#place-main-info">공간소개</a></li>
				<li><a href="#place-info">시설안내</a></li>
				<li><a href="#place-remark">유의사항</a></li>
				<li><a href="#place-review">리뷰</a></li>
			</ul>
		</div>
		<div id="place-main-info" class="place-main-info">
			<h3>공간소개</h3>
			<p>
				${placeDto.p_content}
			</p>
			<pre>
asdj
asdjf
ajsd
fja
sdfj
asdjf
		</pre>
		</div>
		<div id="place-info" class="place-info">
			<h3>시설안내</h3>
			<!-- db에 저장된건 json을 string으로 변환한 데이터 -->
			<!-- Todo : 다시 js에서 json타입으로 변환후에 뿌려준다. -->
			<p>
			${placeDto.p_info}
			</p>
			<pre>
asdj
asdjf
ajsd
fja
sdfj
asdjf
asjdf
			</pre>
			
		</div>
		<div class="place-map">
			<h3>위치</h3>
			
		</div>
		<div id="place-remark" class="place-remark">
			<h3>유의사항</h3>
			<!-- db에 저장된건 json을 string으로 변환한 데이터 -->
			<!-- Todo : 다시 js에서 json타입으로 변환후에 뿌려준다. -->
			<p>
			${placeDto.p_remark}
			</p>
			<pre>
asdj
asdjf
ajsd
fja
sdfj
asdjf
asjdf
jas
		</pre>
		</div>
		<div id="place-review" class="place-review">
			<h3>리뷰</h3>
			<div class="review-insert">
				<form id="review-insert-form" method="post" enctype="multipart/form-data" >
					<div class="review-insert-star">
						<p>
							<input id="star1" class="star" type="checkbox" value="1" /><label for="star1"></label> 
							<input id="star2" class="star" type="checkbox" value="2" /><label for="star2"></label>
							<input id="star3" class="star" type="checkbox" value="3" /><label for="star3"></label>
							<input id="star4" class="star" type="checkbox" value="4" /><label for="star4"></label>
							<input id="star5" class="star" type="checkbox" value="5" /><label for="star5"></label>
						</p>
						<input id="star-score" type="hidden" name="rv_star" />
					</div>
					<c:if test="${loginDto eq null }">
						<textarea rows="5" cols="50" placeholder="로그인한 회원만 리뷰작성이 가능합니다." readonly></textarea>
					</c:if>
					<c:if test="${loginDto ne null }">
						<textarea rows="5" cols="50" name="rv_content" placeholder="댓글은 마음의 창입니다." ></textarea>
					</c:if>
					<div class="review-insert-btn-wrap">
						<!-- hidden -->
						<input type="hidden" name="m_no" value="${loginDto.m_no}" />
						<input type="hidden" name="p_no" value="${placeDto.p_no}" />
						<input type="file" name="rv_img" value="이미지첨부" />
						<input type="button" value="작성하기" onclick="fn_reviewInsert(this.form)" />
						<input type="button" value="다시작성하기" onclick="fn_reviewReset()" />
					</div>
				</form>
			</div>
			<div class="review-list">
				<c:if test="${reviewList eq null}">
					<div>
						<h2>등록된 후기가 아직 없습니다.</h2>
					</div>
				</c:if>
				<c:if test="${reviewList ne null}">
				<!-- Todo : 리뷰 불러오기는 홀수번째, 짝수번째에 나눠서 다른 css적용 -->
				<!-- 일단은 모두 같은 css를 적용한다. -->
					<c:forEach var="reviewDto" items="${reviewList}" varStatus="k" >
						<%-- <c:if test="${(k.index/2) eq 1}">
							<div class="review-wrap-odd">
								
							</div>
						</c:if>
						<c:if test="${(k.index/2) eq 0}">
							<div class="review-wrap-even">
								
							</div> 
						</c:if>--%>
						<form>
							<div class="review">
								<div class="reviewer-info">
									<c:if test="${reviewDto.m_nick eq null}">
										<span class="review-id">ID : ${reviewDto.m_id}</span>
									</c:if>
									<c:if test="${reviewDto.m_nick ne null}">
										<span class="review-nick">Nick name : ${reviewDto.m_nick}</span>
										<br/>
										<span class="review-id">ID : ${reviewDto.m_id}</span>
									</c:if>
								</div>
								<div class="review-star">
									<c:forEach begin="1" end="5" step="1" varStatus="k" >
										<c:if test="${k.count le reviewDto.rv_star}">
											<i class="fas fa-star"></i>
										</c:if>
										<c:if test="${k.count gt reviewDto.rv_star}">
											<i class="far fa-star"></i>
										</c:if>
									 </c:forEach>
									 <div class="review-date">
									 	작성일 : ${reviewDto.rv_postDate}<br/>
									 	<c:if test="${(reviewDto.rv_modifyDate ne reviewDto.rv_postDate) && (reviewDto.rv_modifyDate ne null)}">
										 	최근수정일 : ${reviewDto.rv_modifyDate}
									 	</c:if>
									 </div>
									 <!-- modal에 표시할 별점 -->
									 <input type="hidden" name="rv_star" value="${reviewDto.rv_star}" />
								</div>
								<div class="review-content" >
									<p>${reviewDto.rv_content}</p>
									<!-- modal에 표시할 내용 -->
									<input type="hidden" name="rv_content" value="${reviewDto.rv_content}" />
									<input type="hidden" name="rv_no" value="${reviewDto.rv_no}" />
								</div>
								<c:if test="${reviewDto.rv_img ne null}">
									<div class="review-img-box" >
										<img alt="img" src="resources/images/ReviewImages/${reviewDto.rv_img}" />
									</div>
								</c:if>
								<div class="review-btns" >
									<c:if test="${loginDto.m_no eq reviewDto.m_no}">
										<input type="button" value="수정하기" onclick="fn_modal(this.form)" />
										<input type="button" value="삭제하기" onclick="fn_reviewDelete(this.form)" />
									</c:if>
								</div>
							</div>
						</form>
					</c:forEach>
				</c:if>
			</div>
		</div>
	
	</article>
</section>


<%@ include file="../template/footer.jsp" %>