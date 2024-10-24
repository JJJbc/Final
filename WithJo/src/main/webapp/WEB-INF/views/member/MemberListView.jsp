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
<link rel="stylesheet" href="/css/member/memberList.css">
<script defer src="/js/common/common.js"></script>
<script>var userAuthority = ${sessionScope.memberVo.authority};</script>
<script defer src="/js/member/memberList.js"></script>

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
				<tr class="informationTitle">
					<td class="informationTitle_memberId">회원 ID</td>
					<td class="informationTitle_memberName">회원명</td>
					<td class="informationTitle_memberCredate">가입날짜</td>
					<td class="informationTitle_memberDelete">비고</td>
				</tr>	
				<c:forEach var="memberVo" items="${memberList}">					
					<tr class="firstInformation">	
						<td class="information__id">${memberVo.memberId}</td>					
						<td class="information__name">${memberVo.memberName}</td>
						<td class="information__credate"><fmt:formatDate value="${memberVo.memberCredate}" pattern="yyyy-MM-dd" /></td>
						<td class="information__memberDelete">
							<c:if test="${sessionScope.memberVo.authority eq 1}">
								<input type="button" value="삭제하기" onclick='memberDeleteFnc(${memberVo.memberNo})'>
							</c:if>
						</td>
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