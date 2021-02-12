<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="myPage.jsp" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
<link rel="stylesheet" href="resources/style/myPage/clubList.css">	
<script>

</script>
	<div class="mypage-contents">
		<h2>모임 관리</h2>
		<hr class="top">
		
		<div class="button">
			<input type="button" class="updateBtn" value="수정" onclick=""/>
			<input type="button" class="cancelBtn" value="취소" onclick="history.back()"/>
			<input type="button" class="cancelBtn" value="삭제" onclick=""/>
		</div>
				
		<div class="club-wrap">
			<div class="clubImage"><a href=""><img alt="모임이미지" src="resources/images/club/${ClubListDto.c_mainimg}"></a></div>
			<div class="clubContent">
				<div class="title">${ClubListDto.c_title}</div>
				<div class="startDate">${ClubListDto.c_startDate} 시작</div><br/>
				<div class="startDate">${ClubListDto.c_endDate} 시작</div><br/>
				<div class="min">최소 인원 : <input type="text" name="min" value="" /> 명</div>
				<div class="max">최대 인원 : <input type="text" name="max" value="" /> 명</div>
			</div>
		</div>
		
		<div class="space-wrap">
			<h2>공간 예약</h2>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>장소명</th>
						<th>예약일자</th>
					</tr>
				</thead>
				<c:forEach var="ClubListDto" items="${list}">
					<tr>
						<td>no</td>
						<td>place_name</td>
						<td>res_date</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="membersInfo-wrap">
			<h2>참가 멤버</h2>
			<div class="clubCount">총 인원: 명</div>
			
			<c:if test="${empty list}">
				<div class="empty">아직 참가한 인원이 없습니다. :(</div>
			</c:if>
			<c:if test="${not empty list}">
				<div class="membersInfo">
					<div class="memberInfo">
						<div class="memberImg"></div>
						<div class="memberDetail">
							<div class="nickAndName"></div>
							<div class="cl-card"></div>
						</div>
						<div class="detailBtn">
							<input type="button" value="자세히" onclick="" />
						</div>
					</div>
				</div>
			</c:if>
			
		</div>
		
		<div class="mainContent">
			<h2>내용</h2>
			<span class="cDecs">한줄설명</span><br/>
			<div class="desc-box"><input type="text" name="desc" value="" /></div>
			<span class="cContent">설명</span><br/>
			<div class="content-box"><input type="text" name="desc" value="" /></div>
			
		</div>
	</div>
</div>
<%@ include file="../template/footer.jsp" %>