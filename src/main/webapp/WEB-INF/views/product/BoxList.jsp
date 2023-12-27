<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script type="text/javascript">
	var category_no = "${param.category}";
	$(document).on(
			"click",
			".tag-btn",
			function() {
				var idxs = [];
				$(".tag-btn.active").each(function(i, el) {
					idxs.push($(el).attr("data-idx"));
				});
				var nowIdx = $(this).attr("data-idx");

				if (idxs.includes(nowIdx)) {
					idxs.splice(idxs.indexOf(nowIdx), 1);
				} else {
					idxs.push(nowIdx);
				}
				location.replace(location.pathname + "?category=" + category_no
						+ "&tags=" + encodeURIComponent(idxs.join(",")));
			});

	$(document).ready(function() {
		$(".visual-area").fddCarousel({
			auto : 5000
		});
		$("#head-items").owlCarousel({
			items : 4,
			nav : true,
		});
		var pbtn = "${param.tags}";
		var ppbtn = pbtn.split(",");
		for (var i = 0; i < 8; i++) {
			for (var j = 0; j < 8; j++) {
				if (ppbtn[j] == $(".tag-btn").eq(i).attr("data-idx")) {
					$(".tag-btn").eq(i).addClass('active');
				}
			}
		}
	});
	$(document).ready(function() {
		$(".ico-prd-wish").click(function() {
			$("body").addClass('modal-open');
			$("#alertModal").addClass('show');
		});
		$(".ico-prd-cart").click(function() {
			$("body").addClass('modal-open');
			$("#confirmModal").addClass('show');
		});
	});
