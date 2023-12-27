<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="part">
	<div class="part-head" style="margin-bottom:17px;">
		<a href="/mypage/drink/drink">매일배송 음용정보</a>
	</div>
			
	<div class="box-layout" style="margin-bottom:6px;">
		<div>
			<div class="half-area nickname-format">
				<label>기본</label>
				<h5>${ drkOrderMypageDTO.drk_order_name }</h5>
				<span>${ drkOrderMypageDTO.drk_order_no }</span>
			</div>
			<a href="/mypage/drink/drinks/${ drkOrderMypageDTO.drk_order_no }" class="rounded-button">상세보기</a>
		</div>
		
		<div style="padding:20px 25px 20px 0;">
			<div class="half-area">
				<ul class="document-style">
					<li>
						<label style="font-weight:500">담당 가맹점</label>
						<p>${ drkOrderMypageDTO.fc_name }</p>
					</li>
				</ul>
			</div>
			
			<div class="half-area end">
				<ul class="addiction-info">
					<li class="tel">
						<label></label>
						<p data-call-text="">${ drkOrderMypageDTO.fc_tel }</p>
					</li>
					<li style="margin-left:30px;" class="phone">
						<label></label>
						<p data-call-text="">${ drkOrderMypageDTO.fc_phone }</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>