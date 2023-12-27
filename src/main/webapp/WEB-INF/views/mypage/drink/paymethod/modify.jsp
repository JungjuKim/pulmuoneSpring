<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<script src="/resources/assets/js/cms.js"></script>



<form id="modifyForm" data-gtm-form-interact-id="0">
	<input type="hidden" name="drkOrderNo" id="fdCustId" value="${ dto.drkOrderNo }">
	<input type="hidden" name="cmsId" id="cmsId" value="">
	<input type="hidden" name="intfacId" id="intfacId" value="">
	<input type="hidden" name="fcNo" id="officeCode" value="${ dto.fcNo }">
	<input type="hidden" name="cardValidation" id="cardValidation" value="">
	<input type="hidden" name="drkPayMethod" value="${ dto.drkPayMethod }">
<!-- 	<input type="hidden" name="payMethod" value="CARD"> -->
<!-- 	<div class="container aside-layout" style="padding-bottom:120px; "> -->
		

		<div class="container">

			<div class="border-wrapper" style="margin-bottom:0;">
				<h2 class="container-title">
					결제수단 관리
				</h2>
			</div>
			<div class="box-partition nobox" style="width:640px;">
				<div class="part">
					<div class="part-head" style="margin-bottom:18px;">
						<h5 style="line-height:1;">기존 결제수단</h5>
					</div>
					<div class="nickname-format lg" style="margin:0px 0 6px;">
						
							<label>기본</label>
						
						<h5>${ dto.drkOrderName }</h5>
						<span>${ dto.drkOrderNo }</span>
					</div>
					<table class="doc-style-table">
						<colgroup>
							<col width="121">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<th>담당가맹점</th>
							<td>${ dto.fcName }</td>
						</tr>
						<tr>
							<th>가맹점연락처</th>
							<td>
								<ul class="addiction-info">
									<li class="tel">
										<label></label>
										<p data-call-text="">${ dto.fcTel }</p>
									</li>
									<li class="phone">
										<label></label>
										<p data-call-text="">${ dto.fcPhone}</p>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>결제수단</th>
							<td><p class="payMethod"></p></td>
						</tr>
					</tbody></table>
					<p class="warning-description" style="margin-top:14px; margin-bottom:1px;">고객번호와 가맹점이 맞는지 반드시
						확인하세요.</p>
				</div>
				<div class="part">
					<div class="part-head" style="margin-bottom:17px;">
						<h5 style="line-height:1;">변경 결제수단</h5>
					</div>
					<div class="select-checkout-area">
						<ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
							<li class="nav-item" role="presentation">
<!-- 								<a href="#" data-value="card" class="nav-link active" id="checkout-type-tab1" data-target="#checkout-type1" data-toggle="tab" role="tab" aria-controls="checkout-type1" aria-selected="true"> -->
								<a href="#" data-value="0" class="nav-link active" id="checkout-type-tab1" data-target="#checkout-type1" data-toggle="tab" role="tab" aria-controls="checkout-type1" aria-selected="true">
									<span>카드결제</span>
								</a>
							</li>
							<li class="nav-item" role="presentation">
<!-- 								<a href="#" data-value="bank" class="nav-link" id="checkout-type-tab2" data-target="#checkout-type2" data-toggle="tab" role="tab" aria-controls="checkout-type2" aria-selected="false"> -->
								<a href="#" data-value="1" class="nav-link" id="checkout-type-tab2" data-target="#checkout-type2" data-toggle="tab" role="tab" aria-controls="checkout-type2" aria-selected="false">
									<span>계좌결제</span>
								</a>
							</li>
							
								<li class="nav-item" role="presentation">
