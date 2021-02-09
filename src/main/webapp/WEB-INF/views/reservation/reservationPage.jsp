<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="BaraON :: 예약" name="title"/>
</jsp:include>

<script type="text/javascript" src="resources/js/reserve.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	let isProgress=false;
	$(function(){
		$("#res-update").click(function() {
			if(isProgress){
				return;
			}
			isProgress=true;
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
				 */
				name : '${placeOptionDto.po_name}',
				//결제창에서 보여질 이름
				amount : $('[name="res_price"]').val(),
				buyer_email : $('[name="res_email"]').val(),
				buyer_name : $('[name="res_name"]').val(),
				buyer_tel : $('[name="res_phone"]').val(),
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					let sendObj = {
							'res_no' : '${reservationDto.res_no}',
							'res_email' : rsp.buyer_email,
							'res_price' : rsp.paid_amount,
							'res_applynum' : rsp.apply_num,
							'res_purpose' : $('[name="res_purpose"]').val(),
							'res_requirement' : $('[name="requirement"]').val()
					};
					$.ajax({
						url:'reservationUpdate.reservation',
						type:'put',
						data:JSON.stringify(sendObj),
						contentType:'application/json; charset=utf-8',
						dataType:'json',
						success:function(responseObj){
							if(responseObj.result){
								alert('결제에 성공했습니다. 예약대기상태로 변경됩니다.');
							} else {
								alert('결제에 실패했습니다. 다시 시도해주세요');
							}
						},
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						},
						complete:function(){
							setTimeout(function(){
								isProgress = false;
							},1000);
							location.href='placeListPage.place';
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		});
		
	})
</script>
<!-- <link rel="stylesheet" href="resorces/style/reserve.css" /> -->

<div>
	<form method="post" id="res-form">
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
						예약자<span class="required-data">필수사항</span><br/>
						<input type="text" name="res_name" value="${memberDto.m_name}" />
					</li>
					<li>
						연락처<span class="required-data">필수사항</span><br/>
						<input type="text" name="res_phone" value="${memberDto.m_phone}" />
					</li>
					<li>
						이메일<input type="text" name="res_email" value="${memberDto.m_email}" />
					</li>
					<li>
						사용목적<span class="required-data">필수사항</span><br/>
						<input type="text" name="res_purpose" />
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
				<table>
					<tbody>
						<tr>
							<th>상호</th>
							<td>${placeDto.p_name}</td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td>${sellerDto.s_name}</td>
						</tr>
						<tr>
							<th>사업장 위치</th>
							<td>${placeDto.p_addr}&nbsp;${placeDto.p_addrdetail}</td>
						</tr>
						<tr>
							<th>사업자 번호</th>
							<td>${sellerDto.s_companyNo}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${sellerDto.s_phone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${sellerDto.s_email}</td>
						</tr>
					</tbody>
				</table>
				
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
	</section>
	<section class="right">
		<aside class="res-insert-list">
			<div class="subtitle">결제 예정금액</div>
			<div class="sub-content">
				<strong>예약날짜</strong><br/>
				<span class="res-data">${reservationDto.res_date}</span>
				<strong>예약인원</strong>
				<span class="res-data">${reservationDto.res_people}</span>
				<div class="res-date" id="res-price">
					<c:if test="${isWeekend}">
						${placeOptionDto.po_holiday}
						<input type="hidden" name="res_price" value="${placeOptionDto.po_holiday}" />
					</c:if>
					<c:if test="${not isWeekend}">
						${placeOptionDto.po_dayPrice}
						<input type="hidden" name="res_price" value="${placeOptionDto.po_dayPrice}" />
					</c:if>
				</div>
			</div>
			<div class="btn-box">
				<button id="res-update" type="button">결제하기</button>
			</div>
		</aside>
	</section>
	</form>
</div>
<%@ include file="../template/footer.jsp" %>