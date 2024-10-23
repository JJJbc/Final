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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
<script>
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberZipCode').value = data.zonecode;
                document.getElementById("memberAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memberAddressInfo").focus();
            }
        }).open();
    }
</script>

<script>
$(document).ready(function() {
    // 아이디 중복 검사
    $(".checkIdBtn").on("click", function() {
        var memberId = $(".memberId").val().trim(); // 앞뒤 공백 제거
        if (memberId === "") {
            alert("아이디를 입력해주세요.");
            return; // 함수 실행 중단
        }
        
        // 아이디가 입력되었을 때만 AJAX 요청 실행
        $.ajax({
            type: "POST",
            url: "/member/checkId",
            data: { memberId: memberId },
            success: function(response) {
                if (response.isDuplicate) {
                    alert("이미 사용 중인 아이디입니다.");
                } else {
                    alert("사용 가능한 아이디입니다.");
                }
            },
            error: function() {
                alert("아이디 확인 중 오류가 발생했습니다.");
            }
        });
    });

    // 비밀번호 유효성 검사
    $("input.memberPw").on("input", function() {
        var password = $(this).val();
        var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,18}$/;

        if (!regex.test(password)) {
            $(".passwordMessage").text("비밀번호는 6~18자리의 영어, 숫자, 특수문자를 포함해야 합니다.").css("color", "red");
        } else {
            $(".passwordMessage").text("사용 가능한 비밀번호입니다.").css("color", "green");
        }
    });
});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>


	<div class="main-container">

		<div class="main-container_signUp">
			<div class="main-container_signUp_content_form">
				<!-- signup form -->
				<form class="mainSignupForm" action="./add" method="post" class="main_signUp_content" name="frm">

					<div class="main_signUp_content__memberId">
						<!-- 아이디 -->
						<label for="memberId">아이디</label>
						<div class="main_signUp_content__memberId__idInput">
							<input class="memberId" type="text" value="${memberVo.memberId}" name="memberId"> 
							<input type="button" class="checkIdBtn"	value="중복 체크">
						</div>
					</div>


					<!-- 패스워드 -->
					<div class="main_signUp_content__memberPw">
						<label for="memberPw">패스워드</label>
						<div class="main_signUp_content__memberPw__pwInput">
							<input class="memberPw" type="password"	value="${memberVo.memberPw}" name="memberPw">
						</div>
						<div class="passwordMessage"></div>
					</div>


					<!-- 이름 -->
					<div class="main_signUp_content__memberName">
						<label for="memberName">이름</label>
						<div class="main_signUp_content__memberName__nameInput">
							<input class="memberName" type="text" value="${memberVo.memberName}" name="memberName">
						</div>
					</div>


					<div class="main_signUp_content__memberBirthDate">
						<label for="memberBirthDate">생년월일</label>
						<div class="main_signUp_content__memberBirtDate__birthDateInput">
							<input type="text" class="memberBirthDate" name="memberBirthDate" maxlength="6" value="${memberVo.memberBirthDate}"> 
							<span class="separator"><h1>-</h1></span> 
							<input type="password" class="memberGender" name="memberGender" maxlength="1" value="${memberVo.memberGender}">
							<span class="hidden-digits">●●●●●●</span>
						</div>
					</div>

					<div class="main_signUp_content__memberAddress">
						<label for="memberAddress">주소</label>
						<div class="main_signUp_content__memberAddress__addressInput">
							<input type="text" id="memberZipCode" name="memberZipCode" placeholder="우편번호" readonly value="${memberVo.memberZipCode}">
							<input type="button" onclick="findAddress()" value="우편번호 찾기">${memberVo.memberZipCode}<br>
							<input type="text" id="memberAddress" name="memberAddress" placeholder="주소" readonly value="${memberVo.memberAddress}">
							<br>
							<input type="text" id="memberAddressInfo" name=memberAddressInfo placeholder="상세주소" value="${memberVo.memberAddressInfo}">
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

	<jsp:include page="/WEB-INF/views/Footer.jsp"/>

  
</body>
</html>