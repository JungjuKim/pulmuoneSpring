<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/assets/js/order/mypageDrink.js"></script>

<div class="container">
	
	<div class="border-wrapper">
		<h2 class="container-title">음용중지신청</h2>
	</div>
							
	<div class="drinking-list">
		<div class="item" style="margin-bottom:10px;">
			<div class="head">
				<div class="nickname-format xxl">
					<label class="basic">기본</label>
					<h5>${ drkOrderMypageDTO.drk_order_name }</h5>
					<span>${ drkOrderMypageDTO.drk_order_no }</span>
				</div>
				
				<ul class="info" style="margin-top:15px; margin-bottom:2px;">
					<li>
						<label>담당 가맹점</label>
						<p>${ drkOrderMypageDTO.fc_name }</p>
					</li>
					<li>
						<label>음용기간</label>
						<p>${ drkOrderMypageDTO.drk_start_date } ~</p>
					</li>
					<li>
						<label>결제수단</label>
						<p>
							<c:choose>
								<c:when test="${ drkOrderMypageDTO.drk_pay_method eq 0 }">
									카드결제
								</c:when>
								<c:when test="${ drkOrderMypageDTO.drk_pay_method eq 1 }">
									계좌결제
								</c:when>
								<c:otherwise>
									현장결제
								</c:otherwise>
							</c:choose>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
						
	<div class="out-partition" style="padding-top:23px;">
		<div class="title">음용중지 사유</div>
		<div class="box-partition" style="margin-bottom:20px;">
			<div class="part" style="padding-top:18px;">
				<div class="vertical-radio-group">
					<label>
						<input value="r1" name="reasonCode" checked="" type="radio">
						<div class="radio-display"></div>
						<p>구매의사가 없다.</p>
					</label>
				
					<label>
						<input value="r2" name="reasonCode" type="radio">
						<div class="radio-display"></div>
						<p>이용한 상품 및 서비스에 불만족스럽다.</p>
					</label>
					
					<label>
						<input value="r3" name="reasonCode" type="radio">
						<div class="radio-display"></div>
						<p>타 상품 및 서비스를 이용하고자 한다.</p>
					</label>
					
					<label>
						<input value="r4" name="reasonCode" type="radio">
						<div class="radio-display"></div>
						<p>홈페이지 회원 혜택이 적다.</p>
					</label>
					
					<label>
						<input value="r5" name="reasonCode" type="radio">
						<div class="radio-display"></div>
						<p>기타 사유</p>
					</label>
				
					<div class="form-input none-dt" style="padding-left:40px; margin-top:4px;">
						<dl>
							<dt><label>기타 사유 입력</label></dt>
							<dd>
								<input disabled="" name="reasonDtl" type="text" placeholder="기타사유를 작성해주세요.">
							</dd>
						</dl>
					</div>
				</div>
			</div>
							
			<div class="part">
				<div class="form-input period">
					<dl class="date-complex">
						<dt style="padding-left:20px; width:125px;"><label>희망중지일</label></dt>
						<dd>
							<div>
								<input type="text" readonly="" name="startDate" id="startDate" data-placeholder="날짜를 입력하세요." required="" aria-required="true" value="">
							</div>
						</dd>
					</dl>
				</div>
			</div>
		</div>
			
		<span style="padding-left:3px; margin-bottom:10px;display: block" class="foot-copy">
			※ 음용 중지는 가맹점에서 확인 후 진행됩니다. (타 쇼핑몰 주문 건은 홈페이지에서 음용 중지 신청이 불가합니다.)
		</span>
		<span style="padding-left:3px;" class="foot-copy">
			※ 음용 중지일은 영업일 기준 D+3일로 신청 가능합니다. 그 외 원하시는 중지 일정은 1:1 문의 게시판 또는 가맹점을 통해 문의해주세요.
		</span>
			
		<div class="btn-area-right" style="margin-top: 20px">
			<a href="/mypage/drink/drinks/${ drkOrderMypageDTO.drk_order_no }" style="cursor:pointer;padding:0; width:140px;" id="cancel" class="btn-default btn-white">취소</a>
			<button id="requestBtn" class="btn-default">음용중지신청</button>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/ui/alertmodal.jsp"%>
<%@ include file="/WEB-INF/views/ui/confirmdesignmodal.jsp"%>

<script>
	
	$(function () {
		let today = new Date();
		let stopDay = getStopDay(today);
		$("#startDate").val(stopDay);

		$('input[name="reasonCode"]').on('click', function(){
			if ($(this).val() === "r5") $('input[name="reasonDtl"]').prop('disabled', false);
	        else $('input[name="reasonDtl"]').prop('disabled', true);
	    });
		
		$("#requestBtn").on("click", function(){
			let header = '${_csrf.headerName}';
			let token = '${_csrf.token}';
			let drk_order_no = ${ drkOrderMypageDTO.drk_order_no };
			let dateParts = stopDay.split(".");
			let drk_end_date = new Date(+dateParts[0], dateParts[1] - 1, +dateParts[2]);
			console.log(drk_end_date);
			
	        confirmDesign("",'음용상품을 중지하시겠습니까?', function (){
	            $.ajax({
	                url: "/mypage/drink/drink/stop/"+drk_order_no
	                , contentType: "application/json"
	                , data: JSON.stringify({ drk_end_date: drk_end_date })
	                , dataType:"json"
	                , type:"POST"
	                , cache:false
	                , beforeSend: function(xhr){
	                	xhr.setRequestHeader(header, token);
	                }
	                , success: function (response){
	                	alert( '음용중지가 신청되었습니다', function() {
		                    location.href="/mypage/drink/drink";
		                });
					}
					, error : function (e){
						console.log(e);
					}
	            });
	        })
		});
	})
</script>