<!-- 									<a href="#" data-value="cash" class="nav-link" id="checkout-type-tab3" data-target="#checkout-type3" data-toggle="tab" role="tab" aria-controls="checkout-type3" aria-selected="false"> -->
									<a href="#" data-value="2" class="nav-link" id="checkout-type-tab3" data-target="#checkout-type3" data-toggle="tab" role="tab" aria-controls="checkout-type3" aria-selected="false">
									<span>현장결제</span>
									</a>
								</li>
							
						</ul>
						<div class="tab-content checkout-input-box" id="myTabContent">
							<div class="tab-pane fade active show" style="margin-top: 30px" role="tabpanel" id="checkout-type1" aria-labelledby="checkout-type-tab1">

									<div class="form-input">
										<dl>
											<dt>
												<label for="cardNumber">카드번호</label>
											</dt>
											<dd>
												<input type="text" class="cardNumber" name="cardNum" id="cardNumber" data-credit-text="" maxlength="19" title="카드번호 입력" placeholder="카드번호 입력" value="">
										</dl>
									</div>
									<div class="form-input">
										<dl>
											<dt>
												<label for="birthDay">생년월일</label>
											</dt>
											<dd>
												<input type="text" class="numberOnly" id="birthDay" maxlength="6" name="cardBirthDate" title="생년월일 입력" placeholder="생년월일 입력 (예: 990101)" data-gtm-form-interact-field-id="1">
											</dd>
										</dl>
									</div>
									<div class="form-input">
										<dl>
											<dt>
												<label for="validYYMM">유효기간</label>
											</dt>
											<dd>
												<input class="numberOnly" maxlength="5" id="validYYMM" name="expiryDate" title="유효기간 입력" placeholder="유효기간 입력 (MM/YY)" value="" data-gtm-form-interact-field-id="2">
												<button type="button" id="validCardBtn" class="btn-square btn-black">카드인증</button>
											</dd>
										</dl>
									</div>

							</div>
							<div class="tab-pane fade" style="margin-top: 30px" role="tabpanel" id="checkout-type2" aria-labelledby="checkout-type-tab2">

									<div class="form-input">
										<dl>
											<dt>
												<label for="accountOwnerName">예금주</label>
											</dt>
											<dd>
												<input readonly="" type="text" name="acntHolder" id="accountOwnerName" value="${ name }">
											</dd>
										</dl>
									</div>
									<div class="form-input">
										<dl>
											<dt>
												<label for="bankCode">은행</label>
											</dt>
											<dd>
												<input type="hidden" name="bankNo" readonly="" value="">
												<select id="bankCode" class="form-select form-select-lg" aria-label=".form-select-lg example">
													<option value="" selected="">은행을 선택해주세요</option>
													<c:forEach items="${ bankDtoList }" var="bankDto">
														<option value="${ bankDto.bankNo }">${ bankDto.bankName }</option>
													</c:forEach>
												</select>
											</dd>
										</dl>
									</div>
									<div class="form-input">
										<dl>
											<dt>
												<label for="accountNumber">계좌번호</label>
											</dt>
											<dd>
												<input type="text" id="accountNumber" maxlength="16" name="acntNum" title="계좌번호 입력" placeholder="계좌번호 입력">
												<button type="button" id="callCms" style="display: none" data-fd-cust-id="${ dto.drkOrderNo }" data-phone1="${ phoneFirst }" data-phone2="${ phoneLast }"></button>
												<input id="hasRequest" value="false" type="hidden">
												<button type="button" id="beforeArs" class="btn-square btn-black">ARS인증</button>
											</dd>
										</dl>
											<p id="afterArs" class="txt-result" style="display:none;">인증이 완료되었습니다.</p>
									</div>

							</div>
							<div class="tab-pane fade" role="tabpanel" id="checkout-type3" aria-labelledby="checkout-type-tab3">
							</div>
						</div>
					</div>
				</div>
				<div class="part" style="padding-bottom:0;">
					<label class="check-type">
						<input id="agree" type="checkbox">
						<span>결제이용약관에 모두 동의합니다.</span>
					</label>
					<div class="button-set b0" style="margin-top:40px;">
						<button type="button" id="cancelChangeBtn" class="button-basic border" style="width:280px;">
							취소
						</button>
						<button type="button" id="modifyBtn" class="button-basic primary" style="width:280px;">
							저장
						</button>
					</div>
				</div>
			</div>
		</div>
