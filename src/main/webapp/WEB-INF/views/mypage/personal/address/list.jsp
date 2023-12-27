<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		
		
			<div class="container">

				<div class="border-wrapper">
					<h2 class="container-title">
						주소록
					</h2>
				</div>
				<div class="page-addiction-wrapper" style="align-items: center; margin-bottom:10px;">
					<div class="info-copy description">
						<p>총 <b>${ dtoCount }</b>건</p>
					</div>
					<a href="/mypage/personal/address/write" class="rect-button primary">주소록 등록</a>
				</div>
				<c:if test="${ dtoCount == 0 }">
					<div class="caution-unit page">
						<span class="mark"></span>
						<p>등록된 주소록이 없습니다.</p>
					</div>
				</c:if>
				
				<div class="drinking-list">

				</div>
				
				<div class="button-set">
					<button type="button" id="moreBtn" class="basic-big-button">더보기</button>
				</div>
			</div>


<%-- 		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%> --%>

<script>
    var search = ${ pagingInfo };
	$(function (){
        //region render data

        const rootEl = $('.drinking-list');
        
        var data = { "data" : ${dtoList} }.data;

		if(data != null) {
	        data.forEach((v, i) => {
	            addItem(v);
	        })
		}
        
        
    	var header = '${_csrf.headerName}';
		var token = '${_csrf.token}';


		$(document).on('click','.setDefault',function (){
            const data = $(this).closest('.item').prop('data')
			confirmDesign("", "기본주소로 설정하시겠습니까?", function() {
				$.ajax({
					url: "/ajax/mypage/personal/address/setBasic" , 
					dataType:"json",
					data: { addrNo : data.addrNo },
					type:"PUT",
					cache:false ,
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success: function ( isUpdated,  textStatus, jqXHR ){
						if( isUpdated ) {
			 				alert( "기본주소로 설정되었습니다.", () => location.reload());

						} else {  
							alert('잘못된 요청입니다.',()=>location.reload())
						}
					 
					},
					error:function (request, status, error){
						alert("에러~~~ ");
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
				

//                 post({url:'/mypage/personal/address/setBasic',param:$.param({idx:data.addrNo})},function (r){
//                     if(r.RESULT_MSG){
// 						alert('기본주소로 설정되었습니다.',()=>location.reload())
//                     }else {
// 						alert('잘못된 요청입니다.',()=>location.reload())
//                     }
//                 })
            })
		})
		$(document).on('click','.modify',function (){
            const data = $(this).closest('.item').prop('data')
			location.href= '/mypage/personal/address/'+ data.addrNo
		})
		
		$(document).on('click','.delete',function (){
            const data = $(this).closest('.item').prop('data')
			confirmDesign("", "선택한 주소를 삭제하시겠습니까?", function() {
				$.ajax({
					url: "/ajax/mypage/personal/address" , 
					dataType:"json",
					data: { addrNo : data.addrNo },
					type:"DELETE",
					cache:false ,
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success: function ( isDeleted,  textStatus, jqXHR ){
						if( isDeleted ) {
			 				alert( "삭제되었습니다.", () => location.reload());

						} else {  
							alert('잘못된 요청입니다.',()=>location.reload())
						}
					 
					},
					error:function (request, status, error){
						alert("에러~~~ ");
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
// 				post({url:'/mypage/personal/address/delete',param:$.param({addressIdx:data.addrNo})},function (r){
//                     if(r.RESULT_MSG){
//                         alert('삭제되었습니다.',()=>location.reload())
//                     }else {
// 						alert('잘못된 요청입니다.',()=>location.reload())
//                     }
			})
		})

        function addItem(v) {
            const el = $(`<div class="item">
				<div class="head">
					<div class="nickname-format xl">
						\${ v.defaultAddr=='1'?'<label>기본</label>':''}
						<h5>\${v.addrName}</h5>
						<span>(\${v.dest=='1'?'회사/사무실':'가정'})</span>
					</div>
					<ul class="info">
						<li>
							<p>\${v.name}</p>
						</li>
						<li>
							<p>\${v.tel}</p>
						</li>
						<li>
							<p>(\${v.zipCode}) \${v.addr} \${v.addrDetail}</p>
						</li>
					</ul>
				</div>
				<div class="tail">
					<button type="button" disabled class="setDefault rounded-button disabled">기본설정</button>
					<div class="button-text-set">
						<button type="button" class="modify">수정</button>
						<button type="button" class="delete">삭제</button>
					</div>
				</div>
			</div>`);

	        el.prop('data',v);
            if(v.defaultAddr == '0'){
                el.find('.setDefault').prop('disabled',false)
                el.find('.setDefault').removeClass('disabled')
                el.find('.setDefault').css('cursor','pointer')
            }


            rootEl.append(el);
            if (rootEl.children().length >= ${dtoCount}) {
                $('#moreBtn').remove();
            }
        }
        if (${dtoCount} == 0) {
            $('#moreBtn').remove();
        }

            
            

        $('#moreBtn').click(function () {

			$.ajax({
				url: "/ajax/mypage/personal/address/more" , 
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
        
//             more('/mypage/personal/address/more', search, function (response) {
//                 response.data.forEach(v => addItem(v));
//                 search = response.search
//             });
        })
        //    endregion
	})
</script>
