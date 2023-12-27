<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/assets/js/order/mypageDrink.js"></script>

<div class="container">
	
	<div class="border-wrapper">
		<h2 class="container-title">음용내역 상세</h2>
	</div>
	
	<div class="dropdown">
		<div class="dropdown-menu"></div>
	</div>
	
	<div class="page-addiction-wrapper">
		<div class="info-copy">
			<div class="box dropdown" style="width:441px;padding: 0; margin-bottom:13px;">
				<a style="width: 100%" id="searchText" class="btn " href="#" role="button" data-toggle="dropdown" aria-expanded="false">
					<button class="nickname-format" style="width: 100%">
						<div style="display:flex; flex: 1; align-items: center">
							<label>기본</label>
							<h5>${ drkOrderMypageDTO.drk_order_name }</h5>
							<span>${ drkOrderMypageDTO.drk_order_no }</span>
						</div>
					</button>
				</a>
				<div class="dropdown-menu" style="max-height: 200px; overflow-y: scroll">
					<c:forEach items="${ drkOrderMypageList }" var="order">
						<a class="dropdown-item" href="/mypage/drink/drinks/${ order.drk_order_no }">${ order.drk_order_name }(${ order.drk_order_no })</a>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="button-wrapper" style="padding-top:4px;">
			<button data-toggle="modal" data-target="#nicknameModal" class="rounded-button" id="changeName">애칭수정</button>
			<a href="/mypage/drink/bill" class="rounded-button">스마트청구서</a>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/layouts/mypage/order/drinkShipInfo.jsp"%>
	
	<div class="box-partition title-sep title-btn" style="margin:22px 0 0;">
		<div class="title">
			<h2>음용스케쥴</h2>
			<div class="button-set">
				<a style="cursor: pointer" href="/mypage/order/daily/changeHistory/${ drkOrderMypageDTO.drk_order_no }" class="rounded-button">홈페이지 변경내역</a>
				<c:if test="${ drkOrderMypageDTO.drk_status eq 0 }">
					<a href="/mypage/order/daily/change/${ drkOrderMypageDTO.drk_order_no }" class="rounded-button primary">음용상품변경</a>
					<button type="button" id="changeDayBtn" class="rounded-button black">배송일정변경</button>
				</c:if>
			</div>
		</div>
		
		<div class="part-horizontal">
			<%@ include file="/WEB-INF/views/layouts/mypage/order/drinkCalendar.jsp"%>
			<%@ include file="/WEB-INF/views/layouts/mypage/order/drinkNextWeek.jsp"%>
		</div>
	</div>
	
	<div class="alert-area lg" style="padding-bottom:40px;">
		<h4>음용내역조회 안내</h4>
		<ul>
			<li>타 쇼핑몰 주문 건은 음용 상품 변경이 불가합니다.</li>
			<li>이사 등으로 인한 배송 지역 변경 시, 현재 배송 중인 가맹점 또는 1:1 문의 게시판을 통해 문의해주세요.</li>
			<li>실제 음용 내역과 상이한 경우에는 배송 가맹점 또는 1:1 문의 게시판을 통해 문의해주세요.</li>
		</ul>
	</div>
	
</div>

<%@ include file="/WEB-INF/views/layouts/mypage/order/drkModal.jsp"%>

<script>
	$(function () {
		// 요일별 수량 계산
		let totalCnt = [0,0,0,0,0];
		$(".eachCnt").each(function () {
			let index = $(".eachCnt").index($(this));
			let cnt = $(this).data("cnt");
			if (cnt == 0) return;
			$(".total_cnt").eq(index % 5).addClass("active");
			totalCnt[index%5] += cnt;
			$(".total_cnt").eq(index % 5).text(totalCnt[index%5]);
		});
		// buildCalendar();
		
		// 애칭 수정
		$("#changeName").on("click", function () {
			$("#nicknameModal").modal("show");
		});
		
		let drk_order_no = ${drkOrderMypageDTO.drk_order_no};
		
		$("#nickname-edit-btn").on("click", function(){
			let drk_order_name = $("#nickname-edit").val();
			
			let header = '${_csrf.headerName}';
			let token = '${_csrf.token}';
			
			$.ajax({
				url:"/mypage/drink/drinks/"+drk_order_no
				, data: JSON.stringify({ drk_order_name : drk_order_name })
				, dataType:"json"
				, contentType: "application/json"
				, type:"POST"
				, cache:false
				, beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
				}
				, success: function (data){
					if (data == "1") {
						$("#nicknameModal").modal("hide");
						location.reload();
					} // if
				}
				, error : function (e){
					console.log(e);
				}
			});
		});
		
		// 배송 일정 변경 버튼
		$("#changeDayBtn").on("click", function () {
			location.href="/mypage/drink/drink/pause/"+drk_order_no;
		});
	})
</script>