<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>비품 조회</title>
<!-- 좌측 메뉴용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/menu_bar.css">
<script src="/resources/js/menu_bar.js"></script>
<style>
	/* 메뉴바CSS by 예지 */
	nav .gnb > li > .on { position:static; width:260px; display:none;}
	nav .gnb > li > .on > li > a { color:#fff; text-align:left; display:block; padding:15px 30px; font-size:14px; background:#9e8c6d;}
	nav .gnb > li > .on > li > a:hover {background:#78684a;}
	.on { position:absolute;  z-index:10; width:100%; left:50%; top:30px; border:1px solid #ddd;display:block; background:#fff; display:none; }
	nav {z-index:10;}
	.main_contents{z-index:1;}
	
	/* 비품 조회 부분 CSS by 예지 */
	input[type="text"]{width:100%;}
	select{width:100%;}
	.row div{padding:10px 0 0 0;}
	.row div.last{padding-right:20px;font-weight:300;}
	.row div:not(.last){font-weight:400;}
	.container{padding-top:10px;padding-right:10px;}
	.main_contents{position:absolute; left:260px;padding:20px 0 0 50px;font-family: 'Noto Sans KR', sans-serif;}
	.main_contents > .title {font-size:20px;font-weight: bold;}
</style>
</head>
<body>
	<div class="side_menu">
		<jsp:include page="/WEB-INF/views/include/menu_bar.jsp" />
	</div>
	<div class="main_contents">
		<div class="title">비품 조회</div>
		<div class="container">
			<div class="row">
					<div class="col-12">
						<img src="/upload/fixtures/${ffdto.sysname}">
					</div>
					<div class="col-4">상품명</div>
					<div class="col-8 last">${fdto.name}</div>
					<div class="col-4">상품카테고리</div>
					<div class="col-8 last">${fdto.category}</div>
					<div class="col-4">상세카테고리</div>
					<div class="col-8 last">${fdto.category_detail}</div>
					<div class="col-4">상품코드</div>
					<div class="col-8 last">${fdto.code}</div>
					<div class="col-4">모델명</div>
					<div class="col-8 last">${fdto.model_name}</div>
					<div class="col-4">수량</div>
					<div class="col-8 last">${fdto.quantity} ${fdto.quantity_unit}</div>
					<div class="col-4">제조사</div>
					<div class="col-8 last">${fdto.manufacture}</div>
					<div class="col-4">구매일</div>
					<div class="col-8 last">${fdto.purchase_date}</div>
					<div class="col-12 text-right last pt-2">
						<input type="button" value="목록으로">
						<input type="button" value="수정">
						<input type="button" value="삭제">
					</div>
				</div>
		</div>
	</div>
</body>
</html>