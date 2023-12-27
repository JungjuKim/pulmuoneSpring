<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/assets/js/order/mypageDrink.js"></script>

<div class="container">
	
	<div class="border-wrapper">
		<h2 class="container-title">홈페이지 변경내역</h2>
	</div>
							
	<div class="page-addiction-wrapper">
		<div class="info-copy">
			<div class="box" style="flex:1; margin-bottom:13px;">
				<div class="nickname-format">
					<h5>${ drkOrderMypageDTO.drk_order_name }</h5>
					<span>${ drkOrderMypageDTO.drk_order_no }</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="nickname-list change">
		<ul>
			<c:forEach items="${ groupedByChangeGroupNo }" var="change">
				<c:forEach items="${ change.value }" var="c" varStatus="status">
					<c:if test="${ status.index eq 0 }">
						<li data-change-group="${ change.key }">
							<div class="flex-full nickname-format">
								<c:choose>
									<c:when test="${ c.change_type eq 0 }">
										<h5>배송일정변경</h5>
									</c:when>
									<c:otherwise>
										<h5>음용상품변경</h5>
									</c:otherwise>
								</c:choose>
								<span>${ c.change_date } 신청</span>
							</div>
							<div class="flex">
								<button class="detailBtn rounded-button">상세보기</button>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</c:forEach>
		</ul>
	</div>
	
	<div class="alert-area lg">
		<h4>안내사항</h4>
		<ul>
			<li>배송일정변경 요청 시점과 조회 시점에 따라 일부 상이할 수 있습니다.</li>
			<li>변경하신 내역과 상이하신 경우 배송가맹점 또는
				홈페이지 1:1문의 게시판을 통해 문의해주세요.</li>
		</ul>
	</div>
</div>

<%@ include file="/WEB-INF/views/ui/changemodal.jsp"%>

<script>
	$(function () {
		$(document).on('click', '.detailBtn', function () {
			const change_group_no = $(this).closest('li').data('change-group');
	        console.log(change_group_no);
	        
	        $.get("/mypage/drink/drink/order-history/"+change_group_no, function (response) {
	            console.log("success");
	            const result = response.RESULT_MSG;
				
	            let prdInfos = null;
                let modal = $('#changeModal');
                for (var products_no in result) {
                	prdInfos = result[products_no];
					console.log(prdInfos);
					
					let change_type = prdInfos[0].change_type;
					if (change_type == 0) {
						modal.find(".changeType").text("배송일정변경");
					} else {
						modal.find(".changeType").text("음용상품변경");
					} // if
					
					let change_date = prdInfos[0].change_date;
					let date = new Date(change_date);
					modal.find(".reqDate").text(date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate());
					
					let start_date = prdInfos[0].change_start_date;
					date = new Date();
					modal.find(".startDate").text(date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate());
					
					let li = null;
					li = `<li>`;
					li += `<div class="thumb">`;
					li += `<img src="/\${prdInfos[0].img_path}/\${prdInfos[0].system_name}" alt="">`
					li += `</div>`;
					li += `<div class="contents ell1">`;
					li += `<p class="name" style="overflow:hidden;text-overflow:ellipsis;">`;
					if (prdInfos[0].is_new == 1) li += `<b>음용상품추가</b>`;
					li += prdInfos[0].products_name;
					li += `<span>(\${prdInfos[0].products_size})</span>`;
					li += `</p>`;
					for (var i = 0; i < prdInfos.length; i++) {
						let dow = prdInfos[i].day_of_week-1;
						li += `<span class="history" style="white-space:normal">`;
						if (prdInfos[0].is_new == 1) {
							li += weekDays[dow];
							li += `요일 \${prdInfos[i].after_cnt}회 음용`;
						} else {
							li += weekDays[dow];
						    li +=`요일 \${prdInfos[i].before_cnt}회에서 \${prdInfos[i].after_cnt}회로 변경 `;
						} // if
					    li +=`</span>`;
					} // for
					li += `</div></li>`;
					modal.find(".product-content-list").append(li);
				} // for
				
				modal.modal("show");
				
	        }).fail(function(error){
	            console.log("error", error);
	        });
		});
	})
</script>