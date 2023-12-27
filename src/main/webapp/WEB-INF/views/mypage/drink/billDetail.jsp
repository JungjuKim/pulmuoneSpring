<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/assets/js/order/mypageDrink.js"></script>

<div class="container">
	
	<div class="border-wrapper">
		<h2 class="container-title">영수증조회</h2>
		<div class="page-tab">
			<a class="active" href="/mypage/drink/bill">스마트청구서</a>
			<a href="/mypage/drink/bill/cash">현금영수증</a>
		</div>
	</div>
	
	<div class="page-addiction-wrapper">
		<div class="info-copy">
			<div class="box" style="width:100%">
				<a data-value="" class="nickname-format" style="width:356px;" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false">
					<label>기본</label>
					<h5>${ drkOrderBillDTO.drk_order_name }</h5>
					<span>${ drkOrderBillDTO.drk_order_no }</span>
				</a>
				<div style="overflow:scroll;max-height: 200px;max-width: 200px" id="custList" class="dropdown-menu">
					<a data-value="" class="dropdown-item nickname-format" style="width:356px;"
						 href="/mypage/drink/bill/detail?custNumber=230000234094&amp;nickname=음용1&amp;askMn=202312&amp;defaultYn=Y">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="box-partition">
		<div class="part" style="padding-top:23px; padding-bottom:20px;">
			<a id="dropdown" data-value="" class="date-picker" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false">
				<span>2023. 12</span>
			</a>
			<div style="overflow:scroll;max-height: 200px;max-width: 140px" id="selTerm" class="dropdown-menu">
				<a data-value="202312" class="dropdown-item year" href="javascript:void(0)">2023. 12</a>
				<a data-value="202311" class="dropdown-item year" href="javascript:void(0)">2023. 11</a>
				<a data-value="202310" class="dropdown-item year" href="javascript:void(0)">2023. 10</a>
				<a data-value="202309" class="dropdown-item year" href="javascript:void(0)">2023. 09</a>
				<a data-value="202308" class="dropdown-item year" href="javascript:void(0)">2023. 08</a>
				<a data-value="202307" class="dropdown-item year" href="javascript:void(0)">2023. 07</a>
				<a data-value="202306" class="dropdown-item year" href="javascript:void(0)">2023. 06</a>
				<a data-value="202305" class="dropdown-item year" href="javascript:void(0)">2023. 05</a>
				<a data-value="202304" class="dropdown-item year" href="javascript:void(0)">2023. 04</a>
				<a data-value="202303" class="dropdown-item year" href="javascript:void(0)">2023. 03</a>
				<a data-value="202302" class="dropdown-item year" href="javascript:void(0)">2023. 02</a>
				<a data-value="202301" class="dropdown-item year" href="javascript:void(0)">2023. 01</a>
			</div>
		</div>
			
		<div class="part price-docs">
			<div class="price-docs-value">
				<div class="horizontal-group">
					<h4>실시간 금액</h4>
					<div class="price"><fmt:formatNumber value="${ nowPrice }" type="number"/><span>원</span></div>
				</div>
				<div class="caution-wrapper">
					<span class="caution">※ 1일부터 당일까지 음용하신 상품 기준 금액</span>
				</div>
			</div>
			<div class="ellipse-icon">
				<span></span>
			</div>
			<div class="price-docs-value">
				<div class="horizontal-group">
					<h4>할인금액</h4>
					<div class="price" style="color:">0<span>원</span>
					</div>
				</div>
				<div class="caution-wrapper">
					<span class="caution">※ 할인 쿠폰 사용 금액</span>
						<button data-toggle="modal" data-target="#couponModal" id="couponBtn" class="primary rounded-button sm">할인쿠폰등록</button>
				</div>
			</div>
		</div>
		
		<div class="part-coupon">
			<div class="horizontal-group top">
				<h4 style="margin-top:2px">사용쿠폰</h4>
				<div>
					<span class="caution">등록된 쿠폰이 없습니다.</span>
					<div style="margin-top: 10px">
						<button class="rounded-button primary" onclick="openWindowPop('/resources/assets/images/common/couponGuide.png','popup')" target="img">쿠폰사용가이드</button>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="part price-docs" style="padding-top:27px; padding-bottom:19px;">
			<div class="price-docs-value">
				<div class="horizontal-group">
					<div>
						<h4 style="color: black">결제 예정 금액</h4>
						<div class="caution-wrapper">
							<span class="caution">※ 월말까지 음용 시, 결제 요청(예정)금액</span>
						</div>
					</div>
					<div class="price lg" style="margin-top:12px; margin-right:1px;"><fmt:formatNumber value="${ drkOrderBillDTO.drk_month_price }" type="number"/><span>원</span></div>
				</div>
			</div>
		</div>
		
		<div class="part" style="padding-top:16px; padding-bottom:12px;">
			<table class="doc-style-table">
				<colgroup>
					<col width="103px">
					<col width="176px">
					<col width="103px">
					<col width="*">
				</colgroup>
				
				<tbody>
					<tr>
						<th>결제수단</th>
						<td>
							<c:choose>
								<c:when test="${ drkOrderBillDTO.drk_pay_method eq  0 }">
									<span class="value">카드결제</span>
								</c:when>
								<c:when test="${ drkOrderBillDTO.drk_pay_method eq  1 }">
									<span class="value">계좌이체 (${ acntInfoDTO.bank_name })</span>
								</c:when>
								<c:otherwise>
									<span class="value">현장결제</span>
								</c:otherwise>
							</c:choose>
						</td>
						<th>담당가맹점</th>
						<td>${ drkOrderBillDTO.fc_name }</td>
					</tr>
					
					<tr>
						<th>결제자</th>
						<c:choose>
							<c:when test="${ empty acntInfoDTO }">
								<td>${ name }</td>
							</c:when>
							<c:otherwise>
								<td>${ acntInfoDTO.acnt_holder }</td>
							</c:otherwise>
						</c:choose>
						<th>가맹점연락처</th>
						<td>
							<ul class="addiction-info">
								<li class="tel">
									<label></label>
									<p data-call-text="">${ drkOrderBillDTO.fc_tel }</p>
								</li>
								<li class="phone">
									<label></label>
									<p data-call-text="">${ drkOrderBillDTO.fc_phone }</p>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="alert-area lg between columns" style="margin-top:33px; padding-top:20px;">
		<h4>쿠폰 유의사항</h4>
		<ul>
			<li>쿠폰은 실시간 결제 금액보다 큰 경우 적용이 불가합니다.</li>
			<li>쿠폰은 스마트청구서에서 적용 시 사용 취소가 불가합니다.</li>
			<li>쿠폰은 스마트청구서에서 매월 25일까지만 적용 가능합니다.</li>
			<li>쿠폰 별 사용 조건과 기간 등을 확인하시고 사용해주세요.</li>
			<li>쿠폰 사용 기간이 지난 쿠폰은 적용 및 재발급이 불가합니다.</li>
		</ul>
	</div>
	
	<div class="box-partition title-sep">
		<div class="title">
			<h2>음용캘린더</h2>
		</div>
		
		<div class="part-horizontal">
			<div class="calendar-ui">
				<div class="calendar-wrap">
					<div class="month-control">
						<div class="date">
							<span id="calYear">2023</span>.
							<span id="calMonth">12</span>
						</div>
					</div>
					
					<table class="scriptCalendar" style="width: 100%;">
						<thead="" />
						<tbody>
							<tr><td style="color: rgb(187, 187, 187); line-height: 3;">26</td><td style="color: rgb(187, 187, 187); line-height: 3;">27</td><td style="color: rgb(187, 187, 187); line-height: 3;">28</td><td style="color: rgb(187, 187, 187); line-height: 3;">29</td><td style="color: rgb(187, 187, 187); line-height: 3;">30</td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>01</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);">02</td></tr><tr><td style="color: rgb(239, 103, 95); line-height: 3; background-color: rgb(255, 255, 255);">03</td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>04</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>05</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>06</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>07</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>08</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);">09</td></tr><tr><td style="color: rgb(239, 103, 95); line-height: 3; background-color: rgb(255, 255, 255);">10</td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>11</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>12</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>13</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>14</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>15</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);">16</td></tr><tr><td style="color: rgb(239, 103, 95); line-height: 3; background-color: rgb(255, 255, 255);">17</td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);">18</td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>19</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255);"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>20</span></div></td><td style="color: rgb(51, 51, 51); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer; font-weight: bold;"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>21</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>22</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;">23</td></tr><tr><td style="color: rgb(239, 103, 95); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;">24</td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>25</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>26</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>27</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>28</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;"><div style="cursor:pointer;" class="checkDrink day-with-symbol"><span>29</span></div></td><td style="color: rgb(102, 102, 102); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;">30</td></tr><tr><td style="color: rgb(239, 103, 95); line-height: 3; background-color: rgb(255, 255, 255); cursor: pointer;">31</td><td style="color: rgb(187, 187, 187); line-height: 3;">01</td><td style="color: rgb(187, 187, 187); line-height: 3;">02</td><td style="color: rgb(187, 187, 187); line-height: 3;">03</td><td style="color: rgb(187, 187, 187); line-height: 3;">04</td><td style="color: rgb(187, 187, 187); line-height: 3;">05</td><td style="color: rgb(187, 187, 187); line-height: 3;">06</td></tr></tbody><tbody></tbody>
					</table>
					
					<div>
						<ul class="legend-wrap" style="border-bottom: none">
							<li><span style="background-color: #7acc12"></span>배송(예정)</li>
							<li><span style="border: 2px solid #7acc12"></span>배송일정변경</li>
							<li><span style="background-color: #ddd"></span>미배송</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="product-wrapper" style="padding:24px 24px 0;">
				<div class="part-head" style="margin-bottom:17px;">
					<h5>음용상세내역</h5>
				</div>
				<ul class="product-list">
					<li>
						<div class="thumb">
							<img src="/file/download/product/4cf0398b-fb18-45f9-97c4-be8b5bd2edd6.jpg" alt="">
						</div>
						<div class="content">
							<p>하트러브 엑스투</p>
							<span>3,300 원 X  4개</span>
						</div>
						<p class="price">13,200<span> 원</span></p>
					</li>
				</ul>
				
				<div class="total-count">
					<label>총 금액</label>
					<div class="price-tag right">
						<p class="value"><fmt:formatNumber value="${ drkOrderBillDTO.drk_month_price }" type="number"/></p>
						<span class="unit" style="font-size:14px">원</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="btn-area-right" style="margin-top:18px;">
			<button type="button" id="printBtn" class="btn-default btn-black" style="width:140px; padding: 0;">인쇄</button>
			<a href="/mypage/drink/bill" class="btn-default btn-white" style="width:140px; padding: 0;">목록으로</a>
		</div>
	
</div>

<script>
	$(function () {
		
	})
</script>
<img src="/resources/assets/images/common/couponGuide.png"
			style="display: none" id="guideImage" alt="">