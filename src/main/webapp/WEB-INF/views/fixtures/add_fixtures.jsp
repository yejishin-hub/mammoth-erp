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
<!-- 라이브러리 로드 순서는 아래와 같다. cdnjs 저장소에서 라이브러리를 로드하였다. -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
<!--  datetimepicekr CDN -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css">

<!-- 좌측 메뉴용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/menu_bar.css">
<script src="/resources/js/menu_bar.js"></script>
<title>비품 등록</title>
<script>
	$(function(){
		$("#fixtures .depth2").stop().slideDown();
		$("#fixtures").find(".depth2").addClass("on");
		$("#fixtures").find(".depth2").removeClass("depth2");
		$('#datePicker').datetimepicker({
		  language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
		  pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
		  format : 'YYYY-MM-DD',
		  defaultDate : new Date() // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
		});
		var d = new Date();
		var month = d.getMonth();
		var day = d.getDate();
		var year = d.getFullYear();
		$('#enrollForm').on('submit',function(){
			var name = $('#name').val();
			var category = $('#category').val();
			var category_detail = $('#category_detail').val();
			var model_name = $('#model_name').val();
			var quantity = $('#quantity').val();
			var quantity_unit = $('#quantity_unit').val();
			var image_file = $('#image_file').val();
			var manufacture = $('#manufacture').val();
			var purchase_date = $('#purchase_date').val();
			var result = false;
			if(name == ''){
				alert("상품명을 입력해주세요.");
			}else if(category == ''){
				alert("카테고리를 선택해주세요.");
			}else if(category_detail == ''){
				alert("상세 카테고리를 입력해주세요.");
			}else if(model_name == ''){
				alert("모델명을 입력해주세요.");
			}else if(quantity == ''){
				alert("재고 수량을 입력해주세요.");
			}else if(quantity_unit == ''){
				alert("재고 단위를 선택해주세요.");
			}else if(image_file == ''){
				alert("상품과 관련된 이미지 파일을 첨부해주세요.");
			}else if(manufacture == ''){
				alert("제조사 정보를 입력해주세요.");
			}else{
				result = true;
			}
			return result;
		});
	})
</script>
<style>
	/* 메뉴바CSS by 예지 */
	nav .gnb > li > .on { position:static; width:260px; display:none;}
	nav .gnb > li > .on > li > a { color:#fff; text-align:left; display:block; padding:15px 30px; font-size:14px; background:#9e8c6d;}
	nav .gnb > li > .on > li > a:hover {background:#78684a;}
	.on { position:absolute;  z-index:10; width:100%; left:50%; top:30px; border:1px solid #ddd;display:block; background:#fff; display:none; }
	nav {z-index:10;}
	.main_contents{z-index:1;}
	
	/* 비품 등록 부분 CSS by 예지 */
	input[type="text"]{width:100%;}
	select{width:100%;}
	.row div{padding:10px 0 0 0;}
	.row div.last{padding-right:20px;}
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
		<div class="title">비품 등록</div>
		<div class="container">
			<form action="/fixtures/enrollFixtures" method="post" enctype='multipart/form-data' id="enrollForm">
				<div class="row">
					<div class="col-4">상품명</div>
					<div class="col-8 last"><input type="text" placeholder="상품명을 입력해주세요." name="name" id="name"></div>
					<div class="col-4">상품카테고리</div>
					<div class="col-8 last">
						<select name="category" id="category">
							<option value="문구사무용품">문구사무용품</option>
							<option value="비상용(의약품)">비상용(의약품)</option>
							<option value="전자기기">전자기기</option>
							<option value="가구">가구</option>
							<option value="도서">도서</option>
						</select>
					</div>
					<div class="col-4">상세카테고리</div>
					<div class="col-8 last"><input type="text" placeholder="상세 카테고리를 입력해주세요." name="category_detail" id="category_detail"></div>
					<div class="col-4">모델명</div>
					<div class="col-8 last"><input type="text" placeholder="모델명을 입력해주세요." name="model_name" id="model_name"></div>
					<div class="col-4">수량</div>
					<div class="col-6">
						<input type="text" placeholder="숫자만 입력해주세요." name="quantity" id="quantity">
					</div>
					<div class="col-2 last">
						<select name="quantity_unit" id="quantity_unit">
							<option value="EA">EA</option>
							<option value="set">set</option>
							<option value="kit">kit</option>
						</select>
					</div>
					<div class="col-4">이미지</div>
					<div class="col-8 last"><input type="file" name="image_file" id="image_file"></div>
					<div class="col-4">제조사</div>
					<div class="col-8 last"><input type="text" placeholder="제조사명을 입력해주세요." name="manufacture" id="manufacture"></div>
					<div class="col-4">구매일</div>
					<div class="col-8 last"><input id="datePicker" type="date" name="purchase_date" id="purchase_date"></div>
					<div class="col-12 text-right last pt-2">
						<input type="submit" value="비품 등록">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>