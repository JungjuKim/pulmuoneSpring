<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
    HttpServletRequest Erequest = (HttpServletRequest) pageContext.getRequest();
    String requestURI = Erequest.getRequestURI();

    if (requestURI.contains("/event/list")) {
        Erequest.getSession().setAttribute("activeTab", "진행중이벤트");
    } else if (requestURI.contains("/event/endList")) {
        Erequest.getSession().setAttribute("activeTab", "종료된이벤트");
    } else if (requestURI.contains("/event/winner")) {
        Erequest.getSession().setAttribute("activeTab", "당첨자발표");
    } else if (requestURI.contains("/event/view")) {
        String eventNo = Erequest.getParameter("event_no");
        if ("2".equals(eventNo)) {
            Erequest.getSession().setAttribute("activeTab", "친구초대");
        } else if ("25".equals(eventNo)) {
            Erequest.getSession().setAttribute("activeTab", "회원혜택");
        } else {
        	Erequest.getSession().setAttribute("activeTab", "진행중이벤트");
        }
    }

    String activeTab = (String) Erequest.getSession().getAttribute("activeTab");
    /* out.println("Active tab: " + activeTab); */
%>
<div class="title-tab-area">
	<h2 class="cont-title">이벤트</h2>
	<ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
		<li class="nav-item" role="presentation">
			<a href="/event/event/list" class="nav-link <%= "진행중이벤트".equals(activeTab) ? "active" : "" %>"
			style="padding-right: 4px; margin-bottom: 0px; height: 47px">진행중이벤트</a>
		</li>
		<li class="nav-item" role="presentation">
			<a href="/event/event/endList" class="nav-link <%= "종료된이벤트".equals(activeTab) ? "active" : "" %>"
			style="padding-right: 4px; margin-bottom: 0px; height: 47px">종료된이벤트</a>
		</li>
		<li class="nav-item" role="presentation">
			<a href="/event/winner" class="nav-link <%= "당첨자발표".equals(activeTab) ? "active" : "" %>"
			style="margin-bottom: 0px; padding-right: 0; height: 47px">당첨자발표</a>
		</li>
		<li class="nav-item" role="presentation">
			<a href="/event/event/view?event_no=2" class="nav-link <%= "친구초대".equals(activeTab) ? "active" : "" %>"
			style="padding-right: 4px; margin-bottom: 0px; height: 47px">친구초대</a>
		</li>
		<li class="nav-item" role="presentation">
			<a href="/event/event/view?event_no=25" class="nav-link <%= "회원혜택".equals(activeTab) ? "active" : "" %>"
			style="margin-bottom: 0px; height: 47px">회원혜택</a>
		</li>
	</ul>
</div>


