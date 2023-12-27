<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>

	$(function() {
		$(".confirm").click(
				function() {
					if (location.pathname.indexOf('mypage') != -1 ){
						
					}else{						
						if (location.pathname.indexOf('box') != -1
								&& location.pathname.indexOf('cart') == -1) {						
							location.href = '/cart/box'
						}
						 if (location.pathname.indexOf('kid') != -1) {
							if (location.pathname.indexOf('daily') != -1
									|| location.pathname.indexOf('kid') != -1
									|| location.pathname.indexOf('result') != -1
									&& location.pathname.indexOf('cart') == -1
									&& location.pathname.indexOf('box') == -1) {							
								location.href = '/cart/daily'
							}
						}
						 if (location.pathname.indexOf('daily') != -1
								&& location.pathname.indexOf('kid') != -1
								|| location.pathname.indexOf('result') != -1
								|| location.pathname.indexOf('cart') == -1
								&& location.pathname.indexOf('box') == -1) {					
							location.href = '/cart/daily'
						}
					}

				});
	});
</script>
<div class="modal fade" id="confirmDesignModal" tabindex="-1" aria-labelledby="confirmDesignModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmDesignModal"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="cancel" data-dismiss="modal">취소</button>
				<button type="button" class="confirm">확인</button>
			</div>
		</div>
	</div>
</div>