<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/assets/js/order/apiKey.js"></script>
<script src="/resources/assets/js/order/mypageBox.js"></script>

<div class="container">
	
	<div class="border-wrapper">
		<h2 class="container-title">택배배송 주문내역</h2>
	</div>
							
	<%@ include file="/WEB-INF/views/layouts/mypage/order/orderBoxSearchForm.jsp"%>

	<%@ include file="/WEB-INF/views/layouts/mypage/order/orderBoxList.jsp"%>
	
</div>

<%@ include file="/WEB-INF/views/ui/alertmodal.jsp"%>

<script>
	$(function () {
		// 택배 조회 api key

		$(".t_key").val(trackingKey);

		// 최근 n 개월 날짜 검색
        $('.dropdown-item').click(function () {
        	dropdownClick($(this));
        });
	
		// 날짜 범위 검색
		$(document).on('click', '.applyBtn', function () {
			searchBtnClick();
		});

        var startDate = new Date();
        var endDate = new Date();
        startDate.setMonth(startDate.getMonth() - 3);

        var startSearchDate = "${empty startSearchDate ? '' : startSearchDate}";
        var endSearchDate = "${empty endSearchDate ? '' : endSearchDate}";
        
        if (startSearchDate) {
            startDate = new Date(startSearchDate);
            endDate = new Date(endSearchDate);
        } // if

        $('input[name="daterange"]').daterangepicker({
            opens: 'left',
            startDate,
            endDate
        });

        $('#searchBtn').click(function () {
        	searchBtnClick();
        });
        
        $(".btn-cancel").click(function () {
			location.href=`/mypage/order/box/cancel/`+$(this).data("order-no");
		});
	})
</script>