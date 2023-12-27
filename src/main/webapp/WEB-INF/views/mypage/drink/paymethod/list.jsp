<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				
<div class="container">

	<div class="border-wrapper">
		<h2 class="container-title">
			결제수단 관리
		</h2>
	</div>
	
	<div class="page-addiction-wrapper">
		<div class="info-copy description" style="margin-top:7px; margin-bottom:7px;">
			<p style="padding-left:3px;">총 <b>${ dtoCount }</b>건</p>
		</div>
	</div>
	
	<c:if test="${ dtoCount == 0 }">
		<div class="caution-unit page">
			<span class="mark"></span>
			<p>음용 정보가 없습니다.</p>
		</div>
	</c:if>
	
	<div class="drinking-list payment">
		
	</div>
	
	<div class="button-set">
		<button type="button" id="moreBtn" class="basic-big-button">더보기</button>
	</div>
</div>

<%-- 		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%> --%>

<script type="text/javascript">
    var search = ${ pagingInfo }
    $().ready(
        function () {
            //    region render
            const rootEl = $('.drinking-list')
//             var search ={"memberId":"show2891","endNum":10,"startNum":1,"drinkingType":"Y","orderNums":["18369285571027001056"]}

            
            
            var data ={"data": ${ dtoList } }.data
			if(data != null) {
	           data.forEach((v, i) => {
	               addItem(v,i)
	           })
			}
            
//             data.forEach((v, i) => {
//                 addItem(v,i)
//             })
            
	    	var header = '${_csrf.headerName}';
			var token = '${_csrf.token}';


            var totalCnt = 0;
            function addItem(v,i) {
                const el = $(`
				<div class="item">
					<div class="head">
						<div class="nickname-format xl">
							${v.defaultYn=='Y'?'<label>기본</label>':''}
							<h5 style="font-size:20px; margin-right:9px;">\${v.drkOrderName}</h5>
							<span>\${v.drkOrderNo?v.drkOrderNo:''}</span>
						</div>
						<ul class="info">
							<li>
								<label>담당가맹점</label>
								<p>\${v.fcName}</p>
							</li>
							<li>
								<label>가맹점 연락처</label>
								<ul class="addiction-info">
									<li class="tel">
										<label></label>
										<p data-call-text>\${v.fcTel}</p>
									</li>
									<li class="phone">
										<label></label>
										<p data-call-text>\${v.fcPhone}</p>
									</li>
								</ul>
							</li>
							<li>
								<label>결제수단</label>
								<p class="payMethod">현장결제</p>
							</li>
						</ul>
					</div>
					<div class="tail">


					</div>
				</div>`)

                let payMethod = '';
//                 let payMethod = "${ v.drkPayMethod == 0 ? '카드 자동결제' : v.drkPayMethod == 1 ? '계좌 자동이체' : '현장결제'}";
//                 switch (v.phiCustomerVo.rceitKndCd) {
                switch (v.drkPayMethod) {
                    case 1 :
                        payMethod = '계좌 자동이체';
                        if (v.bankName) {
                            payMethod += `(\${v.bankName})`
                        }
                        break;
                    case 0 :
                        payMethod = '카드 자동결제';
//                         if (v.cardName) {
//                             payMethod += `(\${v.cardName})`
//                         }
                        break;
                    case '10':
                        break;
                    case undefined:
                        break;
                    default:
                        payMethod = '현장결제';
                }
                el.find('.payMethod').text(payMethod);
                
                if(v.drkPayStatus != 2){
                    el.find('.tail').append($(`<a href="/mypage/drink/paymethod/cust/\${v.drkOrderNo}/\${v.fcNo}" class="rounded-button">변경신청</a>`))
                } else {
                    el.find('.tail').append($(`<p>현재 결제 수단 변경이 불가합니다. 익일(영업일 기준) 낮 12시 이후 재확인해주세요.</p>`))
                }
                
// 	            if(!v.phiCustomerVo.resultMsg||[
//                     '일부출금완료',
//                     '전액출금완료',
//                     '완납고객',
//                     '신규승인',
//                     '신규미승인',
//                     '변경접수예정',
//                     '변경승인',
//                     '변경미승인',
//                     '해지접수예정',
//                     '해지승인',
//                     '해지미승인'
// 	            ].includes(v.phiCustomerVo.resultMsg)){
//                     if(v.isPay){
//                         if(v.phiCustomerVo.intfacId =='0'){
//                             el.find('.tail').append($(`<a href="/mypage/drink/paymethod/cust/\${v.drkOrderNo}/\${v.fcNo}" class="rounded-button">변경신청</a>`))
//                         }
//                     }else {
//                       el.find('.tail').append($(`<p>현재 결제 수단 변경이 불가합니다.
// 익일(영업일 기준) 낮 12시 이후 재확인해주세요.</p>`))
//                     }
// 	            }else {
//                   el.find('.tail').append($(`<p>현재 결제 수단 변경이 불가합니다.
// 익일(영업일 기준) 낮 12시 이후 재확인해주세요.</p>`))
//                 }


                el.prop('data', v);
                rootEl.append(el);

                if (rootEl.children().length >= ${ dtoCount }) {
                    $('#moreBtn').remove();
                }
            }
            //    endregion       
            
	        if (${dtoCount} == 0) {
	            $('#moreBtn').remove();
	        }
            

	    //    region pagination
	    
            $('#moreBtn').click(function () {
            	
    			$.ajax({
    				url: "/ajax/mypage/drink/paymethod/more" , 
    				contentType: "application/json; charset=utf-8",
    				dataType:"json",
    				data: search,
    				type:"GET",
    				cache:false ,
    				beforeSend: function(xhr) {
    					xhr.setRequestHeader(header, token);
    				},
    				success: function ( response,  textStatus, jqXHR ){
    					
    	                response.data.forEach(v => addItem(v));
    	                search = response.search;
    	                
    					if( !data ) {
    						alert('잘못된 요청입니다.')
    					}				 
    				},
    				error:function (request, status, error){
    					alert("에러~~~ ");
    					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    				}
    			});	
            	
            })


            $(this).find("[data-call-text]").callText();
	    //    endregion
        });
</script>
