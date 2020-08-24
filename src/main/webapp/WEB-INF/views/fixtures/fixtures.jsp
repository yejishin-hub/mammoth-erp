<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 좌측 메뉴용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/menu_bar.css">
<script src="/resources/js/menu_bar.js"></script>
<title>비품 관리</title>
<script>
	$(function(){
		$("#fixtures .depth2").stop().slideDown();
		$("#fixtures").find(".depth2").addClass("on");
		$("#fixtures").find(".depth2").removeClass("depth2");
		$("#addFixture").on("click",function(){
			location.href = "/fixtures/toFixturesEnrollView";
		})
		$(".row.list").on("click",function(){
			location.href = "/fixtures/toFixturesView?seq="+$(this).find(".seq").text();
		})
	})
</script>
<style>
	/* 메뉴바CSS by 예지 */
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean');
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@100;300;400;500;700;900&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300;500;700&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Muli:wght@200;300;400;500;600;700;800;900&display=swap');
	/*  
		font-family: 'Noto Sans SC', sans-serif;
		font-family: 'Muli', sans-serif;
		font-family: 'Noto Sans KR', sans-serif;
	*/
	nav .gnb > li > .on { position:static; width:260px; display:none;}
	nav .gnb > li > .on > li > a { color:#fff; text-align:left; display:block; padding:15px 30px; font-size:14px; background:#9e8c6d;}
	nav .gnb > li > .on > li > a:hover {background:#78684a;}
	.on { position:absolute;  z-index:10; width:100%; left:50%; top:30px; border:1px solid #ddd;display:block; background:#fff; display:none; }
	nav {z-index:10;}
	.main_contents {z-index:1;}
	
	/* 비품 목록 부분 CSS by 예지 */
	.main_contents{position:absolute; left:260px;padding:20px 0 0 50px;font-family: 'Noto Sans KR', sans-serif;}
	.main_contents > .title {font-size:20px;font-weight: bold;}
	.main_contents > .search_area {padding-top:20px;}
	.fixtures_list {display: table; width: 800px; padding-top:20px;}
	.row {display: table-row;}
	.fixtures_list .row.head .cell{background-color:#a2a2a2;color:white;}
	.cell {display: table-cell; padding: 10px; border-bottom: 1px solid #DDD;}
	.col1 {width: 10%;}
	.col2 {width: 20%;}
	.col3 {width: 40%;}
	.col4 {width: 20%;}
	.row.list:hover{background-color: #d6d6d6; cursor:pointer;}
</style>
</head>
<body>
	<div class="side_menu">
		<jsp:include page="/WEB-INF/views/include/menu_bar.jsp" />
	</div>
	<div class="main_contents">
		<div class="title">비품 관리</div>
		<div class="search_area">
			<div style="font-size:18px;font-weight:500;">통합검색</div>
			<div class="selectCategory">
				카테고리
				<input type="radio" value="문구사무용품" name="category">문구사무용품
				<input type="radio" value="비상용(의약품)" name="category">비상용(의약품)
				<input type="radio" value="전자기기" name="category">전자기기
				<input type="radio" value="가구" name="category">가구
				<input type="radio" value="도서" name="category">도서
			</div>
			<div class="categoryDetail">
			</div>
			<div class="search_bar">
				<input type="text">
				<input type="button" value="검색">
			</div>
		</div>
		<div class="fixtures_list">
			<div class="row head">
				<span class="cell col2"></span>
				<span class="cell col3">상품명</span>
				<span class="cell col1">상품코드</span>
				<span class="cell col1">수량</span>
				<span class="cell col3">구매날짜</span>
			</div>
			<c:choose>
				<c:when test="${empty fix_list}">
					<div class="row">비품이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${fix_list}" var="i">
						<div class="row list">
							<div style="display:none;" class="seq">${i.seq}</div>
							<span class="cell col2">이미지</span>
							<span class="cell col3">${i.name}</span>
							<span class="cell col1">${i.code}</span>
							<span class="cell col1">${i.quantity} ${i.quantity_unit}</span>
							<span class="cell col3">${i.purchase_date}</span>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div style="float:right;">
			<input type="button" id="addFixture" value="비품 등록">
		</div>
	</div>
</body>
</html>