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
<!-- 라이브러리 로드 순서는 아래와 같다. cdnjs 저장소에서 라이브러리를 로드하였다. -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
<title>비품 등록</title>
<script>
	$(function(){
		$("#fixtures .depth2").stop().slideDown();
		$("#fixtures").find(".depth2").addClass("on");
		$("#fixtures").find(".depth2").removeClass("depth2");
		$('#datePicker').datetimepicker({
		  language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다.
		  pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다.
		  defalutDate : new Date() // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
		});
	})
</script>
<style>
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
	.main_contents{position:absolute; left:260px;padding:20px 0 0 50px;font-family: 'Noto Sans KR', sans-serif;}
	.main_contents > .title {font-size:20px;font-weight: bold;}
	.container{padding-top:10px;padding-right:10px;}
	input[type="text"]{width:100%;}
	select{width:100%;}
	.row div{padding:10px 0 0 0;}
	.row div.last{padding-right:20px;}
</style>
</head>
<body>
	<div class="side_menu">
		<jsp:include page="/WEB-INF/views/include/menu_bar.jsp" />
	</div>
	<div class="main_contents">
		<div class="title">비품 등록</div>
		<div class="container">
			<form action="/fixtures/enrollFixtures" method="post" enctype='multipart/form-data'>
				<div class="row">
					<div class="col-4">상품명</div>
					<div class="col-8 last"><input type="text" placeholder="상품명을 입력해주세요." name="name"></div>
					<div class="col-4">상품카테고리</div>
					<div class="col-8 last">
						<select name="category">
							<option value="문구사무용품">문구사무용품</option>
							<option value="비상용(의약품)">비상용(의약품)</option>
							<option value="전자기기">전자기기</option>
							<option value="가구">가구</option>
							<option value="도서">도서</option>
						</select>
					</div>
					<div class="col-4">상세카테고리</div>
					<div class="col-8 last"><input type="text" placeholder="상세 카테고리를 입력해주세요." name="category_detail"></div>
					<div class="col-4">상품코드</div>
					<div class="col-8 last"><input type="text" value="dd" name="code"></div>
					<div class="col-4">모델명</div>
					<div class="col-8 last"><input type="text" placeholder="모델명을 입력해주세요." name="model_name"></div>
					<div class="col-4">수량</div>
					<div class="col-6">
						<input type="text" placeholder="숫자만 입력해주세요." name="quantity">
					</div>
					<div class="col-2 last">
						<select name="quantity_unit">
							<option value="EA">EA</option>
							<option value="set">set</option>
							<option value="kit">kit</option>
						</select>
					</div>
					<div class="col-4">이미지</div>
					<div class="col-8 last"><input type="file" name="image_file"></div>
					<div class="col-4">제조사</div>
					<div class="col-8 last"><input type="text" placeholder="제조사명을 입력해주세요." name="manufacture"></div>
					<div class="col-4">구매일</div>
					<div class="col-8 last"><input id="datePicker" type="date" name="purchase_date"></div>
					<div class="col-12 text-right last pt-2">
						<input type="submit" value="비품 등록">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>