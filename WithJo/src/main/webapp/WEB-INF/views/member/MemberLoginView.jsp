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
<script defer src="/js/common/common.js"></script>



<style type="text/css">
#main-container{
	margin-top: 150px;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
  

	<!-- toast container -->

  <div id="main-container">
		<div class="main_signIn">
			<div class="main_signIn--title">							
			</div>
			<div class="main_signIn_content_form">
				<form id="loginForm" action="./login" method="post" class="main_signIn_content">
					<div class="main_signIn_content__items">
						<div class="signIn_content--item">
							<label  for="memerId">아이디</label> 
							<div class="signIn_content_element--textBox">
								<input id="memberId" type="text" name="memberId" value="">
							</div>
						</div>
						<div class="signIn_content--item">
							<label for="memberPw">비밀번호</label> 
							<div class="signIn_content_element--textBox">
								<input id="memberPw" type="password" name="memberPw" value="">
							</div>
						</div>
						<div class="signIn_content--item">
							<input type="submit" value="로그인" class="signin_btn"/>
						</div>
						<div class="signUp_content--item">
							<button type="button" class="signUp_btn" onclick="location.href='/member/add'">가입하러가기 -></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div> <!-- main-container -->
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>

  
</body>

</html>