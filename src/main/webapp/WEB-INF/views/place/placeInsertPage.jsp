<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param name="title" value="BaraON :: 공간등록" />
</jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/place-insert.js"></script>
<link rel="stylesheet" href="resources/style/place/place-insert.css" />
<script>
	$(function(){
		fn_addInput('p_info', '#add-info-list-btn', '#place-info-list');
		fn_addInput('p_remark', '#add-remark-list-btn', '#place-remark-list');
		fn_removeInput('#remove-info-list-btn', '#place-info-list');
		fn_removeInput('#remove-remark-list-btn', '#place-remark-list');
		fn_addFacility($('.add-facility-btn').last());
		fn_addOption();
		fn_clickCategory();
		fn_previewThumbnail('#upload-btn');
		fn_previewThumbnail('#option-thumbnail');
	})
	function fn_placeInsert(f){
		if(f.pc_no.value==''){
			alert(f.p_content.value);
			alert('카테고리를 선택해 주세요');
			return;
		}
		f.action = 'placeInsert.place';
		f.submit();
	}	
	function fn_addInput(inputName, btn, tag){
		$(btn).click(function(){
			if($(tag).find('li').length>9){
				alert('최대 10개까지입니다.');
				return;
			}
			let addInput = '<li><input class="place-input" type="text" name="'+inputName+'" placeholder="추가하려면 추가 버튼을 눌러주세요" required /></li>';
			$(tag).append(addInput);
		})
	}
	function fn_removeInput(btn, tag){
		$(btn).click(function(event){
			if($(tag).find('li').length<2){
				alert('최소 1개는 필수입니다.');
				return;
			}
			$(tag).find('li').last().remove();
		});
	}
	function fn_clickCategory(){
		$('body').on('click', '#category-list li>a', function(){
			$(this).closest('#category-list').next().val($(this).next().val());
			$('#category-list li>a').css('background', '');
			$(this).css('background','rgba(216,100,216,1)');
			
		});
	}
	function fn_addFacility(btn){
		$(btn).click(function(event){
			let facilityInput = $(event.target).prev();
			let value = $(facilityInput).val();
			let ul = $(event.target).next();
			let countInput = $(event.target).next().next();
			if(value==''){
				alert('편의시설을 입력해주세요');
				$(facilityInput).focus();
				return;
			}
			if($(ul).find('li').length>7){
				alert('8개이상 추가할 수 없습니다.');
				return;
			}
			let addList = '<li>'+value+'<input type="hidden" name="po_facility" value="'+value+'" /><span class="remove" onclick="fn_removeFacility(event)">&times;</span></li>';
			$(ul).append(addList);
			$(facilityInput).val('');
			$(countInput).val(parseInt($(countInput).val())+1);
			$(facilityInput).focus();
		});
	}
	function fn_removeFacility(e){
		$(e.target).parent().remove();
	}
	function fn_addOption(){
		$('#add-option-btn').click(function(event){
			let strHtml =`
				<section class="option">
				<article class="option-box">
					<div class="option-subtitle">
						공간이름<span class="required-data">필수 사항</span>
					</div>
					<div class="option-content">
						<input class="option-input" type="text" name="po_name" />
						<span id="character-length" ></span>
					</div>
				</article>
				<article class="option-box">
					<div class="option-subtitle">
						가격<span class="required-data">필수 사항</span>
					</div>
					<div class="option-content">
						평일 : <input type="number" name="po_dayPrice" required />원
						주말(공휴일) : <input type="number" name="po_holiday" required/>원
					</div>
				</article>
				<article class="option-box">
					<div class="option-subtitle">
						인원<span class="required-data">필수 사항</span>
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
						<button type="button" class="add-facility-btn" >편의시설 추가</button>
						<ul id="facility-list">
							
						</ul>
					</div>
				</article>
				<article class="option-box">
				<div class="option-subtitle">
					썸네일<span class="required-data">필수 사항</span>
				</div>
				<div class="option-content">
					<label for="option-thumbnail">사진 고르기</label>
					<input id="option-thumbnail" type="file" name="po_img" required/>
					<div id="option-img-box">
					
					</div>
				</div>
				</article>
			`;
			$('section.option').last().after(strHtml);
			fn_addFacility($('.add-facility-btn').last());
			fn_previewThumbnail('#option-thumbnail');
		});
	}
	function fn_previewThumbnail(btn){
		$(btn).on('change', function(event){
			$(btn).next().empty();
			for (let image of event.target.files) { 
				
				let reader = new FileReader();
			
				reader.onload = function(event) {
					$(btn).next().append($('<img>').prop('src', event.target.result));
				};
			reader.readAsDataURL(image);
			}
		});
	}
</script>
<header class="title-area">
	<h1>공간등록</h1>
