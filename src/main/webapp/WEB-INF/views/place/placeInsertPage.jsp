<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param name="title" value="BaraON :: 공간등록" />
</jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/place-insert.js"></script>
<link rel="stylesheet" href="resources/style/place/place-insert.css" />
<header class="title-area">
	<h1>공간등록</h1>
</header>
<section>
	<form method="post" enctype="multipart/form-date">
		<article class="place-insert-list">
			<div class="subtitle">카테고리 선택	 <span class="required-data">필수 정보</span> </div>
			<div class="sub-content">
				<ul id="category-list">
					<c:forEach var="categoryDto" items="${categoryList}" >
					<li><a href="javascript:void(0);" role="button">${categoryDto.pc_name}</a></li>
					</c:forEach>
				</ul>
				<input type="hidden" name="pc_no" />
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">공간명 <span class="required-data">필수 정보</span> </div>
			<div class="sub-content">
				<input class="place-input" type="text" name="p_name" />
				<span id="character-length" ></span>
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">공간 한줄 소개</div>
			<div class="sub-content">
				<input class="place-input" type="text" name="p_desc" />
				<span id="character-length" ></span>
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">공간 소개 <span class="required-data">필수 정보</span></div>
			<div class="sub-content">
				<input class="place-input" type="text" name="p_content" />
				<span id="character-length" ></span>
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">시설안내 <span class="required-data">필수 정보</span></div>
			<div class="sub-content">
				<!-- 추가버튼이 있고 추가버튼을 누르면 li추가와 동시에 input 생성 js로 구현 -->
				<ul id="p-info-list">
					<li><input class="place-input" type="text" name="p_info" placeholder="추가하려면 우측 버튼을 눌러주세요" /></li>
					<button type="button">추가</button>
				</ul>
			</div>
			<p class="example-box">
			예시)
			- 주차시설 : 가능(주말/공휴일 무료, 평일 ㅇㅇ공용주차장 이용)
			- TV/빔 프로젝터 : 없음
			- PC/인터넷 : WIFI
			- 취사시설 : 가스렌지, 핫플레이트, 전자렌지, 식기, 밥솥, 냉온수기, 마당 바베큐 시설
			- 스피커/노래방 : 24시간 빵빵한 스피커
			- 의자/테이블 : 테이블(1개) / 의자(8개) 제공
			- 기타비품 : 드라이기, 에어컨, 온풍기 
			</p>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">예약시 주의사항 <span class="required-data">필수 정보</span></div>
			<div class="sub-content">
				<ul id="p-remark-list">
					<li><input class="place-input" type="text" name="p_remark" placeholder="추가하려면 우측 버튼을 눌러주세요" /></li>
					<button type="button">추가</button>
				</ul>
			</div>
			<p class="example-box">
			예시)
			- 주차공간이 없으니 참고해주세요.
			- 예약한 시간 이외에 시간연장은 불가능합니다.
			- 행사 준비시간과 마감시간을 포함해서 예약해주세요.
			- 특별한 주의사항은 없습니다.
			- 기물 파손 시 동일 금액으로, 배상하여야 합니다.
			</p>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">웹사이트</div>
			<div class="sub-content">
				<input class="place-input" type="text" name="p_url" placeholder="웹사이트 URL을 입력해주세요 (예시 : https://learning-ant.github.io)"/>
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">썸네일 <span class="required-data">필수 정보</span></div>
			<div class="sub-content">
				<input class="place-input" type="file" name="p_img" placeholder="이미지 파일을 추가해주세요 (JPG,JPEG, PNG)" multiple />
				<div id="img-box">
					<!-- 업로드 이미지 미리보기 -->
				</div>
			</div>
			<span class="character-length"></span>
			<p class="example-box">
				등록 가능 이미지 : JPEG, JPG, PNG
				등록 제한 이미지 : 허위 거짓 이미지, 음란물, 텍스트가 포함된 이미지, 제 3자의 재산권.초상권을 침해하는 이미지 등의
등록 제한 이미지를 업로드하시는 경우, 공간 노출이 제한됩니다.
				최대 용량 : 10MB
			</p>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">주소(위치) <span class="required-data">필수 정보</span></div>
			<div class="sub-content">
				<input class="place-input" id="place-addr" type="text" name="p_addr" placeholder="주소를 등록해주세요" readonly />
				<button type="button" id="addr-search-btn">주소등록</button>
				<input class="place-input" id="place-addr-detail" type="text" name="p_addrdetail" placeholder="상세 주소를 입력해주세요" />
				<input id="place-bname" type="hidden" name="p_bname" />
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">옵션</div>
			<div class="sub-content" >
				<div class="option-list">
					<article class="option-box">
						<div class="option-subtitle">
							공간이름<span class="required-data">필수 정보</span>
						</div>
						<div class="option-content">
							<input class="option-input" type="text" name="po_title" />
							<span id="character-length" ></span>
						</div>
					</article>
					<article class="option-box">
						<div class="option-subtitle">
							가격<span class="required-data">필수 정보</span>
						</div>
						<div class="option-content">
							평일 : <input type="number" name="po_dayPrice" required />원
							주말(공휴일) : <input type="number" name="po_holiday" />원
							<span>주말가격을 안적으시면 평일가격으로 일괄 적용됩니다.</span>
						</div>
					</article>
					<article class="option-box">
						<div class="option-subtitle">
							인원<span class="required-data">필수 정보</span>
						</div>
						<div class="option-content">
							최소 : <input type="number" name="po_min" required />
							최대 : <input type="number" name="po_max" required />
						</div>
					</article>
					<article class="option-box">
						<div class="option-title">
							편의시설
						</div>
						<div class="option-content">
							<input type="text" />
							<button type="button">편의시설 추가</button>
						</div>
						<ul id="facility-list">
							<!-- 추가버튼을 누르면 여기에 input hidden과 li태그 추가 -->
						</ul>
					</article>
				</div>
			</div>
		</article>
	</form>
</section>


<%@ include file="../template/footer.jsp" %>