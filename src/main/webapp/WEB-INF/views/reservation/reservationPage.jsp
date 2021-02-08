<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="BaraON :: 예약" name="title"/>
</jsp:include>

<script type="text/javascript" src="resources/js/reserve.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

	$(function(){
		$("#check_module").click(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp97817701');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				/*
				'kakao':카카오페이,
				html5_inicis':이니시스(웹표준결제)
				'nice':나이스페이
				'jtnet':제이티넷
				'uplus':LG유플러스
				'danal':다날
				'payco':페이코
				'syrup':시럽페이
				'paypal':페이팔
				 */
				pay_method : 'card',
				/*
				'samsung':삼성페이,
				'card':신용카드,
				'trans':실시간계좌이체,
				'vbank':가상계좌,
				'phone':휴대폰소액결제
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/*
				merchant_uid에 경우
				https://docs.iamport.kr/implementation/payment
				위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				참고하세요.
				나중에 포스팅 해볼게요.
				 */
				name : '주문명:결제테스트',
				//결제창에서 보여질 이름
				amount : 1000,
				//가격
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
		
	})
</script>
<!-- <link rel="stylesheet" href="resorces/style/reserve.css" /> -->

<div>
	<form>
	<section class="left">
		<article class="res-insert-list">
			<div class="subtitle">예약 공간</div>
			<div class="sub-content">
				
			</div>
		</article>
		<article class="res-insert-list">
			<div class="subtitle">예약자 정보</div>
			<div class="sub-content">
				<ul>
					<li>
						예약자 <input type="text" name="res_name" value="${loginDto.m_name}" />
					</li>
					<li>
						연락처 <input type="text" name="res_phone" value="${loginDto.m_phone}" />
					</li>
					<li>
						이메일 <input type="text" name="res_email" value="${loginDto.m_email}" />
					</li>
					<li>
						사용목적 <input type="text" name="res_purpose" />
					</li>
					<li>
						요구사항 
						<textarea rows="5" cols="50" name="requirement"></textarea>
					</li>
				</ul>
			</div>
		</article>
		<article class="res-insert-list">
			<div class="subtitle">호스트 정보</div>
			<div class="sub-content">
				
			</div>
		</article>
		<article class="res-insert-list">
			<div class="subtitle">예약시 주의사항</div>
			<div class="sub-content">
				
			</div>
		</article>
		<article class="res-insert-list">
			<div class="subtitle">서비스 동의<span class="required-data" >필수 사항</span></div>
			<div class="sub-content">
				
			</div>
		</article>
		<article class="res-insert-list">
			<div class="subtitle"></div>
			<div class="sub-content">
				
			</div>
		</article>
		<article class="res-insert-list">
			<div class="subtitle"></div>
			<div class="sub-content">
				
			</div>
		</article>
		<article class="res-insert-list">
			<div class="subtitle"></div>
			<div class="sub-content">
				
			</div>
		</article>
	</section>
	<section class="right">
		<aside class="res-insert-list">
			<div class="subtitle">결제 예정금액</div>
			<div class="sub-content">
				
			</div>
			<div class="btn-box">
				<button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
			</div>
		</aside>
	</section>
	<p>아임 서포트 결제 모듈 테스트 해보기</p>
	</form>
</div>
<%@ include file="../template/footer.jsp" %>