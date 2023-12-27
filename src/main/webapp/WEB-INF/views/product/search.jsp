<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrapper">
	<main class="page">
		<div id="container-wrapper" class="container-wrapper">
			<script type="text/javascript">
				function searchProduct(keyword) {
					$("input[name=searchKeyword]").val("");
					$("input[name=recommendKeyword]").val("");
					if (keyword != undefined) {
						$("input[name=recommendKeyword]").val(keyword);
					}
					$("#searchForm").submit();
				}
				$().ready(function() {
					$("#searchKeyword").focus();
					// 검색
					$(".btn-square").click(function() {
						movePage(1);
					});
					$("#searchKeyword").keyup(function(e) {
						if (e.keyCode == 13) {
							movePage(1);
						}
					});
				});
			</script>
			<form id="searchForm">
				<input type="hidden" name="recommendKeyword" value=""> <input type="hidden" name="tagRecommendKeyword" value=""> <input type="hidden" name="tagSearchKeyword" value=""> <input type="hidden" name="gaRecommendKeyword" value=""> <input type="hidden" name="gaSearchKeyword" value="">
				<!--S:cbody-->
				<div class="coupon-srch product-srch" style="border-bottom: 0; padding-bottom: 0;">
					<div class="form-input none-dt">
						<dl>
							<dt>
								<label>검색</label>
							</dt>
							<dd>
								<c:choose>
									<c:when test="${(param.recommendKeyword ne null and param.searchKeyword eq null) or (param.recommendKeyword ne '' and param.searchKeyword eq '') }">
										<input placeholder="검색어를 입력해주세요." title="검색어 입력" id="searchKeyword" name="searchKeyword" value="${param.recommendKeyword }">
										<a href="javascript:void(0);" class="btn-square">검색11</a>
									</c:when>									
									<c:otherwise>
										<input placeholder="검색어를 입력해주세요." title="검색어 입력" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}">
										<a href="javascript:void(0);" class="btn-square">검색22</a>
									</c:otherwise>
								</c:choose>
							</dd>
						</dl>
					</div>
					<div class="tag-place sm">
						<a class="item" href="javascript:void(0);" onclick="searchProduct('케일');">케일</a> <a class="item" href="javascript:void(0);" onclick="searchProduct('양배추');">양배추</a> <a class="item" href="javascript:void(0);" onclick="searchProduct('어린이');">어린이</a> <a class="item" href="javascript:void(0);" onclick="searchProduct('유산균');">유산균</a> <a class="item" href="javascript:void(0);" onclick="searchProduct('이달의제품');">이달의제품</a>
					</div>
				</div>
				<div class="container">
					<div class="list-area" style="padding-bottom: 60px; padding-top: 30px;">
						<div class="list-head center" style="margin-bottom: 47px">
							<c:choose>
								<c:when test="${(param.recommendKeyword ne null and param.searchKeyword eq null) or (param.recommendKeyword ne '' and param.searchKeyword eq '') }">
									<em class="count"> <span>‘${param.recommendKeyword}’</span> 관련 검색결과 총 <span>${fn:length(searchcountlist) }</span>건
									</em>
								</c:when>							
								<c:otherwise>
									<em class="count"> <span>‘${param.searchKeyword}’</span> 관련 검색결과 총 <span>${fn:length(searchcountlist) }</span>건
									</em>
								</c:otherwise>
							</c:choose>
						</div>
						<!--S : 데이터 있는 경우-->
						<!--S: prd-list -->
						<c:choose>
						<c:when test="${fn:length(searchcountlist) ne 0 }">
						<div class="prd-list wrap">
							<c:forEach items="${list}" var="dto">
								<div class="prd-area">
									<a href="/product/daily/${dto.products_tag }?eventIdx=" title="제품 상세페이지로 가기">
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
											<img src="/file/download/product/${dto.system_name }" onerror="this.src='/resources/assets/images/common/no_img.png'" alt="제품명">
										</div>
										<div class="prd-info">
											<div class="prd-title-wrapper">
												<b class="prd-title">${dto.products_name }</b>
											</div>
											<div class="price-info" style="margin-bottom: 5px;">
												<b class="now-price"><fmt:formatNumber value="${dto.price }" pattern="#,###" /><span> 원</span> </b>
											</div>
											<span class="volume">(${dto.products_size })</span>
										</div>
									</a>
									<div class="btn-area btn-area-center">
										<c:if test="${ auth.getName() ne null }">
											<c:choose>
												<c:when test="${dto.wish_status eq 1 }">
													<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="daily" class="btn-round btn-white wishlistBtn active ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
													</button>
													<button type="button" data-cart-id="${dto.products_no }" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
													</button>
												</c:when>
												<c:otherwise>
													<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
													</button>
													<button type="button" data-cart-id="${dto.products_no }" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
													</button>
												</c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${ auth.getName() eq null }">
											<button type="button" data-wish-id="${dto.products_tag }" data-wish-type="daily" class="btn-round btn-white wishlistBtn ">
												<i class="ico ico-prd-wish"></i> <span class="hide">제품 찜하기</span>
											</button>
											<button type="button" data-cart-id="${dto.products_no }" data-cart-type="daily" data-cart-event="" class="btn-round addCartBtn">
												<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에 담기</span>
											</button>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
						</c:when>
						<c:otherwise>
						<div class="caution-unit page">
							<span class="mark"></span>
							<p>
								검색 결과가 없습니다. <br>추천검색어로 검색해 보세요.
							</p>
						</div>
						</c:otherwise>
						</c:choose>
						<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
							<input type="hidden" id="pageNo" name="pageNo">
							<ul class="pagination">
								<c:choose>
									<c:when test="${fn:length(searchcountlist)%12 eq 0 }">
										<c:forEach begin="1" end="${fn:length(searchcountlist)/12}" step="1" var="i">
											<c:choose>
												<c:when test="${ i eq param.pageNo }">
													<li class="page-item active"><a class="page-link active" data-param="${i }">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" data-list-more="#pagable-list" data-param="${i }">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach begin="1" end="${fn:length(searchcountlist)/12+1 }" step="1" var="i">
											<c:choose>
												<c:when test="${ i eq param.pageNo}">
													<li class="page-item active"><a class="page-link active" data-param="${i }">${i }</a></li>
												</c:when>
												<c:when test="${ i eq 1 and param.pageNo eq null}">
													<li class="page-item active"><a class="page-link active" data-param="${i }">${i }</a></li>
												</c:when>
												<c:when test="${i eq 1 and param.recommendKeyword ne null}">
													<li class="page-item active"><a class="page-link active" data-param="${i }">${i }</a></li>
												</c:when>
												<c:when test="${i eq 1 and param.searchKeyword ne null}">
													<li class="page-item active"><a class="page-link active" data-param="${i }">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" data-list-more="#pagable-list" data-param="${i }">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
						<!--E: prd-list -->
					</div>
				</div>
				<!--E:cbody-->
			</form>
		</div>
	</main>
</div>
<script>
console.log(location.pathname);
	$(".pagenavi-area .pagination .page-item a").click(function() {
		let aparam = $(this).data("param");
		location.replace(location.pathname + "?pageNo=" + aparam);		
	});
</script>
