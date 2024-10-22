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

<style type="text/css">
.main-container{
	margin-top: 150px;
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
  

	<div class="main-container">

    <div class="main_signUp">      
      <div class="main_signUp_content_form">
        <!-- signup form -->
        <form class="mainSignupForm" action="./add" method="post" class="main_signUp_content" name="frm">

          <div class="main_signUp_content__item">
          	<!-- 아이디 -->
            <div class="main_signUp_content_element">
              <label for="memberId">아이디</label>
              <div class="signUp_content_element--textBox">
                <input class="memberId" type="text" value="${memberVo.memberId}" class="idCheckBox" name="memberId">                
              </div>
            </div>

            <!-- 패스워드 -->
            <div class="main_signUp_content_element">
              <label for="memberPw">패스워드</label>
              <div class="signUp_content_element--textBox">
                <input class="memberPw" type="password" value="${memberVo.memberPw}" name="memberPw">
              </div>
            </div>         
                    
            <!-- 이름 -->
            <div class="main_signUp_content_element">
              <label for="memberName">이름</label>
              <div class="signUp_content_element--textBox">
                <input class="memberName" type="text" value="${memberVo.memberName}" name="memberName">
              </div>
            </div>            
                         
            <div>
            	<label for="memberBirthDate">주민등록번호</label>
            	<div>
					<input type="text" class="memberBirthDate" name="memberBirthDate" value="${memberVo.memberBirthDate}">
					-
					<input type="password" class="memberGender" name="memberGender" maxlength="1" value="${memberVo.memberGender}">
					●●●●●●
				</div>
			</div>
            
            <div>
            	<label for="memberAddress">주소</label>
            	<div>            	
         	  		<input type="text" id="memberZipCode" name="memberZipCode" placeholder="우편번호" readonly value="${memberVo.memberZipCode}">
					<input type="button" onclick="findAddress()" value="우편번호 찾기">"${memberVo.memberZipCode}"<br>
					<input type="text" id="memberAddress" name="memberAddress" placeholder="주소" readonly value="${memberVo.memberAddress}"><br>
					<input type="text" id="memberAddressInfo" name=memberAddressInfo placeholder="상세주소" value="${memberVo.memberAddressInfo}">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" disabled>							
				</div>
			</div>
			
			
            

            <div class="signUp_content_element--signUpBtn">
              <input type="submit" value="회원가입"/>
            </div> 
          </div>
          <!-- main_signUp_content__item -->

        </form>
        <!-- signup form -->

      </div>
      <!-- main_signUp_content_form -->
     

     
    <!-- main_signUp -->

  </div>
  <!-- main-container -->
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>

  
</body>
</html>