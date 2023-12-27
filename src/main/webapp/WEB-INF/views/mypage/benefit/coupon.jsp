<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container">
	<div class="border-wrapper">
		<h2 class="container-title">쿠폰</h2>
		<div class="page-tab">
			<a href="/mypage/benefit/coupon.do" class="active">전체</a> <a
				href="/mypage/benefit/coupon?type=CPTP012">매일배송</a> <a
				href="/mypage/benefit/coupon?type=CPTP013">택배배송</a>
			<button style="margin-left: 20px; color: #7acc12" onclick="openWindowPop('/resources/assets/images/common/couponGuide.png','popup')" target="img">쿠폰사용가이드</button>
		</div>
	</div>
	<div class="coupon-srch">
		<form id="registCoupon">
			<div class="form-input none-dt">
				<dl>
					<dt>
						<label>쿠폰번호</label>
					</dt>
					<dd>
						<input type="text" name="code" placeholder="쿠폰번호를 입력하세요.">
						<button class="btn-square">쿠폰등록</button>
					</dd>
				</dl>
			</div>
		</form>
	</div>

	<div class="page-addiction-wrapper" style="align-items: center; margin-bottom: 2px;">
		<div class="info-copy"></div>
		<div class="price-tag coupon right">
		    <label>사용가능한 쿠폰</label>
		    <p class="value">${unusedCoupon}</p>
		</div>
	</div>



	<div class="coupon-item-list">
		<ul id="pagable-list" data-list-object="append">
			<c:forEach var="haveCoupon" items="${coupons}" varStatus="status">
				<c:set var="expiryDateObj" value="${haveCoupon.expiry_date}" scope="page" />

				<c:if test="${haveCoupon.expiry_date.toLocalDate().toEpochDay() - java.time.LocalDate.now().toEpochDay() >= 1}">
					<li>
						<div class="${haveCoupon.used == 1 ? 'item disabled' : 'item '}">
							<div style="min-height: 175px" class="body">
								<div
									style="display: flex; justify-content: space-between; min-height: 35px">
									<h4>${haveCoupon.couponInfo.coupon_name}</h4>
									<c:if test="${haveCoupon.used != 1}">
										<a style="padding: 0 18px; font-size: 13px; height: 34px" href="/mypage/drink/bill" class="rounded-button">사용하러가기</a>
									</c:if>
								</div>
								<div class="date">
									<p>${haveCoupon.issue_date}~${haveCoupon.expiry_date}</p>
									<span>${haveCoupon.expiry_date.toLocalDate().toEpochDay() - java.time.LocalDate.now().toEpochDay() - 19718 }일 남음</span>
								</div>
								<ul>
									<li>${haveCoupon.couponInfo.duplication == 0 ? '중복사용가능' : '중복사용 불가능'}</li>
									<li class="prtn">${haveCoupon.couponInfo.delivery_type == 0 ? '전 매일배송상품 사용가능' : '전 택배배송상품 사용가능'} &nbsp;&nbsp;/&nbsp;&nbsp; 전 가맹점 사용가능</li>
								</ul>
							</div>
							<div class="foot">
								<p class="price">
									<c:choose>
										<c:when test="${haveCoupon.couponInfo.discount < 1}">
											<fmt:formatNumber value="${haveCoupon.couponInfo.discount}" type="number" minFractionDigits="2" maxFractionDigits="2" />
											<span>%</span>
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${haveCoupon.couponInfo.discount}" type="number" pattern="#" />
											<span>원</span>
										</c:otherwise>
									</c:choose>
								</p>
								<p class="out">사용완료</p>
							</div>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>

</div>
<img src="/resources/assets/images/common/couponGuide.png"
			style="display: none" id="guideImage" alt="">