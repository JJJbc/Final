

function membersearch() {
		var searchNField = $("#searchNField").val();
		var searchNKeyword = $("#searchNKeyword").val();
		
		$("#searchField").val(searchNField);
		$("#searchKeyword").val(searchNKeyword);
		$("#curPage").val(1);
		
	/* 	alert(searchNKeyword); */
		
		$("#pagingForm").submit();			
	}
	
	function memberDeleteFnc(memberNo){
		if (typeof userAuthority === 'undefined' || userAuthority !== 1) {
		        alert("삭제 권한이 없습니다");
		        return;
		   }
		
		if (confirm("정말로 삭제하시겠습니까?")){
			$.ajax({
				url: '/member/delete',
				type: 'POST',
				data: { memberNo: memberNo },
				success: function(result){
					if(result === 'success'){
						alert("성공적으로 삭제되었습니다");
						location.reload();
					}else {
						alert("삭제에 실패했습니다");
					}
				},
				error: function(){
					alert("오류가 발생했습니다");
				}
			});
		}
	}