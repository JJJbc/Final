<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>

	<div class="logoContainer">
		<div class="logo">
			<a href="http://localhost:8888"><img class="logoImg" alt="." src="/img/common/logo.png"></a>
		</div>		
	</div>
	
	<nav>
		<div class="categoryContainer"></div>
			<div class="navBarContainer">
				<ul class="mainMenu">
					<li class="navElement forShow1">
						<button class="categoryBtn courseNavBtn" onmouseover="courseBtnFnc('course');">수강신청</button>
						<div class="hiddenDiv hiddenDiv1 active1">
							<ul class="subMenu" >
								<li><a href="">submenu1</a></li>
								<li><a href="">submenu1</a></li>
								<li><a href="">submenu1</a></li>
							</ul>	
							<div class="ImgDiv"></div>
						</div>
					</li>
					<li class="navElement forShow2">
						<button class="categoryBtn evnetNavBtn" onmouseover="courseBtnFnc('event');">이벤트</button>
						<div class="hiddenDiv hiddenDiv2 active2">
							<ul class="subMenu" >
								<li><a href="">submenu2</a></li>
								<li><a href="">submenu2</a></li>
								<li><a href="">submenu2</a></li>
							</ul>
							<div class="ImgDiv"></div>
						</div>
					</li>
					<li class="navElement forShow3">
						<button class="categoryBtn boardNavBtn" onmouseover="courseBtnFnc('board');">게시판</button>
						<div class="hiddenDiv hiddenDiv3 active3">
							<ul class="subMenu">
								<li><a href="">submenu3</a></li>
								<li><a href="">submenu3</a></li>
								<li><a href="">submenu3</a></li>
							</ul>
							<div class="ImgDiv"></div>
						</div>
					</li>
					<li class="navElement forShow4">
						<button class="categoryBtn aboutNavBtn" onmouseover="courseBtnFnc('about');">이용안내</button>
						<div class="hiddenDiv hiddenDiv4 active4">
							<ul class="subMenu">
								<li><a href="">submenu1</a></li>
								<li><a href="">submenu1</a></li>
								<li><a href="">submenu1</a></li>
							</ul>
							<div class="ImgDiv"></div>
						</div>
					</li>
				</ul>
			</div>
	</nav>
	
	<div class="sessionContainer">
		<p class="shoppingIcon">
			<a href=""><img class="logoutImg" alt="." src="/img/common/shoppingCart.png"></a>
		</p>
		<c:if test="${sessionScope.memberVo eq null}">
			<p class="loginIcon">
				<img class="loginImg" alt="." src="/img/common/login.png">
			</p>
		</c:if> 
		<c:if test="${sessionScope.memberVo.authority eq 0 || sessionScope.memberVo.authority eq 1}">
			<a href="<%=request.getContextPath()%>/member/logout"><img class="logoutImg" alt="." src="/img/common/logout.png"></a>
			<a href="/member/update?memberNo=${memberVo.memberNo}"><img class="mypageImg" alt="." src="/img/common/mypage.png"></a>
		</c:if>
	</div>
	
</header>
