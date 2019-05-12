<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div id="carouselMenu" class="carousel slide" data-interval="200" data-wrap="true">
	<!-- 轮播（Carousel）索引控制 -->
	<ol class="carousel-indicators">
	<li data-target="#carouselMenu" data-slide-to="0" class="active"></li>
	<li data-target="#carouselMenu" data-slide-to="1"></li>	<!-- 控制轮播项 -->
	<li data-target="#carouselMenu" data-slide-to="2"></li>	<!-- 控制轮播项 -->
	<li data-target="#carouselMenu" data-slide-to="3"></li>	<!-- 控制轮播项 -->
	<li data-target="#carouselMenu" data-slide-to="4"></li>	<!-- 控制轮播项 --> 
	</ol>   
	<!-- 轮播（Carousel）内容显示，显示内容的个数与索引控制项对应 -->
	<div class="carousel-inner"> 
		<div class="item active"><a href="http://www.jixianit.com" target="_ablank"><img src="upload/ad/ads-pic-01.jpg" alt="f1Img"></a></div>
		<div class="item"><a href="http://www.jixianit.com" target="_ablank"><img src="upload/ad/ads-pic-02.jpg" alt="f2Img"></a></div>
		<div class="item"><a href="http://www.jixianit.com" target="_ablank"><img src="upload/ad/ads-pic-03.jpg" alt="f3Img"></a></div>
		<div class="item"><a href="http://www.jixianit.com" target="_ablank"><img src="upload/ad/ads-pic-04.jpg" alt="f4Img"></a></div>
		<div class="item"><a href="http://www.jixianit.com" target="_ablank"><img src="upload/ad/ads-pic-05.jpg" alt="f5Img"></a></div> 
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#carouselMenu" 
			data-slide="prev">&lsaquo;</a>		<!-- 显示前一个轮播项内容 -->
	<a class="carousel-control right" href="#carouselMenu" 
			data-slide="next">&rsaquo;</a>		<!-- 显示后一个轮播项内容-->
</div>
<script type="text/javascript">
	$("#carouselMenu").carousel({
		interval : 5000 ,					// 轮播项切换时间为2秒
		wrap : true						// 鼠标经过时暂停显示
	}) ;
</script>