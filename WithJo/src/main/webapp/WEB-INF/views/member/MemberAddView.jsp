<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<!-- css 초기화 -->
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
<!-- 페이지 css -->
<link rel="stylesheet" href="/css/common/common.css">
<link rel="stylesheet" href="/css/member/memberAdd.css">
<script defer src="/js/common/common.js"></script>
<script defer src="/js/member/memberAdd.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>


	<div id="main-container">
		<div class="signUpFlexBox">
			<div class="signUpImg">
				<img alt="." src="/img/common/sign&up.jpg">
				<p>구분짓기</p>
			</div>

		<div class="main-container_signUp">
			<div class="main-container_signUp_content_form">
				<!-- signup form -->
				<form class="mainSignupForm" action="./add" method="post" class="main_signUp_content" name="frm">

					<div class="main_signUp_content__memberId">
						<!-- 아이디 -->
						<label for="memberId">아이디</label>
						<div class="main_signUp_content__memberId__idInput">
							<input class="memberId" type="text"  placeholder="아이디" name="memberId"> 
							<input type="button" class="checkIdBtn"	value="중복 체크">
						</div>
					</div>


					<!-- 패스워드 -->
					<div class="main_signUp_content__memberPw">
						<label for="memberPw">패스워드</label>
						<div class="main_signUp_content__memberPw__pwInput">
							<input class="memberPw" type="password" placeholder="우편번호" name="memberPw">
						</div>
						<div class="passwordMessage"></div>
					</div>


					<!-- 이름 -->
					<div class="main_signUp_content__memberName">
						<label for="memberName">이름</label>
						<div class="main_signUp_content__memberName__nameInput">
							<input class="memberName" type="text" placeholder="이름"  name="memberName">
						</div>
					</div>


					<div class="main_signUp_content__memberBirthDate">
						<label for="memberBirthDate">생년월일</label>
						<div class="main_signUp_content__memberBirtDate__birthDateInput">
							<input type="number" id="birthDateYear" name="birthDateYear" maxlength="4" max="2019" min="1924" placeholder="YYYY"> 
							
							<input type="number" id="birthDateMonth" name="birthDateMonth" maxlength="2" max="12" min="01" placeholder="MM">
							
							<input type="number" id="birthDateDay" name="birthDateDay" maxlength="2" max="31" min="01" placeholder="DD">
						</div>
					</div>

					<div class="main_signUp_content__memberAddress">
						<label for="memberAddress">주소</label>
						<div class="main_signUp_content__memberAddress__addressInput">
							<input type="text" id="memberZipCode" name="memberZipCode" placeholder="우편번호" readonly >
							<input type="button" onclick="findAddress()" value="우편번호 찾기"><br>
							<input type="text" id="memberAddress" name="memberAddress" placeholder="주소" readonly>
							<br>
							<input type="text" id="memberAddressInfo" name=memberAddressInfo placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" disabled>
						</div>
					</div>

					<div class="signUpBtn">
						<input type="submit" value="회원가입" />
					</div>

				</form>

			</div>

		</div>

	</div>
</div>
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>

  
</body>
</html>