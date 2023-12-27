<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script>
	var formatter = new Intl.NumberFormat();
	var days = ["A", "B", "C", "D", "E"];
	var itemType = "daily";
	var itemCode = "${list[0].products_no}";
	var eventIdx = "";
	$(document).ready(function () {
        document.addEventListener("contextmenu", function (e){
            e.preventDefault();
        }, false);

		//region 리스트 이미지
		$('.sub-thumb li button').click(function () {
			const src = $(this).find('img').attr('src')
			$(this).parent().addClass('active').siblings().removeClass('active')
			$('.main-thumb').find('img').attr('src', src);
		})

		$('.sub-thumb li:first button').click()
		//endregion


        $('input[name=coupon]').click(function () {
            const li = $(this).closest('li');
            li.toggleClass('active', this.checked)
            const data = li.data('prop')            
            const ul = $(this).closest('ul');

            var currentAmt = parseInt('');

            var checked = ul.children().filter((i,v)=>$(v).hasClass('active'));

            checked = checked.map((i,v)=>$(v).data('prop')).toArray().sort((a,b)=>{
                if(a.benefitType===b.benfitType)return 0;
                if(a.benfitType==='C'&&b.benfitType==='P'){
                    return -1
                }else {
                    return 1
                }
            });

            const totalDiscountPrice = checked.reduce((a,b)=>{
                let discountPrice = 0;
                if(b.benefitType==='P'){
                    discountPrice = currentAmt * parseInt(b.benefitAmt) / 100;
                    if(discountPrice>parseInt(b.maxDiscountAmt)){
                        discountPrice = parseInt(b.maxDiscountAmt)
                    }
                    currentAmt = currentAmt-discountPrice;

                }else {
                    discountPrice = parseInt(b.benefitAmt);

                    currentAmt = currentAmt-discountPrice;
                }
                a+=discountPrice;
                return a;
            },0)
            
            if(currentAmt<0){
                return alert('실시간 금액보다 할인 금액이 클 수 없습니다.',()=>{
                    $(this).removeAttr('checked');
                    $(this).closest('li').removeClass('active');
                })
            }


            // region duplicateYn
            if (data.duplicateYn === 'Y') {
                if(ul.children().filter((i, v) => $(v).find('input').prop('checked')&&$(v).data('prop').duplicateYn === 'Y').length=== 0){

                    ul.children().filter((i, v) =>
                        $(v).data('prop').duplicateYn === 'N'
                    ).toggleClass('disabled',false).find('input').removeAttr('disabled')

                }else {
                    ul.children().not(li).filter((i, v) =>
                        $(v).data('prop').duplicateYn === 'N'
                    ).toggleClass('disabled', true).find('input').attr('disabled', true)
                }

            } else {
                ul.children().not(li).toggleClass('disabled', this.checked).find('input').attr('disabled', this.checked)
            }
            //	endregion
            $('.discount-price').find('em').text(formatter.format(totalDiscountPrice));



            //    region salePrice

            //    endRegion
            //    region useBtn

            //    endregion
        })
		//region 제품 담기
		$("#cartBtn").click(function () {
			
			// 매일배송
			var input = $('input[name=r1]:checked');
			if (input.hasClass('none-package')) {
				// 배송요일 선택 시
				var checkedDay = input.next().find('input[type=checkbox]:checked');
				if (checkedDay.length === 0) {
					return alert("배송요일을 선택해주세요");
				}

				const selectedDays = checkedDay.map(function (i, x) {
					return parseInt($(x).val()) - 1;
				}).toArray();
				const dayQty = days.map(function (x, i) {
					return selectedDays.includes(i) ? 1 : 0;
				});
			axios.get('/cart/'+itemType+'/save?products_no='+ itemCode+'&item='+dayQty).then(function ({data}) {      
				confirmDesign("제품이 담겼습니다. 담은 제품을 확인하시겠습니까?");
    		}).catch(function (e) {
      			alert("서버와 연결이 올바르지 않습니다.");
    		});
			} else {
				// 추천 패키지 선택 시
				var itemCodes = [];
				var items = {};
				input.next().find('.product-set').children().each(function (i, data) {
					var itemCode = $(data).attr('data-itemcode');
					var dayQty = items[itemCode] || [0, 0, 0, 0, 0];
					dayQty[i] += 1;
					items[itemCode] = dayQty;
					itemCodes.push(itemCode);
				});

				var orderItems = [];
				for (var key of Object.keys(items)) {
					orderItems.push({itemCode: key, qty: items[key]});
				}

				orderItems.sort(function (a, b) {
					var a1 = itemCodes.indexOf(a.itemCode);
					var b1 = itemCodes.indexOf(b.itemCode);
					return a1 > b1 ? 1 : a1 < b1 ? -1 : 0;
				})

				addCarts("daily", orderItems, eventIdx);
			}
		});
		//endregion
		//region 바로 구매
		$("#orderBtn").click(function () {
			if (itemType != "daily") {
				// 택배배송
				var args = { item: [{itemCode, qty: ($('.box-qty').text()) || "1", eventIdx: ""}] };
				console.log(args);
				window.orderProcess(args);
				return;
			}

			// 매일배송
			var input = $('input[name=r1]:checked');

			if (input.hasClass('none-package')) {
				// 배송요일 선택 시
				var checkedDay = input.next().find('input[type=checkbox]:checked');
				if (checkedDay.length === 0) {
					return alert("배송요일을 선택해주세요");
				}				
				const selectedDays = checkedDay.map(function (i, x) {
					return parseInt($(x).val()) - 1;
				}).toArray();
				const dayQty = days.map(function (x, i) {
					return selectedDays.includes(i) ? 1 : 0;
				});
				window.orderProcess({ item: [{itemCode, dayQty}] });
			} else {
				// 추천 패키지 선택 시
				var items = {};
				var itemCodes = [];
				input.next().find('.product-set').children().each(function (i, data) {
					var itemCode = $(data).attr('data-itemcode');
					var dayQty = items[itemCode] || [0, 0, 0, 0, 0];
					dayQty[i] += 1;
					items[itemCode] = dayQty;
					itemCodes.push(itemCode);
				});

				var orderItems = [];

				for (var key of Object.keys(items)) {
					orderItems.push({itemCode: key, dayQty: items[key]});
				}

				orderItems.sort(function (a, b) {
					var a1 = itemCodes.indexOf(a.itemCode);
					var b1 = itemCodes.indexOf(b.itemCode);
					return a1 > b1 ? 1 : a1 < b1 ? -1 : 0;
				})

				window.orderProcess({ item: orderItems });
			}
		});
		//endregion
	});
	
	window.kakaoShareData = {		
		key: 100891,
		data: {
			mobilehost: "http://localhost",
			webhost: "http://localhost/",
			detailImage1: location.origin+ "/file/download"+'/product/${list[0].system_name}',			
			weight: "${list[0].products_size}",
			path: "product/daily/${list[0].products_tag}",
			productName: "${list[0].products_name}",
			slogan: "${list[0].products_sub_name}",
			thumbnail: location.origin+ "/file/download"+'/product/${list[0].system_name}',
			price: "<fmt:formatNumber value="${list[0].price }" pattern="#,###" />",
		}	
	};


	//    region reviewPopup
	$(document).on('click', '.review-item', function () {
		const title = $(this).find('.title').text();
		const content = $(this).find('.title').next().text();
		const thumbnail = $(this).find('.thumb img').attr('src')
		const nameAndDateEl = $(this).find('.span-tie')

		const reviewModal = $('#reviewModal')
		reviewModal.find('.header h4').text(title)
		reviewModal.find('.thumb-area img').attr('src', thumbnail)
		reviewModal.find('.scrollable p').text(content)
		reviewModal.find('.scrollable .span-tie').replaceWith(nameAndDateEl.clone())
	})
	//    endregion

