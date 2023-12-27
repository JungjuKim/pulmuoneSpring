<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/assets/js/order/apiKey.js"></script>
<script src="/resources/assets/js/order/mypageBox.js"></script>

<div class="container">

	<div class="border-wrapper">
		<h2 class="container-title">택배배송 주문내역</h2>
	</div>
	
	<div class="page-addiction-wrapper" style="align-items: center; margin-bottom: 25px;">
		<div class="info-copy" style="padding-left: 2px; padding-top: 9px;">
			<p class="detailsinfo">${ boxOrderMypageDTO.box_order_date }</p>
			<p class="detailsinfo">
				<label>주문번호</label>${ boxOrderMypageDTO.box_order_no }</p>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/layouts/mypage/order/boxProductList.jsp"%>
	
	<div class="dual-layout sm do" style="margin-top: 30px">
	
		<%@ include file="/WEB-INF/views/layouts/mypage/order/boxShipInfo.jsp"%>
	
		<%@ include file="/WEB-INF/views/layouts/mypage/order/boxPayInfo.jsp"%>
		
	</div>
	
	<div class="alert-area lg" style="padding-top: 38px;">
		<h4>유의사항</h4>
		<ul>
			<li>주문 내역은 MY녹즙을 통해 최근 1년간 열람이 가능합니다.</li>
			<li>냉장 상품은 상품 특성 상 개인 변심에 의한 교환/반품이 불가하며, 상품에 문제가 있을 시 1:1 고객센터를
				통해 문의 가능합니다.</li>
		</ul>
	</div>
</div>

<%@ include file="/WEB-INF/views/ui/alertmodal.jsp"%>

<script>
	$(function () {
		// 택배 조회 api key
		console.log(trackingKey);
		$(".t_key").val(trackingKey);
		
		// 주문 취소
		$(".btn-cancel").click(function () {
			location.href=`/mypage/order/box/cancel/`+$(this).data("order-no");
		});
	});
</script>