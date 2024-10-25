<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
<link rel="stylesheet" href="/css/member/memberLogin.css">

<script defer src="/js/common/common.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
  

	<!-- toast container -->

  <div id="main-container">
  
 		<div class="signInFlexBox">
			<div class="signInImg">
				<img class="signInImg__img" alt="." src="/img/common/singin&up.png">
				<div class="signInImg__textContainer">
					<div class="signInImg__firstText">
						<p><span>위드조 문화센터에</span></p>
					</div>
					<div class="signInImg__secondText">
						<p><span>처음 오셨나요?</span></p>
					</div>
					<div class="signUp_content--signupBtn">
						<button type="button" class="signUp_btn" onclick="location.href='/member/add'">가입하러가기 -></button>
					</div>
				</div>
			</div>
	
			<div class="main_signIn">
				<div class="main_signIn--inner">
					<div class="main_signIn--title">
						<p>로그인</p>							
					</div>
					<div class="main_signIn_content_form">
						<form id="loginForm" action="./login" method="post" class="main_signIn_content">
							<div class="signIn_content--memberId">								
								<div class="signIn_content_element--textBox memberId">
									<input id="memberId" type="text" name="memberId" value="" placeholder="아이디를를 입력해주세요">
								</div>
							</div>
							<div class="signIn_content--memberPw">
								<div class="signIn_content_element--textBox memberPw">
									<input id="memberPw" type="password" name="memberPw" value="" placeholder="비밀번호를 입력해주세요">
								</div>
							</div>
							<div class="signIn_content--loginBtn signin_btn">
								<div class="signIn_content_element--textBox signin_btn">
									<input type="submit" value="로그인" class="signin_btn"/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div><!-- main_signIn -->
		</div>
	</div> 
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>
  
</body>

</html>