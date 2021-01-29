<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BaraON :: 공간보기" name="title" />
</jsp:include>


<div class="title-area">
	<div class="place-title">
		<h1>${placeDto.p_title}</h1>
	</div>
	<div class="place-line-desc1">
		<h3>${placeDto.p_desc}</h3>
	</div>
	<div>
		<span># ${pc_name}</span>
	</div>
</div>
<section>
	<aside>
		<h4>세부 공간 선택</h4>
		<!-- Todo : 세부옵션 추가 -->
		<form>
			<c:if test="${optionList eq null}">
				<div>
					<h4>등록된 공간이 없습니다.</h4>
				</div>
			</c:if>
			<c:if test="${optionList ne null}">
				<div class="place-option-wrap">
					<c:forEach var="optionDto" items="${optionList}">
						<input type="radio" name="po_no" value="${optionDto.po_no}" />
						<strong>${optionDto.po_name}</strong>
						<div class="day-price">&#92; ${optionDto.po_dayPrice}/day</div>
						<div class="holiday-price">&#92; ${optionDto.po_holiday}/day</div>
						<div class="option-info-box">
							<div class="img-box">
								<img alt="" src="resources/images/${optionDto.po_img1}" />
							</div>
							<div class="person-count">
								<strong>수용인원</strong>
								<span>최소 ${optionDto.po_min}명 ~ 최대 ${optionDto.po_max}</span>
							</div>
							<div class="facilities">
								<div class="facility">
									<!-- json 객체를 변환해서 append -->
								</div>
							</div>
							<div class="calendar-wrap">
								<!-- 이거 가능해..? -->
							</div>
						</div>
						
					</c:forEach>
				</div>		
			</c:if>
			<div>
				
			</div>
			<button type="button"><span><i class="fas fa-mobile-alt"></i>전화</span></button>
			<button>예약신청하기</button>
		</form>
	</aside>
	<article>
		<img alt="썸네일" src="resources/images/" >
		
		<div class="place-line-desc2">
			${placeDto.p_desc}
		</div>
		<div class="place-nav">
			<ul>
				<li>공간소개</li>
				<li>시설안내</li>
				<li>유의사항</li>
				<li>리뷰</li>
			</ul>
		</div>
		<div class="place-main-info">
			<h3>공간소개</h3>
			<p>
				${placeDto.p_content}
			</p>
		</div>
		<div class="place-info">
			<h3>시설안내</h3>
			<!-- db에 저장된건 json을 string으로 변환한 데이터 -->
			<!-- Todo : 다시 js에서 json타입으로 변환후에 뿌려준다. -->
			
		</div>
		<div class="place-remark">
			<h3>유의사항</h3>
			<!-- db에 저장된건 json을 string으로 변환한 데이터 -->
			<!-- Todo : 다시 js에서 json타입으로 변환후에 뿌려준다. -->
		
		</div>
		<div class="place-review">
			<h3>리뷰</h3>
			<c:if test="${reviewList eq null}">
				<div>
					<h2>등록된 후기가 아직 없습니다.</h2>
				</div>
			</c:if>
			<c:if test="${reviewList ne null}">
			<!-- Tod : 리뷰 불러오기는 홀수번째, 짝수번째에 나눠서 다른 css적용 -->
				<c:forEach var="reviewDto" items="${reviewList}" varStatus="k" >
					<c:if test="${(k.index/2) eq 1}">
						<div class="review-wrap-odd">
							
						</div>
					</c:if>
					<c:if test="${(k.index/2) eq 0}">
						<div class="review-wrap-even">
							
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	
	</article>
</section>


<%@ include file="../template/footer.jsp" %>