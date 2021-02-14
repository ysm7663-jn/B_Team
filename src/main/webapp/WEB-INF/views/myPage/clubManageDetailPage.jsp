<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="myPage.jsp" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
 <link rel="stylesheet" href="resources/style/myPage/clubManageDetailPage.css">	
<script>
	function fn_clubDelete(f){
		if(confirm('정말로 모임을 삭제하시겠습니까?')) {
			f.action='clubDelete.club';
			f.submit();
		}
	}
	
	$(function() {
		if(${state == 1}) {   // 지난 모임이면
			$('.ing').remove();
		}
	});
</script>
	<div class="mypage-contents">
		<h2>모임 관리</h2>
		<hr class="top">
		<div class="buttons">
			<form method="post">
				<!-- hidden -->
				<input type="hidden" name="c_no" value="${clubDto.c_no}" />
				<input type="hidden" name="c_mainImg" value="${clubDto.c_mainImg}" />
				<input type="button" class="btn delete" value="삭제" onclick="fn_clubDelete(this.form)"/>
			</form>
			<input type="button" class="btn back" value="뒤로가기" onclick="history.back()"/>
		</div>
				
		<div class="clubSimple-wrap">
			<div class="clubImage"><a href=""><img alt="모임이미지" src="resources/images/club/${clubDto.c_mainImg}"></a></div>
			<div class="clubContent">
				<div class="title">
					<span class="part">
						<c:if test="${clubDto.c_part == 0}">
							(정기)
						</c:if>
						<c:if test="${clubDto.c_part == 1}">
							(번개)
						</c:if>
					</span>
					${clubDto.c_title}
					</div>
				<div class="date">${clubDto.c_startDate} ~ ${clubDto.c_endDate}</div><br/>
			</div>
		</div>
		
		<div class="space-wrap">
			<h2>공간 내역</h2>
			<input type="button" class="ing" value="장소 추가" onclick="location.href='placeListPage.place'" />
			<table border="1">
				<thead>
					<tr>
						<th>예약번호</th>
						<th>장소명</th>
						<th>예약일자</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<c:forEach var="reservationDto" items="${reservationList}">
					<tr>
						<td>${reservationDto.res_no}</td>
						<td>${reservationDto.p_name}</td>
						<td>${reservationDto.res_date}</td>
						<td>${reservationDto.res_state}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="membersInfo-wrap">
			<h2>참가 멤버</h2>
			<div class="clubCount">현재 인원: ${memberCount}명</div>
			
			<c:if test="${empty clubList}">
				<div class="empty">아직 참가한 인원이 없습니다. :(</div>
			</c:if>
			<c:if test="${not empty clubList}">
				<div class="membersInfo">
				<c:forEach var="memberDto" items="${clubList}">
						<div class="memberInfo">
							<div class="memberImg"><i class="fas fa-user-circle"></i></div>
							<div class="memberDetail">
								<div class="nickAndName">${memberDto.m_nick}<span class="memberName">(${memberDto.m_name})</span></div>
								<div class="cl_card">
									<c:forEach begin="1" end="${memberDto.cl_card}" step="1">
										<i class="fas fa-skull"></i>
									</c:forEach>
								</div>
							</div>
							<div class="detailBtn">
								<input type="button" value="자세히" onclick="" />
							</div>
						</div>
				</c:forEach>
				</div>
			</c:if>
			
		</div>
		<hr class="contentSection">
		<div class="mainContent">
			<h2>내용</h2>
			<form>
				<!-- hidden -->
				
				<input type="button" class="ing" value="수정하러 가기" onclick="location.href='clubUpdatePage.club'" />
			</form>
			
			<div class="min">최소 인원:  ${clubDto.c_min}명</div>
			<div class="max">최대 인원:  ${clubDto.c_max}명</div>
			<h3>한줄설명</h3>
			<div class="desc">${clubDto.c_desc}</div>
			<h3>설명</h3>
			<div class="content">${clubDto.c_content}</div>
			<div class="sub box1">
				<div class="img"><img alt="이미지1" src="resources/images/club/${clubDto.c_img1}"></div>
				<div class="subContent">${clubDto.c_subContent1}</div>
			</div>
			<div class="sub box2">
				<div class="img"><img alt="이미지2" src="resources/images/club/${clubDto.c_img2}"></div>
				<div class="subContent">${clubDto.c_subContent2}</div>
			</div>
			<div class="sub box3">
				<div class="img"><img alt="이미지3" src="resources/images/club/${clubDto.c_img3}"></div>
				<div class="subContent">${clubDto.c_subContent3}</div>
			</div>
			
		</div>
	</div>
</div>
<%@ include file="../template/footer.jsp" %>