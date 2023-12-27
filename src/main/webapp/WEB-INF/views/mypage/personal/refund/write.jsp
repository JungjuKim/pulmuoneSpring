<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


				
			<div class="container">
			
		      <div class="border-wrapper">
		        <h2 class="container-title">
		          환불계좌 등록
		        </h2>
		      </div>
		      <form id="accountForm">
		      <div style="width:640px;">
		        <div class="input-group">
		          <div class="form-input select">
		            <dl>
		              <dt style="padding-left:20px;">
		                <label for="input01">은행명</label>
		              </dt>
		              <dd>
		                <div class="dropdown">
		                  <a class="btn dropdown-toggle" id="bankCode" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
		                    은행명을 선택하세요
		                  </a>
		                  <div style="max-height: 200px;overflow-y: scroll" class="dropdown-menu">
			                <c:forEach items="${ insttDtoList }" var="insttDto">
								<a class="dropdown-item" data-value="${ insttDto.insttCode }">${ insttDto.insttName }</a>
			                </c:forEach>
		                  </div>
		                </div>
		              </dd>
		              <input type="hidden" id="insttCode" name="insttCode" value="${ dto.insttCode }">
		            </dl>
		          </div>
		          <div class="form-input">
		            <dl>
		              <dt style="padding-left:20px;">
		                <label for="accountHolder">예금주</label>
		              </dt>
		              <dd>
		                <input type="text" value="${ dto.acctOwner }" name="acctOwner" id="acctOwner">
		              </dd>
		            </dl>
		          </div>
		          <div class="form-input">
		            <dl>
		              <dt style="padding-left:20px;">
		                <label for="bankAccount">계좌번호</label>
		              </dt>
		              <dd>
		              	<input type="hidden" value="${ dto.acctNum }">
		                <input value="${ dto.acctNum }" class="numberOnly" type="number" name="acctNum" id="acctNum">
		                <button type="button" id="verify" class="btn-square btn-black">계좌인증</button>
		              </dd>
		            </dl>
		          </div>
		
		        </div>
		        <div style="margin-top:61px;">
		          <label class="check-type" style="margin-bottom:19px;">
		            <input type="checkbox" name="agree">
		            <span>성명, 은행명,계좌번호를 환불 목적으로수집, 5년간 처리에 동의</span>
		          </label>
		        </div>
		        <div class="alert-area lg between" style="padding-top:38px;">
		          <h4 style="margin-bottom:17px;">주의사항</h4>
		          <ul>
		            <li>
		              무통장입금 또는 핸드폰결제 후 주문 취소 시 등록하신 무통장 계좌로 환불해드립니다. (단, 본인 명의의 계좌만 가능)
		            </li>
		            <li>
		              환불대기중 상품은 등록하신 환불계좌로 환불됩니다.
		            </li>
		          </ul>
		        </div>
		        <div class="btn-area-right" style="margin-top:20px;">
		          <button type="button" style="padding:0; width:140px;" id="cancel" class="btn-default btn-white">취소</button>
		          <button type="button" style="padding:0; width:140px;" id="register" class="btn-default btn-default">등록</button>
		        </div>
		      </div>
		      </form>
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

