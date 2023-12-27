<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/assets/js/order/mypageDrink.js"></script>

<div class="container">
	<div class="border-wrapper">
		<h2 class="container-title">영수증조회</h2>
		<div class="page-tab">
			<a href="/mypage/drink/bill">스마트청구서</a>
			<a class="active" href="/mypage/drink/bill/cash">현금영수증</a>
		</div>
	</div>
	
	<div style="display: flex; justify-content: flex-end;" class="page-addiction-wrapper">
		<div class="form-input select none-dt" style="width:348px;">
			<dl class="date-complex">
				<div class="dropdown">
					<a id="yearLabel" data-value="" class="btn dropdown-toggle" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false">년</a>
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
		<p class="value">0</p>
		<span class="unit">원</span>
	</div>
	
	<div class="nickname-list" style="margin-top:28px;">
		<div class="caution-unit page" style="display: none;">
			<span class="mark"></span>
			<p>기간내 현금영수증 내역이 없습니다.</p>
		</div>
		
		<table>
			<colgroup>
				<col width="*">
				<col width="140">
				<col width="120">
				<col width="140">
				<col width="113">
			</colgroup>
			
			<tbody>
				<tr>
					<th class="t-left">고객번호</th>
					<th>신청일/발급일</th>
					<th>신청정보</th>
					<th>금액</th>
					<th>처리현황</th>
				</tr>
					
				<tr>
					<td colspan="5" class="td-noresult">
						<div class="empty-area" style="padding: 100px 0px;">
							<img src="/resources/assets/images/ui/ico-alert.png" alt="empty">
							<b>기간 내 현금영수증 내역이 없습니다.</b>
						</div>
					</td>
					<!-- 
					<td>
						<div class="nickname-format lg">
							<label>기본</label>
							<h5>음용1</h5>
							<span>230000234094</span>
						</div>
					</td>
					<td>2023.11.30</td>
					<td>010-****-전화번호</td>
					<td>
						<div class="price-tag sm center">
							<p class="value">62,100</p>
							<span class="unit">원</span>
						</div>
					</td>
					<td>발급완료</td> -->
				</tr>
			</tbody>
		</table>
	</div>
	
	<div style="margin-top: 36px; min-height: 50px">
		<nav aria-label="Page navigation example" class="pagenavi-area">
			<input type="hidden" id="pageNo" name="pageNo"><ul class="pagination"><li class="page-item active"><a class="page-link">1</a></li></ul>
		</nav>
	</div>
	
	<div class="alert-area lg" style="border-top: unset">
		<h4>안내사항</h4>
		<ul>
			<li>현금영수증은 최근 6개월 간 음용 내역에 한해 신청 가능하며, 이전 내역은 배송 가맹점 또는 고객기쁨센터(080-800-0393)를 통해 문의해주세요.</li>
			<li>현금영수증은 후불 정기 결제 고객 중 현금영수증 발행 조건에 해당되는 결제 수단 사용 시에만 신청 가능합니다.</li>
			<li>미납 시 현금영수증을 신청하셔도 처리되지 않습니다.</li>
		</ul>
	</div>
</div>

<script>
	$(function (){
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
			location.href="/mypage/drink/bill/cash?searchDate="+searchDate;
		});
	})
</script>