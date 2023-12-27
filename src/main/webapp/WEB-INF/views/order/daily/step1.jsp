<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="contents-area">

			<div class="breadcrumb-style">
	            <div class="wrap">
	                <ul>
	                    <li><a href="/">홈</a></li>
	                    <li><a href="/">장바구니</a></li>
	                    <li><a class="active">주문서작성</a></li>
	                </ul>
	            </div>
	        </div>

	<form id="orderForm">
		<input type="hidden" id="${ _csrf.parameterName }" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		<input type="hidden" id="price" name="price" value="">
		<input type="hidden" id="final_price" name="final_price" value="">
		<input type="hidden" id="pay_method" name="drk_pay_method" value="0">

		<div class="cont-checkout-area">
			<div class="title-tab-area">
				<h2 class="cont-title">주문서 작성</h2>
			</div>

			<div class="prd-cart-area" style="padding-bottom: 50px;">
				<div class="prd-cart-list-area">
					<%@ include file="/WEB-INF/views/layouts/order/daily/prdList.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daily/addrInputForm.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daily/shipInfo.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daily/payInfo.jsp"%>
					<%@ include file="/WEB-INF/views/layouts/order/daterangepicker.jsp"%>
				</div>

				<%@ include file="/WEB-INF/views/layouts/order/daily/orderInfo.jsp"%>
			</div>
		</div>
	</form>
</div>

<script>
	$(function () {
		weekDayText();
		calculateReceipt();
	})
</script>
<script>
	$("#order_targets").on("click", ".prod-add", function() {
		plusBtn($(this));
	})

	$("#order_targets").on("click", ".prod-remove", function() {
		minusBtn($(this));
	})
	
	
	$("#allOrderBtn").on("click", function() {
		goStep2("daily");
	});
	
	// 주소록 가져오기
	let member_no = ${ member.member_no };
	$("#addressBtn").on("click", function(){
		showAddress(member_no, 1);
	})
</script>
