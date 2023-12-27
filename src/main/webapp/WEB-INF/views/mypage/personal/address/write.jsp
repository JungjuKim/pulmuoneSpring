<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<form method="post" id="addressForm" data-gtm-form-interact-id="0">
	<div class="container">

		<div class="border-wrapper">
			<h2 class="container-title">주소 등록</h2>
		</div>
		<div class="address-input-form">
			<div class="input-group">
				<div class="form-input">
					<dl>
						<dt>
							<label for="addrName">애칭</label>
						</dt>
						<dd>
							<input type="text" id="nickname" name="addrName" value="${ dto.addrName }">
						</dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt>
							<label for="name">이름</label>
						</dt>
						<dd>
							<input name="name" id="name" value="${ dto.name }" type="text">
						</dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt>
							<label for="tel">휴대폰번호</label>
						</dt>
						<dd>
							<input data-call-text="" value="${ dto.tel }" maxlength="13" class="numberOnly" name="tel" id="phoneNumber">
						</dd>
					</dl>
				</div>
			</div>
			<div class="input-group">
				<div class="form-input">
					<dl>
						<dt style="min-width: 140px;">
							<label>배달장소</label>
						</dt>
						<dd>
							<div class="radio-area radio-type2">
								<div class="radio">
									<input value="0" type="radio" id="placeTypeH" ${ dto.dest == 0 ? 'checked="checked"' : ''  } name="dest"> <label for="placeTypeH">가정</label>
								</div>
								<div class="radio">
									<input value="1" type="radio" id="placeTypeP" ${ dto.dest == 1 ? 'checked="checked"' : ''  } name="dest"> <label for="placeTypeP">회사/사무실</label>
								</div>
							</div>
						</dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt>
							<label for="zipCode">우편번호</label>
						</dt>
						<dd>
							<input name="zipCode" id="post" readonly="" value="${ dto.zipCode }" type="text">
							<button type="button" class="btn-square search-addr btn-black" style="width: 121px; padding: 0">우편번호찾기</button>
						</dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt>
							<label for="addr">주소입력</label>
						</dt>
						<dd>
							<input readonly="" name="addr" id="addr1" type="text" value="${ dto.addr }">
							<input readonly="" name="oldAddr" id="oldAddr" type="hidden" value="${ dto.addr }">
						</dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt>
							<label for="addrDetail">상세주소</label>
						</dt>
						<dd>
							<input name="addrDetail" id="addr2" value="${ dto.addrDetail != 'null' ? dto.addrDetail : ''}" type="text">
						</dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt>
							<label for="memo">배송메모</label>
						</dt>
						<dd>
							<input name="memo" id="memo" value="${ dto.memo != 'null' ? dto.memo : ''}" type="text">
						</dd>
					</dl>
				</div>
			</div>
			<div class="btn-area-right" style="border-top: 1px #e5e5e5 solid; padding-top: 20px; margin-top: 20px;">
				<button type="button" id="cancel" class="btn-default btn-white">취소하기</button>
				<button type="button" id="register" class="btn-default">저장하기</button>
			</div>
		</div>
	</div>
</form>

<%-- 		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%> --%>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function (){
        function searchPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; 		 // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                    if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                    }
                    $("#post").val(data.zonecode);
                    $("#addr1").val(data.roadAddress);

                    $("#oldAddr").val(data.autoJibunAddress || data.jibunAddress);
                    // 우편번호와 주소 정보를 해당 필드에 넣는다. (구 우편번호 data.postcode)


                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    $("#addr2").keyup();

                    //
                    // if(data.roadAddress !== ''){
                    // 	$("#detailAddress").val(extraRoadAddr);
                    // } else {
                    // 	$("#detailAddress").val('');
                    // }
                    //
                }
            }).open();
        }
        $('.search-addr').click(searchPostcode)


		$('#cancel').click(function (){
			confirmDesign("", '작업한 내용이 사라집니다. 취소 하시겠습니까?', function() {
                location.href = '/mypage/personal/address'
			});

		})
		$('#register').click(function (message){
            const formArr = $('#addressForm').serializeArray();
            let hasEmpty = false;
            var data = {}
			formArr.filter( v => v.name === 'tel')[0].value = $('input[name=_x_tel]').val();
			formArr.every(
					x => {
// 						if (x.name == 'memo') {
// 							return true;
// 						}
						if (x.name == 'oldAddr') {
							return true;
						}

						if (!x.value.trim() && !(x.name == 'memo')) {
							hasEmpty = true;
							const label = "label[for=" + x.name + "]";

							let input = '#' + x.name
							if (x.name === 'tel') input = 'input[name=_x_tel]'
							alert($('#addressForm').find(label).text() + '을(를) 입력 해주세요',
									() => $(input).focus());
							hasEmpty = true;
							return false;
						}

						if (x.name === 'tel') {
							console.log(x.value)
							if (!/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/.test(x.value)){
								hasEmpty = true;
								return alert('휴대전화 형식에 맞게 입력해주세요.',
										() => $('input[name=_x_tel]').focus())
							}

						}
						data[x.name] = x.value;
						return true;
					}
			)
			if(hasEmpty)return;

	    	var header = '${_csrf.headerName}';
			var token = '${_csrf.token}';
			
            if("${ dto.addrNo }"){
				$.ajax({
					url: "/ajax/mypage/personal/address/modify/${ dto.addrNo }" , 
					contentType: "application/json; charset=utf-8",
					dataType:"json",
					data: JSON.stringify(data),
					type:"PUT",
					cache:false ,
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success: function ( isModified,  textStatus, jqXHR ){
	                    if(  isModified ){
	                        alert('주소록이 정상적으로 수정되었습니다.',() => location.href = '/mypage/personal/address');
	                    }else {
	                        return alert('잘못된 요청입니다.');
	                    }
					},
					error:function (request, status, error){
						alert("에러~~~ ");
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
            	
            	
            	
// 				post({url:'/mypage/personal/address/modify/',param:$.param(data)},function (r){
//                     if(r.RESULT_MSG){
//                         alert('주소록이 정상적으로 수정되었습니다.',()=>location.href = '/mypage/personal/address')
//                     }else {
//                         return alert('잘못된 요청입니다.')
//                     }
// 				})
            } else {
            	console.log(data);
				$.ajax({
					url: "/ajax/mypage/personal/address/write" , 
					contentType: "application/json; charset=utf-8",
					dataType:"json",
					data: JSON.stringify(data),
					type:"POST",
					cache:false ,
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success: function ( isWritten,  textStatus, jqXHR ){
	                    if(  isWritten ){
	                        alert('주소록이 정상적으로 등록되었습니다.',() => location.href = '/mypage/personal/address');
	                    }else {
	                        return alert('잘못된 요청입니다.');
	                    }
					},
					error:function (request, status, error){
						alert("에러~~~ ");
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
            	
            	
            	
            	
//                 post({url:'/mypage/personal/address/write',param: $.param(data)},function (r){
//                     if(r.RESULT_MSG){
//                         alert('주소록이 정상적으로 등록되었습니다.',()=>location.href = '/mypage/personal/address')
//                     }else {
//                         return alert('잘못된 요청입니다.')
//                     }
//                 })
            }
		})
	})
</script>

