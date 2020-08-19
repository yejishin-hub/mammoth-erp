$(document).ready(function(){
	init();
	var doc_width = $(window).width(); // 문서 로드될 때 문서 넓이 감지
	hdlr_switch(doc_width);
    var hdH = $header.height();
    $(".hdMargin").css({
    	paddingTop:hdH
    });
});
function textChk(thisVal, obj){
	var replaceId  = /(script)/gi;
	var textVal = thisVal;
    if (textVal.length > 0) {
        if (textVal.match(replaceId)) {
        	console.log(obj)
        	if(obj.val().length){
	        	obj.val("");
	        	$(".wordsize .current").text(0)
	        	textVal = obj.val();
        	}else{
	        	obj.html("");
	        	$(".wordsize .current").text(0)
	        	textVal = obj.val();
        	}
        }
    }
    return textVal;
}
function init(){
	$gnb = $(".gnb");
	$header = $("header");
	$topBtn = $(".topBtn");
	$chatOpenBtn = $("#chatOpenBtn");
	$chatClose = $("#chatClose");
};
function initEvent_pc(val){
	$gnb.children("li").children("a").off("click");
	$gnb.children("li").off("mouseenter");
	$gnb.children("li").on("mouseenter",function(){
		$gnb.find(".depth2").stop().slideUp();
		$(this).find(".depth2").stop().slideDown();
	}).on("mouseleave",function(){
		$(this).find(".depth2").stop().slideUp();
	})
	$header.find(".util > ul > li").mouseenter(function(){
		var delth2 = $(this).find(".depth2");
		if(delth2.length){
			delth2.stop().fadeIn();
		}
	}).mouseleave(function(){
		var delth2 = $(this).find(".depth2");
		if(delth2.length){
			delth2.stop().fadeOut();
		}		
	})
};
function gnbOff(obj){
	obj.find(".depth2").stop().slideUp();
};
function hdlr_switch(val) {
	initEvent_pc(val);
};
