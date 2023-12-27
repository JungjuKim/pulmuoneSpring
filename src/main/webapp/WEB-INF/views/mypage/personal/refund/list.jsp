<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



				
<div class="container">
		<div class="border-wrapper">
			<h2 class="container-title">
				환불계좌 관리
			</h2>
		</div>
		<c:choose>
			<c:when test="${ dto != null }">
				<div class="box-partition refund">
					<div class="part" style="padding-top:24px; padding-bottom:26px;">
						<ul class="document-style">
							<li>
								<label>은행명</label>
								<p>${ dto.insttName }</p>
								
							</li>
							<li>
								<label>예금주</label>
								<p>${ dto.acctOwner }</p>
								
							</li>
							<li>
								<label>계좌번호</label>
								<p>${ maskedAcctNum }</p>
								
							</li>
						</ul>
					</div>
				</div>
				<div class="btn-area-right" style="margin-top:20px; margin-right:2px;">
					<button type="button" id="delete" style="padding:0; width:140px;" class="btn-default btn-white">삭제</button>
					<a href="/mypage/personal/refund/${ dto.memberNo }" id="modify" style="padding:0; width:140px;" class="btn-default btn-default">계좌정보 변경</a>
				</div>
			</c:when>

			<c:otherwise>
				<div class="box-partition refund">
					<div class="caution-unit page">
						<span class="mark"></span>
						<p>등록된 환불계좌가 없습니다.</p>
					</div>
				</div>
				<div class="btn-area-right" style="margin-top:20px; margin-right:2px;">
					<a style="cursor: pointer; padding:0; width:140px;" href="/mypage/personal/refund/write" class="btn-default ">환불계좌 등록</a>
				</div>
			</c:otherwise>
		</c:choose>

</div>

<%-- 		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%> --%>

 	
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
    $().ready(
        function () {
        	
    		var header = '${_csrf.headerName}';
    		var token = '${_csrf.token}';
    		
			$('#delete').click(function (){
				confirmDesign("", "환불계좌를 삭제하시겠습니까?", function(){
					
				var params = null;
					$.ajax({
						url: `/ajax/mypage/personal/refund/${ dto.memberNo }` , 				
						dataType:"json",
						type:"DELETE",
						data: params,
						cache:false ,
						beforeSend: function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success: function ( deleteResult,  textStatus, jqXHR ){
							if( deleteResult ) {
				 				alert( "삭제되었습니다.", ()=>location.reload());

							} else {  
								alert("잘못된 요청입니다.", ()=>location.reload());
							}
						 
						},
						error:function (request, status, error){
							alert("에러~~~ ");
							console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						}
					});
					
				})
			})
        })
</script>
