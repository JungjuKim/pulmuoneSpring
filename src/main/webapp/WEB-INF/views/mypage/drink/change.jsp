<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/assets/js/order/mypageDrink.js"></script>

<div class="container">
	
	<div class="border-wrapper">
		<h2 class="container-title">음용상품변경</h2>
	</div>
							
	<div class="page-addiction-wrapper">
		<div class="info-copy">
			<div class="box" style="flex:1; margin-bottom:13px;">
				<div class="nickname-format">
					<label>기본</label>
					<h5>${ drkOrderMypageDTO.drk_order_name }</h5>
					<span>${ drkOrderMypageDTO.drk_order_no }</span>
				</div>
			</div>
		</div>
	</div>
				
	<div class="page-addiction-wrapper" style="margin-bottom:10px;">
		<div class="info-copy description" style="margin-top:2px;">
			<p>※ 원하시는 스케줄에 따라 상품/요일/수량 변경이 가능합니다.</p>
			<p>※ 타 쇼핑몰 고객은 상품 변경이 불가합니다.</p>
		</div>
		<button class="rect-button primary" style="width:120px; padding: 0" type="button" id="addProduct">상품추가하기</button>
	</div>
	
	<%@ include file="/WEB-INF/views/layouts/mypage/order/drkChangeList.jsp"%>
	
	<div class="form-input period" style="margin-top:10px; margin-bottom:16px;">
		<dl class="date">
			<dt style="padding-left:20px; margin-right:30px;">
				<label>변경배송 시작일</label>
				<button class="btn-question" data-toggle="modal" data-target="#tooltipModal">
					<i class="ico ico-question"></i>
					<span class="hide">자세한 내용 보기</span>
				</button>
			</dt>
			<dd style="min-width:153px;">
				<input type="text" id="datepicker" name="datepicker" data-placeholder="날짜를 입력하세요.">
			</dd>
		</dl>
	</div>
				
	<%@ include file="/WEB-INF/views/layouts/mypage/order/drkChangeReceipt.jsp"%>
						
	<div class="addiction-foot" style="margin-top:26px;">
		<p class="foot-copy">※ 변경시작일로부터 4주 기준 예상 음용대금으로 실제 월 청구금액과 상이할 수 있습니다.</p>
		<div class="btn-area-right">
			<a id="cancel" style="cursor:pointer;padding:0; width:140px;" class="btn-default btn-white" href="/mypage/drink/drinks/${ drkOrderMypageDTO.drk_order_no }">취소</a>
			<a style="cursor:pointer; padding:0; width:140px;" id="changeProductBtn" class="btn-default btn-default">음용상품변경</a>
		</div>
	</div>
</div>					

<%@ include file="/WEB-INF/views/layouts/order/modal.jsp"%>
<%@ include file="/WEB-INF/views/ui/confirmdesignmodal.jsp"%>

<script>
	$(function () {
		// 영수증 계산
		calculatePrice();
		
		// 상품 추가하기 버튼
		$("#addProduct").on("click", function () {
			addProduct(null, 1);
		})
		
		// 상품 +, - 버튼
		$(".box-partition").on("click", ".plus", function() {
			let em = $(this).next("em");
			let cnt = parseInt(em.text())+1;
			em.text(cnt);
			calculatePrice();
			let li = $(this).parent().parent().parent().parent();
			informStop(li);
		}).on("click", ".minus", function() {
			let em = $(this).prev("em")
			let cnt = parseInt(em.text())-1;
			if (cnt == -1) return;
			em.text(cnt);
			calculatePrice();
			let li = $(this).parent().parent().parent().parent();
			informStop(li);
		});
		
		// 변경 배송 시작일
		let minDate = new Date();
		let maxDate = new Date();
		
		minDate.setDate(minDate.getDate()+3);
		minDate.setDate(getWeekDay(minDate));
		maxDate.setDate(minDate.getDate()+30);
		maxDate.setDate(getWeekDay(maxDate));
		
		$("#datepicker").daterangepicker({
			singleDatePicker: true
			, minDate: minDate
			, maxDate: maxDate
			, regional: "ko"
		}).on('change', function() {
		    $(this).attr('value', $(this).val());
		});
		
		// 상품 삭제 버튼 클릭
		$(".box-partition").on("click", ".btn-stop", function() {
			let li = $(this).parent();
			li.find("em").text(0);
			calculatePrice();
			informStop(li);
		}).on("click", ".btn-remove", function() {
			$(this).parent().remove();
			calculatePrice();
		});
		
		// 음용 상품 변경 신청
		$("#changeProductBtn").on("click", function(){
			let header = '${_csrf.headerName}';
			let token = '${_csrf.token}';
			// 주문 번호
			let drk_order_no = ${ drkOrderMypageDTO.drk_order_no };
			// 변경 배송 시작일
			let dateParts = $("#datepicker").val().split(".");
			let drk_start_date = new Date(+dateParts[0], dateParts[1] - 1, +dateParts[2]);
			// 상품 list
			let drkScheduleList = [];
			
			$(".product_list").each(function () {
				let prdNo = $(this).data("prd-no");
				let monCnt = parseInt($(this).find("em").eq(0).text());
				let tueCnt = parseInt($(this).find("em").eq(1).text());
				let wedCnt = parseInt($(this).find("em").eq(2).text());
				let thuCnt = parseInt($(this).find("em").eq(3).text());
				let friCnt = parseInt($(this).find("em").eq(4).text());
				
				let drkSchedule = {
					drk_order_no: drk_order_no
					, reg_date: new Date()
					, products_no: prdNo
					, mon_cnt: monCnt
					, tue_cnt: tueCnt
					, wed_cnt: wedCnt
					, thu_cnt: thuCnt
					, fri_cnt: friCnt
					, drk_start_date: drk_start_date
				};
				drkScheduleList.push(drkSchedule);
			});
			
	        confirmDesign("",'음용상품을 변경하시겠습니까?', function (){
	            $.ajax({
	                url: "/mypage/order/daily/change/"+drk_order_no
	                , contentType: "application/json"
	                , data: JSON.stringify(drkScheduleList)
	                , dataType:"json"
	                , type:"POST"
	                , cache:false
	                , beforeSend: function(xhr){
	                	xhr.setRequestHeader(header, token);
	                }
	                , success: function (response){
	                	alert( '음용상품 변경이 신청되었습니다', function() {
		                    location.href="/mypage/drink/drink";
		                });
					}
					, error : function (e){
						console.log(e);
					}
	            });
	        })
		});
	})
</script>