<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="contents-area">
	<div class="container">
		<div class="breadcrumb-style">
	    	<div class="wrap">
	        	<ul>
	            	<li><a href="/">홈</a></li>
	                <li><a href="/">장바구니</a></li>
	                <li><a class="active">주문완료</a></li>
				</ul>
			</div>
		</div>
		
		<div class="checkout-complete-area">
			<div class="text-alignC">
				<img src="/resources/assets/images/ui/ico-check-big.png" alt="">
				<strong>주문신청이 완료되었습니다.</strong>
			</div>
			
			<div class="checkout-complete-info">
				<div class="checkout-complete-text">
					<b style="margin-bottom: 24px">주문정보</b>
					<ul style="margin-bottom: 35px">
						<li>
							<span>배송가맹점</span>
							<b>${ franchiseDTO.fc_name }</b>
						</li>
						
						<li>
							<span>가맹점 연락처</span>
							<ol class="contact-num-area">
								<li>
									<i>
										<img src="/resources/assets/images/ui/ico_franchisee_tel.png" alt="전화">
									</i>
									<em data-call-text="">${ franchiseDTO.fc_tel }</em>
								</li>
								<li>
									<i>
										<img src="/resources/assets/images/ui/ico_franchisee_phone.png" alt="휴대전화">
									</i>
									<em data-call-text="">${ franchiseDTO.fc_phone }</em>
								</li>
							</ol>
						</li>
						
						<li>
							<span>첫 배송 예정일</span>
							<b>${ drk_start_date }</b>
						</li>
						
						<li>
							<span>배송메모</span>
							<b>${ memo }</b>
						</li>
					</ul>
					
					<div class="btn-area">
						<a style="margin: 0px 14px; height: 60px" href="/" type="button" class="btn-default btn-white">메인으로</a>
						<a style="margin: 0px 14px; height: 60px" href="/mypage/drink/drink" type="button" class="btn-default">매일배송 주문내역</a>
					</div>
				</div>
				
				<ul class="prd-area">
					<c:forEach items="${ dailyItemInfoList }" var="item">
						<li>
							<span class="thumb">
								<img src="/${ item.img_path }/${ item.system_name }" alt="${ item.products_name }">
							</span>
							<div class="prd-info">
								<b class="prd-title" style="text-align: start">${ item.products_name }
									<small class="volume" style="font-size: 12px">(${ item.products_size })</small>
								</b>
								<ul class="checkout-daily-info">
									<c:forEach items="${ item.products_cnt }" var="cnt" varStatus="status">
										<li>
											<span>${ cnt }</span>
										</li>
									</c:forEach>
								</ul>
							</div>
						</li>
					</c:forEach>
				</ul>
				
			</div>
			<span class="shipping-Info-text">※ 영업일 기준 3일 이내에 배송가맹점에서 안내드린 후 배송이 시작되며, 일부 가맹점 사정에 따라 상이할 수 있습니다.</span>
		</div>
	</div>
</div>

<script>
	$(function () {
		let uls = $(".checkout-daily-info");

	    for (var i = 0; i < uls.length; i++) {
	        let lis = uls.eq(i).find("li");
	        for (var j = 0; j < lis.length; j++) {
	            let li = lis.eq(j);
	            li.text(weekDays[j] + li.text());
	        } // for
	    } // for
	});
</script>
