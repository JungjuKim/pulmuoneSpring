<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="aside">
	<h2 class="title">고객기쁨센터</h2>
	<ul class="lnb-style">
		<li data-page="faq">
			<a href="/forum/faq/list">FAQ</a>
		</li>
		<li data-page="inquiry">
			<a href="/forum/inquiry/write">1:1 문의</a>
		</li>
		<li data-page="notice">
			<a href="/forum/notice/list">공지사항</a>
		</li>
		<li data-page="franchise">
			<a href="/forum/franchise/search">배송가능지역 검색</a>
		</li>
	</ul>
</div>
<script>
 	<%-- aside 현재 페이지 active --%> 
	let link = location.href;
	
	$(".lnb-style li").each(function(){
		if( link.includes($(this).data("page")) ) {
			$(this).addClass("active");
		}		
	})
	
</script>