</script>
<main class="page-boxlist">
	<div id="container-wrapper" class="container-wrapper">
		<!--S: 메인 비주얼-->
		<div class="visual-area">
			<div class="controller">
				<button class="arrow left" data-carousel="prev">
					<span></span> <span></span>
				</button>
				<div class="number">
					<p data-carousel="current">1</p>
					<span></span>
					<p data-carousel="max">6</p>
				</div>
				<button class="arrow right" data-carousel="next">
					<span></span> <span></span>
				</button>
			</div>
			<div class="vis-list" data-carousel="items">
				<a class="item active" href="/product/box/734" title="제품 상세페이지로 가기" style="background-color: #111111"> <img src="/file/download/banner/ed3f2371-dd7a-48fc-844c-b68638b48431.png" alt="">
				</a> <a class="item right" href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80" title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img src="/file/download/banner/f2ef74c2-9c45-4218-84c9-ce5b1d8ace5f.png" alt="">
				</a> <a class="item right" href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80" title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img src="/file/download/banner/a4b8f03b-534c-4fc1-ae12-1cb7e697bd45.png" alt="">
				</a> <a class="item" target="_blank" href="/product/box/728" title="제품 상세페이지로 가기" style="background-color: #111111"> <img src="/file/download/banner/2227741e-b8db-4b79-8b0e-fba88ef415e7.png" alt="">
				</a>
			</div>
		</div>
		<div class="breadcrumb-style" style="padding-top: 32px; margin-bottom: 0px; background: #fff">
			<div class="container">
				<ul>
					<li><a>홈</a></li>
					<li><a href="/product/box" class="active">택배배송</a></li>

				</ul>
			</div>
		</div>
		<div class="section best-section">
			<div class="container">
				<h2 class="part-title">BEST &amp; NEW</h2>
				<div class="prd-list">
					<div id="head-items" class="owl-carousel owl-loaded owl-drag">
						<div class="owl-stage-outer">
							<div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 6170px;">
								<c:forEach var="dto" items="${bestlist }">
									<div class="owl-item active" style="width: 308.5px;">
										<div class="prd-area">
											<a href="/product/box/${dto.products_tag }?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges">
													<c:choose>
														<c:when test="${dto.event_tag eq 'BEST' and dto.event_tag2 eq null }">
															<span class="badge">${dto.event_tag }</span>
														</c:when>
														<c:when test="${dto.event_tag eq 'NEW' and dto.event_tag2 eq null }">
															<span class="badge badge-new">${dto.event_tag }</span>
														</c:when>
														<c:when test="${dto.event_tag2 ne null and dto.event_tag2 eq 'SALE' }">
															<c:if test="${dto.event_tag eq 'BEST' }">
																<span class="badge">${dto.event_tag }</span>
															</c:if>
															<c:if test="${dto.event_tag eq 'NEW' }">
																<span class="badge badge-new">${dto.event_tag }</span>
															</c:if>
															<span class="badge badge-sale">${dto.event_tag2 }</span>
														</c:when>
														<c:when test="${dto.event_tag2 ne null and dto.event_tag2 eq 'NEW' }">
															<c:if test="${dto.event_tag eq 'BEST' }">
																<span class="badge">${dto.event_tag }</span>
															</c:if>
															<c:if test="${dto.event_tag eq 'NEW' }">
																<span class="badge badge-new">${dto.event_tag }</span>
															</c:if>
															<span class="badge badge-new">${dto.event_tag2 }</span>
														</c:when>
													</c:choose>
												</div>
												<div class="thumb">
													<img src="/file/download/product/${dto.system_name }" alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title">${dto.products_name }</b>
													</div>
													<c:choose>
														<c:when test="${dto.event_price ne null and dto.event_price ne '' }">
															<div class="price-info" style="margin-bottom: 5px;">
																<b class="before-price" style="margin-bottom: 0px;">${dto.price }<span> 원</span></b> <b class="now-price">${dto.event_price }<span> 원</span></b>
															</div>
														</c:when>
														<c:otherwise>
															<div class="price-info" style="margin-bottom: 5px;">
																<b class="now-price"><fmt:formatNumber value="${dto.price }" pattern="#,###" /><span> 원</span></b>
															</div>
														</c:otherwise>
													</c:choose>
													<span class="volume">(${dto.products_size })</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<sec:authorize access="isAuthenticated()">
													<c:choose>
														<c:when test="${dto.wish_status eq 1 }">
															<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="box" class="btn-round btn-white wishlistBtn active ">
																<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
															</button>
															<button type="button" data-cart-id="${dto.products_no }" data-cart-type="box" data-cart-event="" class="btn-round addCartBtn">
																<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
															</button>
														</c:when>
														<c:otherwise>
															<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="box" class="btn-round btn-white wishlistBtn ">
																<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
															</button>
															<button type="button" data-cart-id="${dto.products_no }" data-cart-type="box" data-cart-event="" class="btn-round addCartBtn">
																<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
															</button>
														</c:otherwise>
													</c:choose>
												</sec:authorize>
												<sec:authorize access="isAnonymous()">
													<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="box" class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
													</button>
													<button type="button" data-cart-id="${dto.products_no }" data-cart-type="box" data-cart-event="" class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
													</button>
												</sec:authorize>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form id="searchForm">
			<input type="hidden" name="category_no" value="${param.category}"> <input type="hidden" name="tags" value="${param.tags }">
			<div class="cbody-wrap">
				<div class="bg-light-gray over-section" style="margin-bottom: 120px">
					<div class="container">
						<c:choose>
							<c:when test="${param.category eq null}">
								<div class="tag-place">
									<button data-idx="335" type="button" class="tag-btn item ">프레시업</button>
									<button data-idx="339" type="button" class="tag-btn item ">프레시스무디</button>
									<button data-idx="341" type="button" class="tag-btn item ">클렌즈주스</button>
									<button data-idx="485" type="button" class="tag-btn item ">양배추</button>
									<button data-idx="343" type="button" class="tag-btn item ">건강즙</button>
									<button data-idx="351" type="button" class="tag-btn item ">건강기능식품</button>
									<button data-idx="347" type="button" class="tag-btn item ">어린이</button>
								</div>
							</c:when>
							<c:when test="${param.category eq 38}">
								<div class="tag-place">
									<button data-idx="482" type="button" class="tag-btn item ">양배추</button>
									<button data-idx="481" type="button" class="tag-btn item ">케일</button>
									<button data-idx="337" type="button" class="tag-btn item ">채소섭취</button>
									<button data-idx="336" type="button" class="tag-btn item ">과채주스</button>
									<button data-idx="335" type="button" class="tag-btn item ">프레시업</button>
								</div>
							</c:when>
							<c:when test="${param.category eq 15}">
								<div class="tag-place">
									<button data-idx="340" type="button" class="tag-btn item ">과채음료</button>
									<button data-idx="339" type="button" class="tag-btn item ">프레시스무디</button>
									<button data-idx="338" type="button" class="tag-btn item ">과채주스</button>
								</div>
							</c:when>
							<c:when test="${param.category eq 8}">
								<div class="tag-place">
									<button data-idx="342" type="button" class="tag-btn item ">3일프로그램</button>
									<button data-idx="341" type="button" class="tag-btn item ">클렌즈주스</button>
								</div>
							</c:when>
							<c:when test="${param.category eq 5}">
								<div class="tag-place">
									<button data-idx="488" type="button" class="tag-btn item ">이달의제품</button>
									<button data-idx="485" type="button" class="tag-btn item ">양배추</button>
									<button data-idx="346" type="button" class="tag-btn item ">유기농즙</button>
									<button data-idx="345" type="button" class="tag-btn item ">100%</button>
									<button data-idx="344" type="button" class="tag-btn item ">과채즙</button>
									<button data-idx="343" type="button" class="tag-btn item ">건강즙</button>
								</div>
							</c:when>
							<c:when test="${param.category eq 56}">
								<div class="tag-place">
									<button data-idx="350" type="button" class="tag-btn item ">유산균</button>
									<button data-idx="349" type="button" class="tag-btn item ">유기농주스</button>
									<button data-idx="348" type="button" class="tag-btn item ">어린이음료</button>
									<button data-idx="347" type="button" class="tag-btn item ">어린이</button>
								</div>
							</c:when>
							<c:when test="${param.category eq 63}">
								<div class="tag-place">
									<button data-idx="353" type="button" class="tag-btn item ">콤부차</button>
									<button data-idx="352" type="button" class="tag-btn item ">유산균</button>
									<button data-idx="351" type="button" class="tag-btn item ">건강기능식품</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="tag-place">
									<button data-idx="335" type="button" class="tag-btn item ">프레시업</button>
									<button data-idx="339" type="button" class="tag-btn item ">프레시스무디</button>
									<button data-idx="341" type="button" class="tag-btn item ">클렌즈주스</button>
									<button data-idx="485" type="button" class="tag-btn item ">양배추</button>
									<button data-idx="343" type="button" class="tag-btn item ">건강즙</button>
									<button data-idx="351" type="button" class="tag-btn item ">건강기능식품</button>
									<button data-idx="347" type="button" class="tag-btn item ">어린이</button>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="tab-content" id="tab-content-depth2">
							<div class="prd-list-head">
								<p class="count">
									<c:choose>
										<c:when test="${param.tags ne null and param.tags > '0' }">
											총 <em>${fn:length(searchcountlist) }</em>건의 상품이 있습니다.
										</c:when>
										<c:when test="${param.category ne null }">										
											총 <em>${fn:length(searchcountlist) }</em>건의 상품이 있습니다.
										</c:when>
										<c:otherwise>
											총 <em>${fn:length(searchcountlist) }</em>건의 상품이 있습니다.
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div class="prd-list wrap" data-list-object="append" id="product-items">
								<c:forEach var="dto" items="${searchlist }">
									<div class="prd-area">
										<a href="/product/box/${dto.products_tag }?eventIdx=" title="제품 상세페이지로 가기">
											<div class="badges">
												<c:choose>
													<c:when test="${dto.event_tag eq 'BEST' and dto.event_tag2 eq null }">
														<span class="badge">${dto.event_tag }</span>
													</c:when>
													<c:when test="${dto.event_tag eq 'NEW' and dto.event_tag2 eq null }">
														<span class="badge badge-new">${dto.event_tag }</span>
													</c:when>
													<c:when test="${dto.event_tag2 ne null and dto.event_tag2 eq 'SALE' }">
														<c:if test="${dto.event_tag eq 'BEST' }">
															<span class="badge">${dto.event_tag }</span>
														</c:if>
														<c:if test="${dto.event_tag eq 'NEW' }">
															<span class="badge badge-new">${dto.event_tag }</span>
														</c:if>
														<span class="badge badge-sale">${dto.event_tag2 }</span>
													</c:when>
													<c:when test="${dto.event_tag2 ne null and dto.event_tag2 eq 'NEW' }">
														<c:if test="${dto.event_tag eq 'BEST' }">
															<span class="badge">${dto.event_tag }</span>
														</c:if>
														<c:if test="${dto.event_tag eq 'NEW' }">
															<span class="badge badge-new">${dto.event_tag }</span>
														</c:if>
														<span class="badge badge-new">${dto.event_tag2 }</span>
													</c:when>
												</c:choose>
											</div>
											<div class="thumb">
												<img src="/file/download/product/${dto.system_name }" alt="제품명">
											</div>
											<div class="prd-info">
												<div class="prd-title-wrapper">
													<b class="prd-title"> ${dto.products_name }</b>
												</div>
												<c:choose>
													<c:when test="${dto.event_price ne null and dto.event_price ne '' }">
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="before-price" style="margin-bottom: 0px;">${dto.price }<span> 원</span></b> <b class="now-price">${dto.event_price }<span> 원</span></b>
														</div>
													</c:when>
													<c:otherwise>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"><fmt:formatNumber value="${dto.price }" pattern="#,###" /><span> 원</span></b>
														</div>
													</c:otherwise>
												</c:choose>
												<span class="volume">(${dto.products_size })</span>
											</div>
										</a>
										<div class="btn-area btn-area-center">
											<sec:authorize access="isAuthenticated()">
												<c:choose>
													<c:when test="${dto.wish_status eq 1 }">
														<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="box" class="btn-round btn-white wishlistBtn active ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
														</button>
														<button type="button" data-cart-id="${dto.products_no }" data-cart-type="box" data-cart-event="" class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
														</button>
													</c:when>
													<c:otherwise>
														<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="box" class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
														</button>
														<button type="button" data-cart-id="${dto.products_no }" data-cart-type="box" data-cart-event="" class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
														</button>
													</c:otherwise>
												</c:choose>
											</sec:authorize>
											<sec:authorize access="isAnonymous()">
												<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="box" class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
												</button>
												<button type="button" data-cart-id="${dto.products_no }" data-cart-type="box" data-cart-event="" class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
												</button>
											</sec:authorize>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="button-set mb60" data-list-more="#product-items" data-param="2">
								<c:choose>
									<c:when test="${fn:length(searchcountlist)>12  }">
										<button type="button" class="basic-big-button">더보기</button>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</main>