<script type="text/javascript">
  $().ready(function () {

    //region dropdown
    $('.dropdown-item').click(function () {
      const select = $('#bankCode');
      select.text($(this).text());
      select.data('value', $(this).data('value'));
      $('#verify').prop('v', false);
      $('#verify').text('계좌인증');
      $('#verify').prop('disabled', false);
    });

    // 현재 회원의 환불계좌 기관코드를 자동 선택
    if ("${ dto.insttCode }" != null) {
	    $('.dropdown-item[data-value="${ dto.insttCode }"]').click();
   	}

    //endregion

    //region cancel
    $('#cancel').click(function () {

	    confirmDesign("", "작업한 내용이 사라집니다. 취소 하시겠습니까?",function(){
		    location.href = '/mypage/personal/refund'
	    });

    });
    //endregion

    
    //region form

    function checkForm() {
      const accountForm = $('#accountForm').serializeObject();
      accountForm.insttCode = $('#bankCode').data('value')

      if (!accountForm.insttCode) {
        alert('은행명을 선택하세요')
        $('#bankCode').click();
        return false;
      }

      if (!accountForm.acctOwner.trim()) {
        alert('예금주를 입력해주세요')
        $('#acctOwner').focus()
        return false;
      }
      if (!accountForm.acctNum.trim()) {
        alert('계좌번호를 입력해주세요')
        $('#acctNum').focus()
        return false;
      }
      return accountForm;
    }

    $('#register').click(function () {
	    const data = checkForm();

		var header = '${_csrf.headerName}';
		var token = '${_csrf.token}';
      
      if (data) {
        if (!$('#verify').prop('v')) return alert('계좌인증을 진행해주세요')
        if ($('input[name=agree]:checked').length === 0) {
        	return alert('개인정보 수집 이용약관에 동의해주세요');
        }
	    var params = null;
	    params = JSON.stringify($("#accountForm").serializeObject());
        if (`${ dto }` != '') {
			$.ajax({
				url: `/ajax/mypage/personal/refund/${ dto.memberNo }` , 
				contentType: "application/json; charset=utf-8",
				dataType:"json",
				data: params,
				type:"PUT",
				cache:false ,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
					console.log(params);
				},
				success: function ( modifyResult,  textStatus, jqXHR ){
					if( modifyResult ) {
		 				alert( "환불계좌가 정상적으로 수정되었습니다.", ()=>{location.href='/mypage/personal/refund'});

					} else {  
						alert("잘못된 요청입니다.");
					}
				 
				},
				error:function (request, status, error){
					alert("에러~~~ ");
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
        	
//           post({url: '/mypage/personal/refund/1601', param: $.param(data)},
//                   function (r) {
//                     if (r.RESULT_MSG) {
//                       alert('환불계좌가 정상적으로 수정되었습니다.',
//                               () => location.href = '/mypage/personal/refund')
//                     } else {
//                       return alert('잘못된 요청입니다.')
//                     }
//                   })
        } else {
			$.ajax({
				url: `/ajax/mypage/personal/refund/${ memberNo }` , 
				contentType: "application/json; charset=utf-8",
				dataType:"json",
				data: params,
				type:"POST",
				cache:false ,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
					console.log(params);
				},
				success: function ( writeResult,  textStatus, jqXHR ){
					if( writeResult ) {
		 				alert( "환불계좌가 정상적으로 등록되었습니다.", ()=>{location.href='/mypage/personal/refund'});

					} else {  
						alert("잘못된 요청입니다.");
					}
				 
				},
				error:function (request, status, error){
					alert("에러~~~ ");
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
        	
        }
      }
    })

    $('input[type=text]').on('change , keyup', function () {
      $('#verify').prop('v', false);
      $('#verify').text('계좌인증')
      $('#verify').prop('disabled', false)
    })
    //  endregion

    //  region verify
//     $('#verify').click(function () {
//       $("#insttCode").val($('#bankCode').data('value'));
//       var el = $(this)
//       if (!el.prop('v')) {
//         const data = checkForm();
//         if (data) {
//           post({url: '/mypage/personal/refund/verify', param: $.param(data)}, function (r) {
//             if (r.RESULT_MSG) {
//               el.text('인증완료')
//               el.prop('disabled', true)
//               el.prop('v', true);
              
//             } else {
//               alert('계좌인증에 실패하였습니다. 다시 시도해주세요.')
//             }
//           })
//         }
//       }
//     })

    //  endregion
  });

</script>


<script>
	$("#verify").on("click", function() {
		var el = $(this);
		alert("인증되었습니다.");		
		$("#insttCode").val($('#bankCode').data('value'));
		el.text('인증완료')
        el.prop('disabled', true)
        el.prop('v', true);
	});


</script>
