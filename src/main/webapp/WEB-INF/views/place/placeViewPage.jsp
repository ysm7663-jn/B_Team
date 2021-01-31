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
</script>

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
		<img alt="썸네일" src="resources/images/${placeDto.p_img}" >
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
fasd
fjas
dfj
asdj
asdfj
fja
sdfj
asdjf
asjdf
jasd
fja
sdfj
asdjf
asjd
fjasd
fja
sdjf
asdjf
asdjf
asdjf
asdj
fasd
fjas
dfj
asdj
asdfj
		</pre>
		</div>
		<div id="place-info" class="place-info">
			<h3>시설안내</h3>
			<!-- db에 저장된건 json을 string으로 변환한 데이터 -->
			<!-- Todo : 다시 js에서 json타입으로 변환후에 뿌려준다. -->
			<pre>
asdj
asdjf
ajsd
fja
sdfj
asdjf
asjdf
jas
asjdf
jasd
fja
sdfj
asdjf
asjd
fjasd
fja
sdjf
asdjf
asdjf
asdjf
asdj
fasd
fjas
dfj
asdj
asdfj
			</pre>
			
		</div>
		<div id="place-remark" class="place-remark">
			<h3>유의사항</h3>
			<!-- db에 저장된건 json을 string으로 변환한 데이터 -->
			<!-- Todo : 다시 js에서 json타입으로 변환후에 뿌려준다. -->
			<pre>
asdj
asdjf
ajsd
fja
sdfj
asdjf
asjdf
jasd
fja
sdfj
asdjf
asjd
fjasd
fja
sdjf
asdjf
asdjf
asdjf
asdj
fasd
fjas
dfj
asdj
asdfj
fja
sdfj
asdjf
asjdf
jasd
fja
sdfj
asdjf
asjd
fjasd
fja
sdjf
asdjf
asdjf
asdjf
asdj
fasd
fjas
dfj
asdj
asdfj
fja
sdfj
asdjf
asjdf
jasd
fja
sdfj
asdjf
asjd
fjasd
fja
sdjf
asdjf
asdjf
asdjf
asdj
fasd
fjas
dfj
asdj
asdfj
		</pre>
		</div>
		<div id="place-review" class="place-review">
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