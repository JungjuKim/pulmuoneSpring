<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	$(document).on("click", ".productMove", function(e) {
		let idx = $(this).data('idx')
		let goodType = $(this).data('goodtype')
		location.href = '/product/' + goodType + "/" + idx;
	})
</script>
<div class="wrapper">
	<main class="page forum">
		<div class="container aside-layout" style="padding-bottom: 120px;">
			<div class="container">
				<div class="border-wrapper">
					<h2 class="container-title">리뷰</h2>
					<div class="page-tab">
						<a class="active" href="/mypage/action/review">작성 가능한 리뷰</a> <a href="/mypage/action/review/myWriteReview">내가 작성한 리뷰</a>
					</div>
				</div>
				<div class="page-addiction-wrapper" style="align-items: center; margin-bottom: 20px;">
					<div class="info-copy description" style="margin-top: 10px;">
						<p>
							총 <b>${fn:length(reviewlist) }</b>건
						</p>
					</div>
				</div>
				<c:choose>
					<c:when test="${fn:length(reviewlist) ne 0 }">
						<div class="box-partition">
							<div class="drinkchange-list review">
								<ul>
									<c:forEach items="${reviewlist }" var="dto">
										<li><a class="item productMove" data-idx="${dto.products_tag }" data-goodtype="${dto.delivery_type }" data-issale="Y" style="cursor: pointer">
												<div class="thumb">
													<img src="/file/download/product/${dto.system_name }" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="">
												</div>
												<div class="contents">
													<p class="prd-title title">${dto.products_name }</p>
													<b class="price">${dto.price }<span class="unit-section">원 (${dto.products_size })</span>
													</b>
												</div>
										</a>
											<div class="button-area">
												<a href="/mypage/action/review/write/${dto.products_no }" class="btn-default write btn-white">리뷰작성</a>
											</div></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="caution-unit page">
							<span class="mark"></span>
							<p>작성 가능한 리뷰가 없습니다.</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</main>
</div>
