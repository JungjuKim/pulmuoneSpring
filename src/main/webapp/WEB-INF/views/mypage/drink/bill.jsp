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
	
	<div style="display: flex; justify-content: flex-end;" class="page-addiction-wrapper">
		<div class="form-input select none-dt" style="width:348px;">
			<dl class="date-complex">
				<div class="dropdown">
					<a id="yearLabel" data-value="" class="btn dropdown-toggle" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false"></a>
					<div id="year" class="dropdown-menu"></div>
				</div>
				<div class="dropdown">
					<a id="monthLabel" data-value="" class="btn dropdown-toggle" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false">월</a>
					<div id="month" class="dropdown-menu"></div>
				</div>
				<button type="button" id="searchBtn" class="btn-square btn-black" style="width:100px; height: 60px">조회</button>
			</dl>
		</div>
	</div>
	
	<div class="price-tag right" style=" margin-top:22px; margin-right:4px;">
		<label>총 청구금액</label>
		<p class="totalValue value">0</p>
		<span class="unit">원</span>
	</div>
	
	<c:choose>
		<c:when test="${ empty drkOrderBillList }">
			<div class="nickname-list">
				<div class="empty-area" style="padding: 100px 0px;">
					<img src="/resources/assets/images/ui/ico-alert.png" alt="empty">
					<b>기간 내 청구내역이 없습니다.</b>
				</div>
				<ul>
				</ul>
				<div class="button-set" style="margin-bottom:0;height: 50px">
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="nickname-list">
				<ul>
					<c:forEach items="${ drkOrderBillList }" var="list" varStatus="s">
						<li>
							<div class="flex-full nickname-format lg">
								<c:if test="${ s.index eq 0 }">
									<label class="default">기본</label>
								</c:if>
								<h5>${ list.drk_order_no }</h5>
								<span>${ list.drk_order_name }</span>
							</div>
							<div class="flex in20">
								<div class="price-tag right sm">
									<p class="value eachValue" data-value="${ list.drk_month_price }"><fmt:formatNumber value="${ list.drk_month_price }" type="number"/></p>
									<span class="unit">원</span>
								</div>
								<button type="button" data-order-no="${ list.drk_order_no }" class="detailBtn rounded-button">상세보기</button>
							</div>
						</li>
					</c:forEach>
				</ul>
				
				<div class="button-set" style="margin-bottom:0;height: 50px"></div>
				<div class="price-tag right" style=" margin-top:22px; margin-right:4px;">
					<label>총 청구금액</label>
					<p class="totalValue value">0</p>
					<span class="unit">원</span>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div class="alert-area lg" style="border-top: unset;margin-top: unset">
		<h4>안내사항</h4>
		<ul>
			<li>스마트청구서는 최근 1년간 음용 내역에 한해 조회 가능하며, 이전 내역이 필요하신 경우 고객기쁨센터를 통해 문의해주세요.</li>
			<li>스마트청구서는 후불 정기 결제 고객에 한해 제공됩니다.</li>
			<li>배송 일정에 따라 실제 청구 금액과 일부 상이할 수 있으며, 추가 궁금한 사항은 배송 가맹점을 통해 문의해주세요.</li>
		</ul>
	</div>
</div>

<script>
	$(function (){
		let totalValue = 0;
		$(".eachValue").each(function () {
			totalValue += parseInt($(this).data("value"));
		});

		$(".totalValue").text(totalValue.toLocaleString());
		
		//region Date
		let now = new Date();
		let year = now.getFullYear();
		let month = (now.getMonth()+1) > 9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);

		$('#yearLabel').data('value', year);
		$('#yearLabel').text(year+'년');
		$('#monthLabel').data('value', month);
		$('#monthLabel').text(month+'월');
		
		let diffYear1 = year;
		let diffMonth1 = 12 - month;
		let diffMonth2 = 12 - diffMonth1;

		// 년도 selectbox (최근 1년)
		let yearList = `<a data-value='\${year}' class="dropdown-item year" href="javascript:void(0)">\${year}년</a>`;
		if ( month != "12" ) {
			$("#year").append(yearList);
			year = year-1;
			$("#year").append(`<a data-value='\${year}' class="dropdown-item year" href="javascript:void(0)">\${year}년</a>`);
		} else {
			$("#year").append(yearList);
		}
		
		let urlParams = new URLSearchParams(window.location.search);
		var searchDate = urlParams.get('searchDate');
		
		let searchYear;
		let searchMonth;
		
		if(!searchDate) {
			searchYear = year;
			searchMont = month;
		} else {
			searchYear = searchDate.substring(0,4);
			searchMonth = searchDate.substring(4,6);
			$('#yearLabel').text(searchYear+'년');
			$('#monthLabel').text(searchMonth+'월');
		}

		// 월 selectbox (최근 1년)
		if ( diffYear1 == searchYear ) {
			for(var j=1; j <= diffMonth2; j++) {
				var selMonth = j > 9 ? j : "0"+j ;
				$("#month").append(`<a data-value='\${selMonth}' class="dropdown-item month" href="javascript:void(0)">\${selMonth}월</a>`);
			}
		} else {
			for(var j=diffMonth2+1; j <= 12; j++) {
				var selMonth = j > 9 ? j : "0"+j ;
				$("#month").append(`<a data-value='\${selMonth}' class="dropdown-item month" href="javascript:void(0)">\${selMonth}월</a>`);
			}
		}

		$(document).on('click','.dropdown-item.year',function () {
			var selYear = $(this).data('value')
			$("#month").children().remove();
			if ( diffYear1 == selYear ) {
				for(var j=1; j <= diffMonth2; j++) {
					var selMonth = j > 9 ? j : "0"+j ;
					$("#month").append(`<a data-value='\${selMonth}' class="dropdown-item month" href="javascript:void(0)">\${selMonth}월</a>`);
				}
			} else {
				for(var j=diffMonth2+1; j <= 12; j++) {
					var selMonth = j > 9 ? j : "0"+j ;
					$("#month").append(`<a data-value='\${selMonth}' class="dropdown-item month" href="javascript:void(0)">\${selMonth}월</a>`);
				}
			}
			$('#yearLabel').data('value',selYear)
			$('#yearLabel').text(selYear+'년')
		})

		$(document).on('click','.dropdown-item.month',function (){
			var selMonth = $(this).data('value')
			$('#monthLabel').data('value',selMonth)
			$('#monthLabel').text(selMonth+'월')
		})

		$(document).on("click", "#searchBtn", function() {
			let searchDate =  $('#yearLabel').data('value').toString() + $('#monthLabel').data('value').toString();
			location.href="/mypage/drink/bill?searchDate="+searchDate;
		});
		
		$(document).on("click", ".detailBtn", function() {
			let orderNo = $(this).data("order-no");
			let askMn = searchYear + searchMonth;
            location.href ='/mypage/drink/bill/detail?1=1&'+$.param({orderNo,askMn})
		});
	})
</script>