</script>
<script type="text/javascript">
	var itemType = "daily";
	var formatter = new Intl.NumberFormat();
	var limitSize = parseInt("-1" || "-1", 10);

	function calculateBoxPrice() {
		const qty = $('.box-qty').text()
		const price = '${list[0].price}'
		$('#totalPrice b').text(formatter.format(qty * price))

	}

    $().ready(function () {
        // region 가격
        $("input[name=r1]").change(function () {
            if ($(this).is(":checked")) {
                var totalPrice = 0;
                if ($(this).hasClass('none-package')) {
                    $('input[name=c1]').removeAttr('disabled');
                    $('.check-list').find('input[type=checkbox]:not(:checked)').click()
                    const cnt = $('input[name=c1]:checked').length
                    const price = '${list[0].price}'
                    totalPrice = cnt * price * 4;

                } else {
                    $('.check-list').find('input[type=checkbox]:checked').click()
                    $('input[name=c1]').attr('disabled', 'disabled');
                    totalPrice = $(this).data("total-price") * 4;
                }
                $("#totalPrice b").text(formatter.format(totalPrice));
            }
        });
        $('input[name=c1]').change(function () {
            if ($("input[name=r1]:checked").hasClass('none-package')) {
                const cnt = $('input[name=c1]:checked').length
                const price = '${list[0].price}'
                $("#totalPrice b").text(formatter.format(cnt * price * 4));
            }
        })    
        $('.btn-plus').click(function () {
            var qty = $('.box-qty').text()
			var beSize = parseInt(qty, 10) + 1;
			if (limitSize >= 0 && beSize > limitSize) {
				alert("해당 상품은 한정수량 판매입니다.");
				return;
			}
            $('.box-qty').text(beSize)
            calculateBoxPrice()
        })
        $('.btn-minus').click(function () {
            const qty = $('.box-qty').text()
            if (qty > 1) {
                $('.box-qty').text(parseInt(qty) - 1)
                calculateBoxPrice()
            }
        })
        //endregion
        //    region 추천 패키지
        $('.package-more').click(function () {
			$(this).hide().parents(".select-package").addClass("show-all");
        })

        $('.none-package').click();
		//    endregion
    });
