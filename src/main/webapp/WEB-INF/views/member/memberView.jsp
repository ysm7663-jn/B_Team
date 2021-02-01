<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
		
	
	

	<h3>마이페이지</h3>
	
	<table>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${memberDto2.mId}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${memberDto2.mName}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="button" id="btn1" value="비밀번호 변경" onclick="fn_pwOpen"/></td>
			</tr>
			<!--	비밀번호 변경  시작 -->
			<tr style="display:none"; id="divPwChange">
				<th></th>
				<td>
					<table>
						<tbody>
							<tr>
								<td>현재 비밀번호</td>
								<td><input type="password" id="pw1" name="pw1"/></td>
							</tr>
							<tr>
								<td>새 비밀번호</td>
								<td><input type="password" id="pw2" name="pw2"/></td>
							</tr>
							<tr>
								<td>새 비밀번호 확인</td>
								<td><input type="password" id="pw3" name="pw3"/></td>
							</tr>
							<tr>
								<td><input type="button" value="수정하기" onclick=""/></td>
								<td>*비밀번호 변경시 수정하기 버튼을 누르셔야 합니다</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td> ${memberDto2.mNick} <input type="button" value="닉네임 변경" onclick=""/></td>
			</tr>
			
			<!--	닉네임 변경  시작 -->
			<tr style="display:none"; id="divPwChange">
				<th></th>
				<td>
					<table>
						<tbody>
							<tr>
								<td>현재 닉네임</td>
								<td><input type="password" id="pw1" name="pw1"/></td>
							</tr>
							<tr>
								<td>새 닉네임</td>
								<td><input type="password" id="pw2" name="pw2"/></td>
							</tr>
							<tr>
								<td><input type="button" value="중복검사하기" onclick=""/></td>
							</tr>
							<tr>
								<td><input type="button" value="수정하기" onclick=""/></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td>${memberDto2.mBirth}</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><input type="text" value="${memberDto2.mPhone}"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" value="${memberDto2.mEmail}"/></td>
			</tr>
			<tr>
				<td><input type="button" value="확인"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="button" value="수정"/></td>
			</tr>
			
		</tbody>
	</table>


<%@ include file="../template/footer.jsp" %>