</header>
<section>
	<form method="post" enctype="multipart/form-data">
		<article class="place-insert-list">
			<div class="subtitle">카테고리 선택	 <span class="required-data">필수 사항</span> </div>
			<div class="sub-content">
				<ul id="category-list">
					<c:forEach var="categoryDto" items="${categoryList}" >
					<li>
						<a href="javascript:void(0);" role="button">${categoryDto.pc_name}</a>
						<input type="hidden" value="${categoryDto.pc_no}" />
					</li>
					</c:forEach>
				</ul>
				<input type="hidden" name="pc_no" required/>
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">공간 이름<span class="required-data">필수 사항</span> </div>
			<div class="sub-content">
				<input class="place-input" type="text" name="p_title" placeholder="최대 50자" required/>
				<span id="character-length" ></span>자 / 50자<br/>
				<p class="example-box" style="white-space:pre-line;">
					리스트에 공개 될 제목입니다.
				</p>
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">사업장명 <span class="required-data">필수 사항</span> </div>
			<div class="sub-content">
				<input class="place-input" type="text" name="p_name" placeholder="최대 50자" required/>
				<span id="character-length" ></span>자 / 50자
				<p class="example-box" style="white-space:pre-line;">
					사업자로 등록되어 있는 사업장 이름을 적어주세요.
				</p>
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">공간 한줄 소개</div>
			<div class="sub-content">
				<input class="place-input" type="text" name="p_desc" placeholder="최대 150자" />
				<span id="character-length" ></span>자 / 150자
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">공간 소개 <span class="required-data">필수 사항</span></div>
			<div class="sub-content">
				<textarea class="place-input" rows="5" cols="100" name="p_content" placeholder="최대 2000자" required></textarea>
				<span id="character-length" ></span>자 / 2000자
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">시설안내 <span class="required-data">필수 사항</span></div>
			<div class="sub-content">
				<!-- 추가버튼이 있고 추가버튼을 누르면 li추가와 동시에 input 생성 js로 구현 -->
				<ul id="place-info-list">
					<li><input class="place-input" type="text" name="p_info" placeholder="추가하려면 추가 버튼을 눌러주세요" required/></li>
				</ul>
				<button id="add-info-list-btn" type="button">추가</button>
				<button id="remove-info-list-btn" type="button">삭제</button>
			</div>
			<p class="example-box" style="white-space:pre-line;">
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
			<div class="subtitle">예약시 주의사항 <span class="required-data">필수 사항</span></div>
			<div class="sub-content">
				<!-- 추가버튼이 있고 추가버튼을 누르면 li추가와 동시에 input 생성 js로 구현 -->
				<ul id="place-remark-list">
					<li><input class="place-input" type="text" name="p_remark" placeholder="추가하려면 추가 버튼을 눌러주세요" required /></li>
				</ul>
				<button id="add-remark-list-btn" type="button">추가</button>
				<button id="remove-remark-list-btn" type="button">삭제</button>
			</div>
			<p class="example-box" style="white-space:pre-line; width: 100%;">
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
			<div class="subtitle">썸네일</div>
			<div class="sub-content">
				<label for="upload-btn">사진 고르기</label>
				<input id="upload-btn" class="place-input" type="file" name="p_img" accept="image/*" placeholder="이미지 파일을 추가해주세요 (JPG,JPEG, PNG)" multiple required />
				<div id="img-box">
					<!-- 업로드 이미지 미리보기 -->
				</div>
			</div>
			<p class="example-box" style="width: 100%; white-space:pre-line;">
				등록 가능 이미지 : JPEG, JPG, PNG
				등록 제한 이미지 : 허위 거짓 이미지, 음란물, 텍스트가 포함된 이미지, 제 3자의 재산권.초상권을 침해하는 이미지 등의 등록 제한 이미지를 업로드하시는 경우, 공간 노출이 제한됩니다.
				최대 용량 : 10MB
				최소 1장의 이미지는 등록해야합니다.
			</p>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">주소(위치) <span class="required-data">필수 사항</span></div>
			<div class="sub-content">
				<input class="place-input" id="place-addr" type="text" name="p_addr" placeholder="주소를 등록해주세요" readonly required/>
				<button type="button" id="addr-search-btn">주소등록</button>
				<input class="place-input" id="place-addr-detail" type="text" name="p_addrdetail" placeholder="상세 주소를 입력해주세요" />
				<input id="place-bname" type="hidden" name="p_bname" />
			</div>
		</article>
		<article class="place-insert-list">
			<div class="subtitle">옵션</div>
			<div class="sub-content" >
				<div class="option-list" style="margin: 0 auto; width:640px; display:grid; grid-template-columns: repeat(3,200px); gap: 10px 20px; ">
					<section class="option">
						<article class="option-box">
							<div class="option-subtitle">
								공간이름<span class="required-data">필수 사항</span>
							</div>
							<div class="option-content">
								<input class="option-input" type="text" name="po_name" required/>
								<span id="character-length" ></span>
							</div>
						</article>
						<article class="option-box">
							<div class="option-subtitle">
								가격<span class="required-data">필수 사항</span>
							</div>
							<div class="option-content">
								평일 : <input type="number" name="po_dayPrice" required />원
								주말(공휴일) : <input type="number" name="po_holiday" required />원
							</div>
						</article>
						<article class="option-box">
							<div class="option-subtitle">
								인원<span class="required-data">필수 사항</span>
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
								<button type="button" class="add-facility-btn" >편의시설 추가</button>
								<ul id="facility-list">
									<!-- 추가버튼을 누르면 여기에 input hidden과 li태그 추가 -->
								</ul>
								<input type="hidden" name="facility-count" value="0" />
							</div>
						</article>
						<article class="option-box">
							<div class="option-subtitle">
								썸네일<span class="required-data">필수 사항</span>
							</div>
							<div class="option-content">
								<label for="option-thumbnail">사진 고르기</label>
								<input id="option-thumbnail" type="file" name="po_img" accept="image/*" required/>
								<div id="option-img-box">
								
								</div>
							</div>
						</article>
					</section>
					<button type="button" id="add-option-btn" >옵션추가</button>
				</div>
			</div>
		</article>
		<!-- hidden -->
		<input type="hidden" name="s_no" value="${loginDto.s_no}" />
		<button type="button" onclick="fn_placeInsert(this.form)">등록하기</button>
		<button type="button" onclick="location.href='placeListPage.place'" >목록으로 돌아가기</button>
	</form>
</section>


<%@ include file="../template/footer.jsp" %>