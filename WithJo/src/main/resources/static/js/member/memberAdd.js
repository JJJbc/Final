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
