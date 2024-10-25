$(document).ready(function() {
    // 아이디 중복 검사
    $(".checkIdBtn").on("click", function() {
        var memberId = $(".memberId").val(); // 앞뒤 공백 제거
		var idRegex = /^[A-Za-z0-9]+$/;
        if (memberId === "") {
            alert("아이디를 입력해주세요.");
            return; // 함수 실행 중단
        }
		
		// 아이디 공백 체크
		if (/\s/.test(memberId)){
			alert("아이디에 공백을 포함할 수 없습니다.");
			return;
		}
		
		// 아이디 한글 체크
		if (!idRegex.test(memberId)){
			alert("아이디는 영어와 숫자만 사용 가능합니다.");
			return;
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
        var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,20}$/;

        if (!regex.test(password)) {
            $(".passwordMessage").text("영어+숫자 4 자 이상이어야 합니다.").css("color", "red");
        } else {
            $(".passwordMessage").text("사용 가능한 비밀번호입니다.").css("color", "green");
        }
		
		// 비밀번호 공백 체크
		if (/\s/.test(password)){
			$(".passwordMessage").text("비밀번호에 공백을 포함할 수 없습니다.").css("color", "red");
			return;
		}
  	  });
	});
	
	// 생년월일 년도검사
	$("input.birthDateYear").on("change", function(){
		var year = $(this).val();
		    if (isNaN(year) || year < 1924 || year > 2019) {
		        $(".birthDateYearMessage").text("1924년부터 2019까지 입력가능합니다").css("color", "red");
		    } else {
		        $(".birthDateYearMessage").text("");
		    }
	});
	
	// 생년월일 월 검사
	$("input.birthDateMonth").on("change", function(){
		var month = $(this).val();
		if (month >= 1 && month < 10){
			$(this).val(month.padStart(2, "0"));
		}
		if (isNaN(month) || month < 1 || month > 12){
			$(".birthDateMonthMessage").text("1월부터 12월까지 입력가능합니다").css("color", "red");
		} else {
			$(".birthDateMonthMessage").text("");
		}	
	});
	
	// 생년월일 일 검사
	$("input.birthDateDay").on("change", function(){
		var year = $("input.birthDateYear").val();
		var month = $("input.birthDateMonth").val();		
		var day = $(this).val();
		
		function isLeafYear(year){
			return(year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
		}
		
		if(day >= 1 && day < 10){
			$(this).val(day.padStart(2, "0"));
			
		}if (isNaN(day) || day < 1 || day > 31){
			$(".birthDateDayMessage").text("1일부터 31일까지 입력가능합니다").css("color", "red");
		}else if (month === 2){
			if(isLeafYear(year)){
				if(day > 29){
					$(".birthDateDayMessage").text("윤년의 2월은 29일까지 입력가능합니다.").css("color", "red");
				}else{
					$(".birthDateDayMessage").text("");
				}
			}else{
				if(day > 28){
					$(".birthDateDayMessage").text("2월은 28일까지 입력가능합니다").css("color", "red");
				}else{
					$(".birthDateDayMessage").text("");
				}
			}
		}else if((month === 4 || month === 6 || month === 9 || month === 11) && day > 30){
			$(".birthDateDayMessage").text("이 달은 30일까지 입력가능합니다").css("color", "red");
		} else {
			$(".birthDateDayMessage").text("");
		}
		
		
		
		
		
	})

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
	
function signUpFnc(){
	var requiredFields = [
	        { id: "memberId", name: "아이디" },
	        { id: "memberPw", name: "비밀번호" },
	        { id: "memberName", name: "이름" },
	        { id: "birthDateYear", name: "생년" },
	        { id: "birthDateMonth", name: "생월" },
	        { id: "birthDateDay", name: "생일" },			
	        { id: "memberZipCode", name: "우편번호" },
	        { id: "memberAddress", name: "주소" },
			{ id: "memberAddressInfo", name: "상세주소" },
	        // 필요한 다른 필드들을 여기에 추가
	    ];
		
		var formData = {};
		
		var gender = $("input[name='memberGender']:checked").val();
		    if (!gender) {
		        alert("성별을 선택해주세요.");
		        return;
		    }
			
		formData.memberGender = parseInt(gender); // 문자열을 정수로 변환

	    for (var i = 0; i < requiredFields.length; i++) {
	        var field = requiredFields[i];
	        var value = $("#" + field.id).val();
	        if (value === "") {
	            alert(field.name + "을(를) 입력해주세요.");
	            $("#" + field.id).focus();
	            return;
	        }
			formData[field.id] = value;
	    }
		
		var year = $("#birthDateYear").val();
		var month = $("#birthDateMonth").val().padStart(2, '0');
		var day = $("#birthDateDay").val().padStart(2, '0');
		var birthDate = year + month + day; // YYYYMMDD 형식

		formData.memberBirthDate = birthDate;
		
	    // 모든 필드가 채워졌다면, AJAX를 사용하여 서버로 데이터 전송
	    $.ajax({
	        type: "POST",
	        url: "/member/add",
			contentType: "application/json",
			data: JSON.stringify(formData),
			dataType: "json",
	        success: function(response) {
	            alert("회원가입이 완료되었습니다.");
	            window.location.href = "/member/login"; // 로그인 페이지로 리다이렉트
	        },
	        error: function(xhr, status, error) {
	            alert("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
	            console.error(xhr, status, error);
	        }
	    });
}
	
