<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 좌측 메뉴용 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/menu_bar.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/js/menu_bar.js"></script>
<!-- 좌측 메뉴 바 -->
<nav>
    <div>
		<ul class="clearfix gnb">
			<li>
		    	<a href="#">영업 관리</a>
		        <ul class="depth2">
		        	<li><a href="#">계약</a></li>
		            <li><a href="#">거래처</a></li>
		        	<li><a href="#">거래처 직원</a></li>
				</ul>
			</li>
			<li id="fixtures">
				<a href="/fixtures/toFixtures">비품 관리</a>
				<ul class="depth2">
					<li><a href="/fixtures/toFixtures">비품</a></li>
					<li><a href="#">소프트웨어</a></li>
				</ul>
			</li>
		    <li>
		    	<a href="#">인사 관리</a>
				<ul class="depth2">
		        	<li><a href="#">사원 관리</a></li>
		    		<li><a href="#">사원 등록</a></li>
		    		<li><a href="#">조직 관리</a></li>
		    		<li><a href="#">비상연락망</a></li>
		    		<li><a href="#">사원징계관리</a></li>
		    	</ul>
		    </li>      
		    <li>
		    	<a href="#">급여 관리</a>
				<ul class="depth2">
		        	<li><a href="#">직원별 근무내역</a></li>
		    		<li><a href="#">직원별 급여관리</a></li>
		    		<li><a href="#">전사 근무내역</a></li>
		    		<li><a href="#">전사 급여관리</a></li>
		    		<li><a href="#">경비 관리</a></li>
		    	</ul>
		    </li>                                  
		    <li>
		    	<a href="#">프로젝트 관리</a>
		        <ul class="depth2">
		        	<li><a href="#">프로젝트</a></li>
					<li><a href="#">작업지시서</a></li>
				</ul>
			</li>                                    
		    <li>
		    	<a href="#">사내 게시판</a>
		        <ul class="depth2">
		        	<li><a href="#">공지사항</a></li>
					<li><a href="#">교육 신청</a></li>
					<li><a href="#">회의록</a></li>
					<li><a href="#">개발자Q&A게시판</a></li>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">사내물품교환</a></li>
					<li><a href="#">마음의 소리</a></li>
				</ul>
			</li>                                    
		    <li>
		    	<a href="#">일정 관리</a>
			</li>   
			<li>
		    	<a href="#">전자 결재</a>
			</li> 
		</ul>
	</div>
</nav>