</script>
<script>
  var nowArgs = undefined;
  window.orderProcess = function (args) {
    if (!window.is_signed) {
      alertWithRedirect("로그인 후 이용가능합니다.", "/member/login?redirectUrl=" + location.href)
      return;
    }
    nowArgs = args;

    var codes = [];
    for (var item of args.item) {
      if (!item.itemCode) continue;
      codes.push(item.itemCode);
    }

    $("#orderModal ul").html("");
    $("#orderModal").addClass("loading").modal("show");
    
    location.href = "/daily/order/step1?item="+ encodeURIComponent(JSON.stringify(nowArgs));    
    $("#orderModal").modal("hide").removeClass("loading");
  }
  $(document).on("click", "#orderModal button", function (e) {
    var type = $(this).attr("data-type");
    var p = encodeURIComponent(JSON.stringify(nowArgs));;
    if (type === "new") {
      location.href = "/daily/order/step1?item=" + p
    } else if (type === "continue") {
      var c = $("input[name='custnum']:checked");
      var custNumber = c.val();
      var prtnId = c.attr("data-prtn-id");
      location.href = "/mypage/drink/drink/change/" + custNumber + "/" + prtnId + "?item=" + p;
    }
  })
</script>
<div class="wrapper">
	<main class="page">
		<div class="bgfff">
			<div class="breadcrumb-style">
				<div class="container">
					<ul>
						<li><a href="/">홈</a></li>
						<li><a href="/product/daily">매일배송</a></li>
					</ul>
				</div>
			</div>
			<div class="container">
				<div class="product-info-area">
					<div class="thumb-area">
						<c:forEach var="dto" items="${list }" end="0">
							<div class="main-thumb">
								<img src="/file/download/product/${dto.system_name }">
							</div>
						</c:forEach>
						<ul class="sub-thumb">
							<c:forEach var="dto" items="${list }" end="4">
								<li class="active">
									<button type="button" class="item">
										<img src="/file/download/product/${dto.system_name }">
									</button>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="info-area">
						<div class="label-line">
							<label class="new">NEW</label>
						</div>
						<div style="height: 6px"></div>
						<div class="prd-detail-title-area">
							<div style="flex: 1; padding-right: 10px">
								<h2>${list[0].products_name }</h2>
								<p>${list[0].products_sub_name }</p>
							</div>
							<button data-toggle="modal" data-target="#shareModal" type="button" class="ellipse-button primary" style="margin-top: 8px">
								<i class="ico ico-share-wt"></i> <span class="offscreen">공유하기</span>
							</button>
						</div>
						<div class="product-addiction">
							<div class="price-item">
								<span style="padding-right: 12px; font-size: 22px;"> (원산지 :상품상세 참조) </span>
								<p>
									<fmt:formatNumber value="${list[0].price }" pattern="#,###" />
									<span>원</span>
								</p>
								<span>(${list[0].products_size })</span>
							</div>
						</div>
						<div class="buy-option">
							<div class="option-selector">
								<h5>배송요일</h5>
								<div class="select-week" style="margin-bottom: 34px;">
									<label class="radio-item check-list-form"> <input name="r1" class="none-package" type="radio">
										<div class="item">
											<ul class="check-list">
												<li><label class="week-item"> <input name="c1" value="1" type="checkbox"> <span>월</span>
												</label></li>
												<li><label class="week-item"> <input name="c1" value="2" type="checkbox"> <span>화</span>
												</label></li>
												<li><label class="week-item"> <input name="c1" value="3" type="checkbox"> <span>수</span>
												</label></li>
												<li><label class="week-item"> <input name="c1" value="4" type="checkbox"> <span>목</span>
												</label></li>
												<li><label class="week-item"> <input name="c1" value="5" type="checkbox"> <span>금</span>
												</label></li>
											</ul>
											<p>배송을 원하는 날짜를 선택하세요</p>
										</div>
									</label>
								</div>								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Nav tabs -->
			<div class="tab-area">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#home" class="active" aria-controls="home" role="tab" data-toggle="tab">상품정보</a></li>
					<li role="presentation"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">상품정보제공고시</a></li>
				</ul>
			</div>
		</div>
		<!-- Tab panes -->
		<div class="tab-content">${list[0].content }</div>
		<a class="faq-product" href="/forum/faq/list">
			<div class="container">
				<h2 class="part-title">FAQ</h2>
				<p>자주 묻는 질문입니다.</p>
			</div>
		</a>
		<div class="bottom-fixed-layer">
			<div class="container">
				<div class="info">
					<div class="prd-detail-modal-title ">
						<span>4주 예상 주문 금액</span>
						<p id="totalPrice" class="price" style="margin-left: 39px; margin-bottom: 8px">
							<b></b><span>원</span>
						</p>
					</div>
				</div>
				<div class="button-set" style="margin-right: -4px; margin-bottom: 7px">
					<c:choose>
						<c:when test="${list[0].wish_status eq 1 }">
							<button class="button-fix interest-button  active" data-wish-type="box" data-wish-id="${list[0].products_tag }"></button>
						</c:when>
						<c:otherwise>
							<button class="button-fix interest-button " data-wish-type="box" data-wish-id="${list[0].products_tag }"></button>
						</c:otherwise>
					</c:choose>
					<!-- 품절용 가이드 추가 -->
					<button id="cartBtn" class="button-fix black">장바구니</button>
					<button id="orderBtn" class="button-fix primary">바로구매</button>
				</div>
			</div>
		</div>
	</main>
</div>