<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="org.pro.pulmuone.domain.member.MemberDTO" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member.name"/>
</sec:authorize>
 -->
<div class="board-write">
    <span style="text-decoration: none">
        <c:choose>
            <c:when test="${not empty name}">
                ${name}
            </c:when>
            <c:otherwise>
                <a href="/mypage" id="login-link" style="text-decoration: underline;">로그인</a>
            </c:otherwise>
        </c:choose>
    </span>
    <div class="textarea">
        <textarea id="content" title="댓글을 남겨보세요." placeholder="댓글을 남겨보세요" maxlength="500"></textarea>
        <button id="write-review" type="button">댓글등록</button>
    </div>
</div>


<div class="board-review-list-area">
    <div class="list-head">
        <em class="count">댓글 <span>${totalComments}</span></em>
    </div>
    <ul class="board-review-list" data-list-object="replace" id="pagable-list">
    
		<c:forEach var="comment" items="${comments}">
		    <li style="position: relative">
		        <div class="board-review-cont" style="width: 100%">
		            <b>${comment.name}</b>
		            <p class="review-content-${comment.comment_no}">${comment.content}</p>
		            <span class="text-day">${comment.write_date}</span>
		            <c:if test="${userDetails != null && userDetails.username == comment.username}">
		                <div class="review-util-btn" style="white-space: nowrap; position: absolute; top: 32px; right: 0" data-idx="${comment.comment_no}" data-eventidx="${comment.event_no}">
		                    <button class="edit-btn">수정</button>
		                    <button class="delete-btn">삭제</button>
		                </div>
		            </c:if>
		        </div>
		    </li>
		</c:forEach>

    </ul>
</div>

<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
    <input type="hidden" id="pageNo" name="pageNo">
    <ul class="pagination">
		<c:forEach var="i" begin="1" end="${totalPages}">
		    <li class="page-item ${i == currentPage ? 'active' : ''}">
		        <a class="page-link" href="#">${i}</a>
		    </li>
		</c:forEach>
    </ul>
</nav>

 
<style> /* 모달창 스타일 */
.modal-content {
	max-width: 350px;
}

.modal-header{
	border: 0px;
	padding: 20px 20px 0px;
}

.modal-body {
    font-weight: 300;
    letter-spacing: -1.2px;
    text-align: center;
    color: #333;
    padding: 30px 20px 40px;
    background: #fff;
}

.modal-footer {
	padding: 0px;
}

.modal-footer .cancel {
	border-bottom-left-radius: 26px;
    background: #333333;
    color: #fff;
    flex: 1;
    font-size: 15px;
    font-weight: 500;
    font-stretch: normal;
    font-style: normal;
    line-height: 1.73;
    letter-spacing: -1.13px;
    text-align: center;
    justify-content: center;
    height: 60px;
    margin: 0px;
}

.modal-footer .confirm {
    border-bottom-right-radius: 26px;
    background: #7acc12;
    color: #fff;
    flex: 1;
    font-size: 15px;
    font-weight: 500;
    font-stretch: normal;
    font-style: normal;
    line-height: 1.73;
    letter-spacing: -1.13px;
    text-align: center;
    justify-content: center;
    height: 60px;
    margin: 0px;
}
</style>

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">로그인 후 참여가능합니다.</div>
            <div class="modal-footer">
                <button type="button" class="cancel" data-dismiss="modal">취소</button>
                <button type="button" class="confirm" onclick="location.href=$('#login-link').attr('href');">확인</button>
            </div>
        </div>
    </div>
</div>



<script>
$(document).ready(function() {
    
    $(".pagination").on("click", ".page-link", function(e) {
        e.preventDefault(); 

        $(".page-item").removeClass("active");
        $(this).parent().addClass("active");
        
        var pageNo = $(this).text();
        var eventNo = ${event.event_no};

        $.ajax({
        	url: "/event/event/view/EventComment.ajax",
            type: "GET",
            data: {
                event_no: eventNo,
                currentPage: pageNo
            },
            dataType: "json",
            success: function(response) {
                $("#pagable-list").empty();
                $.each(response.comments, function(i, comment) {
                	// UNIX 타임스탬프를 밀리초 단위로 변환한 후 Date 객체를 생성합니다.
                    var writeDate = new Date(comment.write_date * 1);
                    // Date 객체를 'yyyy-mm-dd' 형식의 문자열로 변환합니다.
                    var formattedDate = writeDate.getFullYear() + '-' + ('0' + (writeDate.getMonth() + 1)).slice(-2) + '-' + ('0' + writeDate.getDate()).slice(-2);
                    
                    $("#pagable-list").append(
                        '<li style="position: relative">' +
                            '<div class="board-review-cont" style="width: 100%">' +
                                '<b>' + comment.name + '</b>' +
                                '<p class="review-content-' + comment.comment_no + '">' + comment.content + '</p>' +
                                '<span class="text-day">' + formattedDate + '</span>' +
                            '</div>' +
                            '<div class="review-util-btn" style="white-space: nowrap; position: absolute; top: 32px; right: 0" data-idx="' + comment.comment_no + '" data-eventidx="' + comment.event_no + '"></div>' +
                        '</li>'
                    );
                });

                $(".pagination").empty();
                var totalPages = Math.ceil(response.totalComments / 10);
                for (var i = 1; i <= totalPages; i++) {
                    var li = $('<li class="page-item"></li>');
                    if (i == pageNo) {
                        li.addClass("active");
                    }
                    var a = $('<a class="page-link" href="#">' + i + '</a>');
                    li.append(a);
                    $(".pagination").append(li);
                }

                $(".count > span").text(response.totalComments);
                
                $('html, body').animate({
                    scrollTop: $('.board-write').offset().top
                }, 'slow');
            },
            error: function(jqXHR, textStatus, errorThrown) { 
                console.log(textStatus, errorThrown);
            }
        });
    });
});

</script>
<%-- 
<sec:authorize access="isAuthenticated()">
	<script>
		var isAuthenticated = true;
	</script>
</sec:authorize>

<sec:authorize access="!isAuthenticated()">
	<script>
		var isAuthenticated = false;
	</script>
</sec:authorize>
 --%>
<script>
$(document).ready(function() {
    $('#write-review').click(function(e) {
        e.preventDefault();
        var authInfo = '${memberId}';
        if (authInfo == "null" || authInfo == "") {
            // 로그인이 필요한 경우
            $('#loginModal').modal('show');
        } else {
            postComment();
        }
    });
    
    $('#content').keydown(function(e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $('#write-review').click();
        }
    });

    function postComment() {
        var content = document.getElementById('content').value;

        $.ajax({
            type: "POST",
            url: "/event/comment/write.do",
            data: {
            	'event_no': encodeURIComponent('${event.event_no}'),
                'content': encodeURIComponent(content),
                'member_no': encodeURIComponent('${memberInfo.member_no}')
            },
            dataType: "json",
            success: function(response) {
                if (response.result == "success") {
                    // 댓글 등록 성공
                    alert('댓글이 등록되었습니다.');
                    location.reload();
                } else if (response.result == "already_participated") {
                    // 이미 참여한 경우
                    alert('이미 참여한 이벤트입니다.');
                } else {
                    // 그 외 실패 경우
                    console.error("댓글 등록 실패");
                }
            },
            error: function(response) {
                console.error("요청 처리 중 오류 발생");
            }
        });
    }
});
</script>





