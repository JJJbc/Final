<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>자유계시판 목록</title>
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

.informationSearch{
	margin-top: 150px;
}

.information .informationTable{
	border: 1px solid black;
	border-collapse: collapse;
	width: 100%;
}

.information .informationTable .tableBody .firstInformation{
	border: 1px solid black;
	border-collapse: collapse;
}

.information .informationTable .tableBody .firstInformation .information__name{
	font-weight: bold;
	font-size: 18px;
	text-align: center;
 }

.information .informationTable .tableBody .firstInformation .information__no{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .firstInformation .information__id{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .firstInformation .information__birthdate{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .secondInformation{
	border: 1px solid black;
	border-collapse: collapse;
}

.information .informationTable .tableBody .secondInformation .information__zipcode{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .secondInformation .information__address{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .secondInformation .information__addressInfo{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .secondInformation .information__gender{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .secondInformation .information__eMoney{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .secondInformation .information__credate{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.information .informationTable .tableBody .secondInformation .information__update{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}




</style>

<script type="text/javascript">
	function membersearch() {
		var searchNField = $("#searchNField").val();
		var searchNKeyword = $("#searchNKeyword").val();
		
		$("#searchField").val(searchNField);
		$("#searchKeyword").val(searchNKeyword);
		$("#curPage").val(1);
		
	/* 	alert(searchNKeyword); */
		
		$("#pagingForm").submit();			
	}
</script>

</head>


<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<div class="informationSearch">
		<select name="searchNField" class="searchNField">
			<option value="all" <c:if test="${searchMap.searchField == 'all'}">selected</c:if>>전체</option>
			<option value="memberName" <c:if test="${searchMap.searchField == 'memberName'}">selected</c:if>>이름</option>
			<option value="memberId" <c:if test="${searchMap.searchField == 'memberId'}">selected</c:if>>아이디</option>
		</select>
		
		<input type="text" id="searchNKeyword" name="searchNKeyword" value="${searchMap.searchKeyword}">
		<button type="button" onclick="membersearch();">검색</button>
	</div>


	
	<div class="information">
		<table class="informationTable">
			<tbody class="tableBody">
				<c:forEach var="memberVo" items="${memberList}">					
					<tr class="firstInformation">
						<td class="information__no">${memberVo.memberNo}</td>
						<td class="information__name">${memberVo.memberName}</td>						
						<td class="information__id">${memberVo.memberId}</td>
						<td class="information__birthdate">${memberVo.memberBirthDate}</td>
					</tr>
					<tr class="secondInformation">
						<td class="information__zipcode">${memberVo.memberZipCode}</td>
						<td class="information__address">${memberVo.memberAddress}</td>
						<td class="information__addressInfo">${memberVo.memberAddressInfo}</td>
						<td class="information__gender">${memberVo.memberGender}</td>						
						<td class="information__eMoney">${memberVo.memberEMoney}</td>
						<td class="information__credate"><fmt:formatDate value="${memberVo.memberCredate}" pattern="yyyy-MM-dd" /></td>
						<td class="information__update"><fmt:formatDate value="${memberVo.memberUpdate}" pattern="yyyy-MM-dd" /></td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/Paging.jsp">
        <jsp:param value="${pagingMap}" name="pagingMap" />
    </jsp:include>

	<form id='pagingForm' action="./list" method="get">
		<input type="hidden" id='searchField' name="searchField" value="">
      	<input type="hidden" id='searchKeyword' name="searchKeyword" value="">
      	<input type="hidden" id='curPage' name="curPage"
          value="${pagingMap.pagingVo.curPage}">
    </form>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp"/>

</body>
</html>