<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade" id="changeModal" tabindex="-1" aria-labelledby="changeModal" style="display: none;" aria-hidden="true">
	<div class="modal-dialog basic-width modal-dialog-centered modal-dialog-scrollable">
		
		<div id="drink" class="modal-content">
			<div class="modal-header" style="border:0; padding:20px 28px 12px 30px;">
				<h5 class="modal-title" id="changeModalLabel">변경내역 상세</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			
			<table class="doc-style-table mg h34" style="margin-bottom:15px;">
				<colgroup>
					<col width="105px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>변경내용</th>
						<td class="changeType"></td>
					</tr>
					<tr>
						<th>신청일자</th>
						<td class="reqDate"></td>
					</tr>
					<tr>
						<th>희망변경시작일</th>
						<td class="startDate"></td>
					</tr>
				</tbody>
			</table>
			
			<ul class="product-content-list" style="max-height: 220px;overflow: auto">
			</ul>

			<div class="button-set">
				<button data-dismiss="modal" class="button-basic primary">확인</button>
			</div>
		</div>
		
	</div>
</div>