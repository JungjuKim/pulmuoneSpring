<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/assets/js/order/apiKey.js"></script>
<script src="/resources/assets/js/order/mypageBox.js"></script>

<div class="container">
	
	<div class="border-wrapper">
			<h2 class="container-title">주문취소하기</h2>
	</div>
	
	<div class="page-addiction-wrapper" style="align-items: center; margin-bottom:23px;">
		<div class="info-copy" style="padding-left:2px; padding-top:9px;">
			<p class="detailsinfo"><label>주문번호</label>${ boxOrderMypageDTO.box_order_no }</p>
		</div>
		<p class="detailsinfo" align="right">취소접수일자&nbsp&nbsp&nbsp&nbsp
			<script>
				let today = new Date();
				let year = today.getFullYear();
				let month = today.getMonth()+1;
				let date = today.getDate();
				document.write(year+"."+month+"."+date);
			</script>
		</p>
	</div>
	
	<div class="complete-copy-wrapper" style="margin-bottom:20px;">
		<span class="complete-copy">주문취소가 완료되었습니다.</span>
	</div>
	
	<%@ include file="/WEB-INF/views/layouts/mypage/order/boxCanceledList.jsp"%>
	
	<%@ include file="/WEB-INF/views/layouts/mypage/order/boxCancelPayInfo.jsp"%>
	
	<div class="btn-area-right" style="margin-top:20px;">
		<a style="padding:0; width:140px;" class="btn-default btn-white" onclick="location.href='/mypage/order/box'">목록으로</a>
	</div>
</div>