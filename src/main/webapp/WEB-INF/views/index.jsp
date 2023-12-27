<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".visual-area").fddCarousel({
			auto : 5000
		});
		$(".event-area").fddCarousel({
			auto : 5000,
			activeClick : true
		});
		$('.prd-list.owl-carousel').owlCarousel({
			items : 4,
			nav : true,
			loop : false
		});
	});
	var owl = $('.prd-list.owl-carousel');
	owl.owlCarousel({
		onInitialize : function(element) {
			owl.children().sort(function() {
				return Math.round(Math.random()) - 0.5;
			}).each(function() {
				$(this).appendTo(owl);
			});
		},
	});
</script>

<main class="page">
	<div id="container-wrapper" class="container-wrapper">
		<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->
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
				<a class="item" href="/event/event/view?event_no=36" target="_blank" title="11월 브랜드데이" style="background-color: #ffffff"> <img src="/file/download/banner/0d3bc825-0970-4f85-9f7d-295f9d54e857.png" alt="">
				</a> <a class="item" href="/event/event/view?event_no=30" title="키즈프리 한 달 야채 프로젝트" style="background-color: #111111"> <img src="/file/download/banner/e637a24e-8db2-47f2-8f0d-68b3d62529b9.png" alt="">
				</a> <a class="item" href="/product/daily/743" title="비타맥스 엑스투" style="background-color: #ffffff"> <img src="/file/download/banner/846fc1e1-4818-4eef-80ff-94b7f47daca1.png" alt="">
				</a> <a class="item" href="/event/event/view?event_no=35" title="키즈프리 유기농 주스" style="background-color: #111111"> <img src="/file/download/banner/896f670f-2e4c-44d3-9fbd-5b823b20c679.png" alt="">
				</a> <a class="item" href="/event/event/view?event_no=33" title="풀무원녹즙 쿠폰 사용 가이드" style="background-color: #ffffff"> <img src="/file/download/banner/39447d58-8d60-4a85-b4b6-c3622ca41825.png" alt="">
				</a> <a class="item" href="/taste/taste" title="시음선물" style="background-color: #ffffff"> <img src="/file/download/banner/cf57865c-d559-4193-bce1-075b28c60a61.png" alt="">
				</a>

			</div>
		</div>
		<!--E: 메인 비주얼-->
		<!--S:로그인 전 -->
		<div class="personal-bg">
			<div class="container">
				<!--S:개인화 영역 -->
				<div class="personal-area">
					<!-- 비로그인 (https://zpl.io/6NeDXpW) -->

					<sec:authorize access="isAnonymous()">
						<div class="member-area">
							<div class="personal-login">
								<img src="/resources/assets/images/common/ico_member02.png" alt=""> <strong> <b>로그인</b>하시고 <br> <span>맞춤 서비스</span>를 누리세요!
								</strong> <a href="/member/login" class="btn-login" title="로그인하기"> 로그인하기 <i class="ico ico-arr-right6"></i>
								</a>
							</div>
						</div>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<div class="member-area" style="position: relative; overflow: visible" data-summary-view="#member_info">
							<div class="personal-info">
								<div class="user-info">
									<strong><span><sec:authentication property="principal.member.name" /></span>님 안녕하세요!</strong>
									<div class="pmenu-coupon">
										<a href="/mypage/benefit/coupon" title="해당페이지로 가기"> <span>0</span> <i class="ico"></i>
										</a>
									</div>
								</div>
								<c:choose>
									<c:when test="${drkOrderMypageList[0].drk_order_no ne null and drkOrderMypageList[0].drk_order_no ne ''  }">
										<div class="billing-area">
											<div class="billing-prd">
												<b>${drkOrderMypageList[0].drk_order_name }</b>
												<div class="prd-link">
													<button type="button" data-toggle-view="#customer-num-view">
														<i class="ico"></i> <span class="hide">고객번호 확인하기</span>
													</button>
													<div id="customer-num-view" class="customer-info" style="display: none;">
														<em>고객번호</em> <span>${drkOrderMypageList[0].drk_order_no }</span> <a href="/mypage/drink/drink" class="button" type="button">변경</a>
													</div>
												</div>
											</div>
											<ul>
												<li><span>12월 청구예정 금액</span> <b class="now-price">62,100<span> 원</span></b></li>
												<li><span>실시간 금액</span> <b class="now-price">32,700<span> 원</span></b></li>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<div class="billing-area">
											<div class="billing-prd" style="min-height: 40px; margin-bottom: 15px"></div>
											<div class="tasting-btn">
												<span>시음 선물로 풀무원녹즙을 경험해 보세요.</span> <a href="/taste/taste" class="button btn-default">시음 선물하기</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</sec:authorize>

					<!--S:개인화 메뉴-->
					<ul class="personal-menu" data-summary-view="#member_menu">
						<li class="item"><a href="/mypage/drink/drink" title="해당페이지로 가기" data-require-login="">
								<div class="cover">
									<i class="ico ico-personal-01"></i>
								</div> <span>음용내역보기</span>
						</a></li>
						<c:choose>
							<c:when test="${drkOrderMypageList[0].drk_order_no ne null and drkOrderMypageList[0].drk_order_no ne ''  }">
								<li class="item"><a href="/mypage/order/daily/change/${drkOrderMypageList[0].drk_order_no }" data-require-login="">
										<div class="cover">
											<i class="ico ico-personal-02"></i>
										</div> <span>음용상품변경</span>
								</a></li>
								<li class="item"><a href="/mypage/drink/drink/pause/${drkOrderMypageList[0].drk_order_no }" data-require-login="">
										<div class="cover">
											<i class="ico ico-personal-03"></i>
										</div> <span>배송일정변경</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="item"><a href="/mypage?with=01" data-require-login="">
										<div class="cover">
											<i class="ico ico-personal-02"></i>
										</div> <span>음용상품변경</span>
								</a></li>
								<li class="item"><a href="/mypage?with=01" data-require-login="">
										<div class="cover">
											<i class="ico ico-personal-03"></i>
										</div> <span>배송일정변경</span>
								</a></li>
							</c:otherwise>
						</c:choose>
						<li class="item"><a href="/mypage/product/list" data-require-login="">
								<div class="cover">
									<i class="ico ico-personal-04"></i>
								</div> <span>찜한상품</span>
						</a></li>
					</ul>
				</div>
				<!-- // 비로그인 (https://zpl.io/6NeDXpW) -->
				<!--E:개인화 영역 -->
				<!--S:추천제품-->
				<div class="recommend-area section-area">
					<h2 class="section-area-title">추천 상품</h2>
					<div class="prd-list owl-carousel owl-loaded owl-drag" style="margin: 0px;">
						<div class="owl-stage-outer">
							<div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 6170px;">
								<c:forEach items="${mainbestlist }" var="dto" varStatus="status">
									<div class="owl-item active" style="width: 308.5px;">
										<div class="prd-area">

											<a href="/product/${dto.delivery_type}/${dto.products_tag }?eventIdx=" title="제품 상세페이지로 가기">
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
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"><fmt:formatNumber value="${dto.price }" pattern="#,###" /><span> 원</span></b>
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
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!--E:추천제품-->
			</div>
		</div>
		<!--S:띠배너 슬라이드-->
		<div class="banner-area survey">
			<div class="banner-list">
				<a class="item" href="/customer/product" title="해당 페이지로 가기" style="background-color: #4d54e7"> <img src="/resources/assets/images/contents/banner_item01.jpg"> <span class="hide">어떤 녹즙을 드셔야 할까요? 간단한 설문을 통해 풀무원녹즙이 제안하는 추천 프로그램을 확인해 보세요 설문 시작하기</span>
				</a>
			</div>
		</div>
		<!--E:띠배너 슬라이드-->
		<!--E:이벤트 슬라이드-->
		<div class="bg-w">
			<div class="container">
				<div class="event-area section-area">
					<h2 class="section-area-title title-more-btn">
						녹즙 시음을 선물해보세요! <a href="/taste/taste" class="btn-more"> 전체보기 <i class="ico ico-arr-right6"></i>
						</a>
					</h2>
					<div class="event-list" data-carousel="items">
						<a class="item" href="/taste/taste?pkgIdx=56" title="베스트 녹즙"> <img src="/file/download/banner/4d1a4dd5-821c-41db-a0d6-3535adb53a8e.png" alt="">
						</a> <a class="item " href="/taste/taste?pkgIdx=54" title="건강한 한 끼"> <img src="/file/download/banner/b9842c83-f89d-4687-8351-c71beeba16e4.png" alt="">
						</a> <a class="item " href="/taste/taste?pkgIdx=53" title="아이사랑"> <img src="/file/download/banner/57d7c4a5-9e5f-4158-9067-f8e2746a2ee8.png" alt="">
						</a> <a class="item " href="/product/daily?743" title="이달의 녹즙(비타맥스 엑스투)"> <img src="/file/download/banner/c4f1a598-5bf4-4cb9-9acf-c733f86d3faf.png" alt="">
						</a> <a class="item" href="/taste/taste?pkgIdx=58 " title="융복합"> <img src="/file/download/banner/ba6cd618-ea64-4c9e-a6ed-18186f895d6b.png" alt="">
						</a>
					</div>
					<ul class="event-list-dot" data-carousel="dot">
						<li class=""></li>
						<li class=""></li>
						<li class=""></li>
						<li class=""></li>
						<li class=""></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="gray-line-bg">
			<div class="container">
				<div class="price-area section-area">
					<!--S:쿠폰 영역-->
					<div class="coupon-guide section-area">
						<div class="coupon-area">
							<a href="/event/event/view?event_no=1" title="해당 페이지로 가기">
								<div>
									<strong>가입혜택</strong> <b>3,6,9 쿠폰 증정</b> <span>음용할수록 늘어나는 혜택! <br>3,6,9개월마다 쿠폰증정, 시음선물까지
									</span>
								</div> <img src="/resources/assets/images/contents/coupon_item01.png" alt="가입혜택">
							</a> <a href="/event/event/view?event_no=2" title="해당 페이지로 가기">
								<div>
									<strong>친구초대</strong> <b>친구 초대 쿠폰 증정</b> <span>풀무원녹즙에 친구를 초대하면 <br>나도 친구도 5천원씩 쿠폰 증정
									</span>
								</div> <img src="/resources/assets/images/contents/coupon_item02.png" alt="친구초대">
							</a>
						</div>
						<div class="guide-area">
							<a href="/forum/faq/list" title="해당 페이지로 가기" class="bg-green"> <span>풀무원녹즙 <br>고객기쁨센터
							</span> <img src="/resources/assets/images/ui/ico-bag01.png" alt="">
							</a> <a href="/forum/franchise/search" title="해당 페이지로 가기" class="bg-purple"> <span>매일배송 <br>가능지역검색
							</span> <img src="/resources/assets/images/ui/ico-map01.png" alt="">
							</a>
						</div>
					</div>
					<!--E:쿠폰 영역-->
				</div>
			</div>
		</div>
		<!--S:공지사항, 고객센터, 배달가능지역검색-->
		<div class="notice-area">
			<div class="container">
				<div class="notice-cont">
					<h2 class="sub-h2">공지사항</h2>
					<ul>
						<li><a href="/forum/notice/view?seq=${noticelist[0].notice_no }" title="해당 게시글로 가기">${ noticelist[0].title }</a></li>
					</ul>
				</div>
				<a href="/forum/notice/list" class="btn-more" title="해당 페이지로 가기"> <i class="ico ico-more"></i>
				</a>
			</div>
		</div>
	</div>
</main>
