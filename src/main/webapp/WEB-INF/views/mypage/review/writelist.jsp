<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
    $(function () {
        $(document).on('click','.item',function (){
			let reviewImage = $(this).data("image");
	        const modal  =$('#reviewModal');
            $("#titlePlace").text($(this).data("title"));			
            modal.find('img').attr('src','/file/download'+$(this).data("image"))
	        $("#contentsPlace").text($(this).data("review"));
	        modal.find('.span-tie span:last').text($(this).data("regdate"));
	        modal.find('.foot-case').data('idx',$(this).data("idx"));
			modal.modal('show');
        })
	    $('.modify').click(function (){
            location.href = '/mypage/action/review/modify/'+$(this).parent().data('idx');
	    })
	    $('.delete').click(function (){
			const idx  =$(this).parent().data('idx');
			
			$("#reviewModal").css('z-index',1049);
			confirmDesign("", "리뷰를 삭제하시겠습니까?",function(){				
				$.get('/mypage/action/review/delete/'+idx,).done(function(data){
					$('#reviewModal').modal('hide')					
						alert('삭제되었습니다.',()=>location.reload())
				}).fail(function(data){
					alert('잘못된 요청입니다..',()=>location.reload())
				  })	
			})
	    })
    })
</script>
<div class="wrapper">
	<main class="page forum">
		<div class="container aside-layout" style="padding-bottom: 120px;">
			<div class="container">
				<div class="border-wrapper">
					<h2 class="container-title">리뷰</h2>
					<div class="page-tab">
						<a href="/mypage/action/review">작성 가능한 리뷰</a> <a class="active" href="/mypage/action/review/myWriteReview">내가 작성한 리뷰</a>
					</div>
				</div>
				<div class="page-addiction-wrapper" style="align-items: center; margin-bottom: 20px;">
					<div class="info-copy description" style="margin-top: 10px;">
						<p>
							총 <b>${fn:length(myreviewlist) }</b>건
						</p>
					</div>
				</div>
				<div class="review-list">
					<ul id="pagable-list" data-list-object="append">
						<c:forEach items="${myreviewlist }" var="dto">
							<li style="cursor: pointer" class="item" data-idx="${dto.review_no }" data-regdate="${dto.reg_date }" data-review="${dto.content }" data-image="/product/${dto.system_name }" data-title="${dto.products_name }" id="detailReview">
								<div class="thumb">
									<img src="/file/download/product/${dto.system_name }" onerror="this.src='/resources/assets/images/common/no_img.png'">
								</div>
								<div class="content">
									<h5 class="title">${dto.products_name }</h5>
									<p style="text-overflow: ellipsis; overflow: hidden; word-break: break-word; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical">${dto.content }</p>
									<div class="span-tie">
										<span>${auth.getName() }</span> <span>${dto.reg_date }</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</main>
</div>
<%@ include file="/WEB-INF/views/ui/reviewmodal.jsp"%>
