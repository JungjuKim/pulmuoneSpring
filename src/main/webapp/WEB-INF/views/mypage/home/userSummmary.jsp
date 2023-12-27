<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<div class="container">

	<h2 class="container-title light">
		<b><sec:authentication property="principal.member.name"/></b>님 안녕하세요
	</h2>
	
	<ul class="stat-wrapper">
		<li>
			<a href="/mypage/drink/drink" class="item">
				<label>매일배송</label>
				<span>${ drkOrderMypageDTO.total_count }</span>
			</a>
		</li>
		<li class="dim">
			<a href="/mypage/order/box" class="item">
				<label>택배배송</label>
				<span style="color: #333;border-bottom: 1px solid #7acc12">${ boxOrderMypageList[0].total_count }</span>
			</a>
		</li>
		<li>
			<a href="/taste/taste" class="item">
				<label>시음선물</label>
				<span class="blank_copy">선물해보세요</span>
			</a>
		</li>
		<li>
			<a href="#" id="coupon-link" class="item">
				<label>쿠폰</label>
				<c:choose>
					<c:when test="${unusedCoupon > 0}">
						<span>${unusedCoupon}</span>
					</c:when>
					<c:otherwise>
						<span class="blank_copy">친구초대하고 쿠폰받으세요</span>
					</c:otherwise>
				</c:choose>
			</a>
		</li>
		<li>
			<a href="/mypage/action/review" class="item">
				<label>리뷰</label>
				<c:choose>
				<c:when test="${fn:length(reviewlist) > 0 }">
				<span>${fn:length(reviewlist) }</span>				
				</c:when>
				<c:otherwise>
				<span style="border-bottom: none;color: #999">0</span>
				</c:otherwise>				
				</c:choose>
			</a>
		</li>
		<li>
			<a href="/mypage/inquiry/list" class="item">
				<label>1:1 문의</label>
				<c:choose>
				<c:when test="${fn:length(reviewlist) > 0 }">
				<span>${ totalCount }</span>				
				</c:when>
				<c:otherwise>
				<span style="border-bottom: none;color: #999">0</span>
				</c:otherwise>				
				</c:choose>
				
			</a>
		</li>
	</ul>

	<div class="box-partition">
		<%@ include file="/WEB-INF/views/layouts/mypage/order/userSummaryDaily.jsp"%>
		
		<%@ include file="/WEB-INF/views/layouts/mypage/order/userSummaryBoxSummary.jsp"%>
		
		<%@ include file="/WEB-INF/views/layouts/mypage/order/userSummaryBox.jsp"%>
	</div>
</div>
					
					
<script>
	$(function () {
	    $("div.item p").each(function(index) {
	        if ($(this).text() != 0) {
	            $("div.item:eq(" + index + ")").parent("li").addClass("active");
	        } // if
	    });
	})
</script>
<script>
	document.getElementById('coupon-link').addEventListener('click', function(e) {
		e.preventDefault(); // 기본 이벤트를 막음
		if (${unusedCoupon > 0}) {
			window.location.href = "/mypage/benefit/coupon";
		} else {
			window.location.href = "/event/event/view?event_no=2";
		}
	});
</script>
<script>
$(function(){	
	if("${param.with}" == "01"){
		alert("정기주문시 이용할 수 있는 서비스입니다.");
		history.replaceState({}, null, location.pathname);		
	}
});

</script>