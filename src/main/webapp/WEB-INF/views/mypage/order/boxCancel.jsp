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
			<p class="detailsinfo">${ boxOrderMypageDTO.box_order_date }</p>
			<p class="detailsinfo"><label>주문번호</label>${ boxOrderMypageDTO.box_order_no }</p>
		</div>
	</div>
		
	<div class="box-partition" style="margin-bottom:12px; padding:0 20px; height:60px;">
		<label class="check-type">
			<input type="checkbox" class="select-product-checkbox" id="select-all" name="select-product-all">
			<span style="font-size:16px; margin-bottom:4px; padding-left:51px;">전체선택</span>
		</label>
	</div>
		
	<%@ include file="/WEB-INF/views/layouts/mypage/order/boxCancelList.jsp"%>
	
	<%@ include file="/WEB-INF/views/layouts/mypage/order/boxCancelPayInfo.jsp"%>
	
	<div class="btn-area-right" style="margin-top:20px;">
		<a style="padding:0; width:140px;" class="btn-default btn-white" onclick="location.href='/mypage/order/box'">목록으로</a>
		<button id="cancelBtn" type="button" style="padding:0; width:140px;" class="btn-default btn-black" data-toggle="modal" data-target="#pauseModal">취소하기</button>
	</div>
</div>

<%@ include file="/WEB-INF/views/ui/alertmodal.jsp"%>
<%@ include file="/WEB-INF/views/ui/confirmdesignmodal.jsp"%>

<script>
	$(function () {
		$("#cancelBtn").click(function(){
			let orderNo = ${ boxOrderMypageDTO.box_order_no };
			cancel(orderNo);
		})
		
		let formatter = new Intl.NumberFormat();
		
		$('input[name=select-product]').prop('checked', true);
		$('input[name=select-product-all]').prop('checked', true);
	
		$('#select-all').click(function (){
			$('input[name=select-product]').prop('checked', $(this).is(':checked'));
			$('input[name=select-product-all]').prop('checked', $(this).is(':checked'));
		})
	
		$('input[name=select-product]').change(function () {
			let item = $('input[name=select-product]').length;
			let checkItem = $('input[name=select-product]:checked').length;

			if(item === checkItem) $('#select-all').prop('checked','checked')
			else $('#select-all').prop('checked',false)
		})

		$('.item').click(function(){
			alert("부분취소는 고객센터에 문의해주세요.");
		})
	})
</script>