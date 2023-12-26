<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="contents-area">
	<div class="container">
		<div class="location">
			<a href="/">홈</a> <a href="/event/event/list">이벤트</a>
		</div>
		<div class="cont-event-area">
			<%@ include file="/WEB-INF/views/layouts/event/content/title_tab_area.jsp"%>

			<div class="list-area">

				<div class="list-head">
					<em class="count">총 <span>${totalWinners}</span>건
					</em>
				</div>

				<table class="tbl-col event-winner-list" style="margin-top: 30px">
					<caption></caption>
					<colgroup>
						<col>
						<col>
					</colgroup>
					<tbody id="pagable-list" data-list-object="replace">
						<c:forEach var="eventWinner" items="${eventWinners}">
							<tr>
								<td class="al"><a
									href="/event/winner/view?win_board_no=${eventWinner.win_board_no}">
										[발표] ${eventWinner.win_title} <span>${eventWinner.win_regdate}</span>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
					<input type="hidden" id="pageNo" name="pageNo">
					<ul class="pagination">
						<c:forEach var="i" begin="1" end="${pageDTO.totalPages}">
							<li class="page-item ${i == pageDTO.currentPage ? 'active' : ''}">
							<a class="page-link" href="/event/winner?currentPage=${i}">${i}</a>
							</li>
						</c:forEach>
					</ul>
				</nav>


			</div>

		</div>
	</div>
</div>