<!-- 	</div> -->
</form>

<script type="text/javascript">
	$().ready(function () {
		

	    $(".payMethod").text("${ dto.drkPayMethod == 0 ? '카드 자동결제' : dto.drkPayMethod == 1 ? '계좌 자동이체' : '현장결제'}");
		
		
		
		
		
		//region cancel
		$('#cancelChangeBtn').click(function () {
			confirmDesign('', '작업한 내용이 사라집니다. 취소 하시겠습니까?', function() {
				location.href = "/mypage/drink/paymethod";				
			});
		});

		$(".numberOnly").on("keyup", function () {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
		//    endregion

		//    region creditCard

		//    region validDate
		$("#validYYMM").keyup(function () {
			var text = $.trim($(this).val());
			$(this).val(text);

			var yymm = text.replace(/[^0-9]/g, '');
			if (yymm.length >= 3) {
				yymm = yymm.replace(/(.{2})/g, "$1/")
				$(this).val(yymm.substring(0, 5));
			}
		});
		//    endregion

		//    endregion

		//    region paymethod
		$('.nav-link').click(function () {

// 			$('input[name=drkPayMethod]').val($(this).data('value').toUpperCase())
			$('input[name=drkPayMethod]').val($(this).data('value'))
			
			//     let payMethod = "${ v.drkPayMethod == 0 ? '카드 자동결제' : v.drkPayMethod == 1 ? '계좌 자동이체' : '현장결제'}";
			console.log($('input[name=drkPayMethod]').val())
			resetArs(true);
		})
		//    endregion

		//    region submit
		$("#modifyBtn").click(function () {

// 			var payMethod = $(".nav-link.active").data('value').toUpperCase();
			var payMethod = $(".nav-link.active").data('value');
            $('input[name=drkPayMethod]').val(payMethod)
// 			if (payMethod == "BANK") {
			if (payMethod == "1") {

				var bankCode = $("#bankCode").val();
				if (bankCode == "") {
					alert("은행을 선택해주세요.", function () {
						$("#bankCode").focus();
					});
					return;
				}

				var accountNumber = $.trim($("#accountNumber").val());
				$("#accountNumber").val(accountNumber);
				if (accountNumber == "") {
					alert("계좌번호를 입력해주세요.", function () {
						$("#accountNumber").focus();
					});
					return;
				}

				if ($("#afterArs").css("display") == "none") {
					alert("ARS 인증을 진행해 주세요.");
					return;
				}
				if ($('#agree:checked').length == 0) {
					alert('이용약관에 동의해주세요');
					return;
				}
				// if ( $("#bankAgree1:checked").length == 0 ) {
				//     alert( "자동이체 신청 및 해지시 유의사항에 동의해주세요.");
				//     return;
				// }
				//
				// if ( $("#bankAgree2:checked").length == 0 ) {
				//     alert( "은행 자동이체 신청 및 해지 주의사항에 동의해주세요.");
				//     return;
				// }
				//
				// if ( $("#bankAgree3:checked").length == 0 ) {
				//     alert( "개인정보 처리 위탁에 동의해주세요.");
				//     return;
				// }
// 			} else if (payMethod == "CARD") {
			} else if (payMethod == "0") {

				if ($("#cardValidation").val() == "" || $("#cardValidation").val() == "N") {
					alert("카드인증을 진행해 주세요.");
					return;
				}
				if ($('#agree:checked').length == 0) {
					alert('이용약관에 동의해주세요');
					return;
				}
				// if ( $("#cardAgree1:checked").length == 0 ) {
				//     alert( "자동이체 신청 및 해지시 유의사항에 동의해주세요.");
				//     return;
				// }
				//
				// if ( $("#cardAgree2:checked").length == 0 ) {
				//     alert( "카드 자동결제 신청 및 해지시 주의사항에 동의해주세요.");
				//     return;
				// }
				//
				// if ( $("#cardAgree3:checked").length == 0 ) {
				//     alert( "개인정보 처리 위탁에 동의해주세요.");
				//     return;
				// }
// 			} else if (payMethod == "CASH") {
			} else if (payMethod == "2") {
				if ($('#agree:checked').length == 0) {
					alert('이용약관에 동의해주세요');
					return;
				}
			} else {
				alert("결제수단을 선택해 주세요.");
				return;
			}

        	var header = '${_csrf.headerName}';
    		var token = '${_csrf.token}';
            
			confirmDesign("", "선택한 결제수단으로 변경신청 하시겠습니까?", function () {
				
				$.ajax({
					url: "/ajax/mypage/drink/paymethod/modify" , 
					contentType : "application/json; charset=utf-8",
					dataType:"json",
					data: JSON.stringify($("#modifyForm").serializeObject()),
					type:"PUT",
					cache:false ,
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success: function ( isModified,  textStatus, jqXHR ){
						if( isModified ) {
			 				alert( "변경신청이 완료되었습니다.", () => location.href = "/mypage/drink/paymethod");

						} else {  
							alert('잘못된 요청입니다.',()=>location.reload())
						}
					 
					},
					error:function (request, status, error){
						alert("에러~~~ ");
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});	
			
// 				post({
// 					url: "/mypage/drink/paymethod/modify",
// 					param: $("#modifyForm").serialize()
// 				}, function (response) {
// 					alert(response.RESULT_MSG, () => location.href = "/mypage/drink/paymethod");
// 				});
			})
		});

		//    endregion

		//    region bankAccount

		$("#beforeArs").click(function () {
			var bankCode = $("#bankCode").val();
			if (bankCode == "") {
				alert("은행을 선택해주세요.", function () {
					$("#bankCode").focus();
				});
				return;
			}

			var accountNumber = $.trim($("#accountNumber").val());
			$("#accountNumber").val(accountNumber);
			if (accountNumber == "") {
				alert("계좌번호를 입력해주세요.", function () {
					$("#accountNumber").focus();
				});
				return;
			}
			$('#callCms').click();
		});

		var resetArs = function (forceReset) {
			var payMethod = $(".nav-link.active").data('value');
			if (forceReset) {
				$("#beforeArs").show();
				$("#afterArs").hide();
				$("#accountNumber").val("");
				$("#accountNumber").prop("readonly", false);
				$("#bankCode").prop('disabled', false)
				$("#bankCode").val("");
				$("input[name=bankNo]").val("");
				var cmsId = $.trim($("#cmsId").val());
				if (cmsId != undefined && cmsId != "") {
					var url = "/fms/ars/response/delete/" + cmsId;
					get({url: url, param: {}}, function (response) {
					});
				}
			}
		};

		$("#callCms").click(function (){
// 			get({
// 				"url": "/fms/ars/call",
// 				"param": $("#modifyForm").serialize()
// 			}, function(response) {
// 			});
		})

		var resetArs = function(forceReset) {
			var payMethod = $(".nav-link.active").data('value');
			if ( forceReset ) {
				$("#beforeArs").show();
				$("#afterArs").hide();
				$("#accountNumber").val("");
				$("#accountNumber").prop("readonly", false);
				$("#bankCode").prop('disabled',false)
				$("#bankCode").val("");
				$("input[name=bankNo]").val("");
				var cmsId = $.trim($("#cmsId").val());
				if ( cmsId != undefined && cmsId != "" ) {
					var url = "/fms/ars/response/delete/" + cmsId;
					get({url: url, param: {}}, function(response) {
					});
				}
			}
		};

	    //    endregion

        });
</script>


