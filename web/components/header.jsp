<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*, dao.*, java.util.*" %>
<%
    Channel currC = (Channel) request.getSession().getAttribute("user");
    if(currC != null) {
        ArrayList<Notification> notis = new NotificationDAO().getNotification(currC.getId());
        request.setAttribute("notis", notis);
        request.setAttribute("notiSize", notis.size());
    }
%>

<header>
    <div class="top_bar">
        <div class="container">
            <div class="top_header_content">
                <div class="menu_logo">
                    <a href="#" title="" class="menu">
                        <i class="icon-menu"></i>
                    </a>
                    <a href="/" title="" class="logo">
                        <img src="components/logo.png" alt="">
                    </a>
                </div><!--menu_logo end-->
                <div class="search_form">
                    <form action="/search" method="get">
                        <input type="text" name="keyword" placeholder="Search Videos" value="${param.keyword}">
                        <button type="submit">
                            <i class="icon-search"></i>
                        </button>
                    </form>
                </div><!--search_form end-->
                <ul class="controls-lv">
                    <c:choose>
                        <c:when test="${sessionScope.user == null}">
                            <li>
                                <a href="login" title="" class="btn-default">Login</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="#" title="Notification" class="btn dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-notification"></i>
                                </a>
                                <c:if test="${notiSize > 0}">
                                    <div class="mt-2 dropdown-menu dropdown-menu-right">
                                        <c:forEach items="${notis}" var="noti">
                                            <a class="dropdown-item w-100 d-flex align-items-lg-center" href="${noti.target}">
                                                <div class="rounded-circle p-2 mr-3" style="background-color: #ccc"><i class="icon-notification"></i></div>
                                                <p>${noti.content} (${noti.date})</p>
                                            </a>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </li>
                            <li class="user-log">
                                <div class="user-ac-img">
                                    <img src="../channelAvatar/${sessionScope.user.avatar}" alt="" style="width: 50px; height: 50px">
                                </div>

                                <div class="account-menu">

                                    <h4>${sessionScope.user.channelName} <span class="usr-status">PRO</span></h4>
                                    <div class="sd_menu scnd">
                                        <ul class="mm_menu">
                                            <li>
                                                <span>
                                                    <i class="icon-user"></i>
                                                </span>
                                                <a href="/channel?username=${sessionScope.user.username}" title="">My Channel</a>
                                            </li>
                                            <li>
                                                <span>
                                                    <i class="icon-paid_sub"></i>
                                                </span>
                                                <a href="#" title="">Paid subscriptions</a>
                                            </li>
                                            <li>
                                                <span>
                                                    <i class="icon-settings"></i>
                                                </span>
                                                <a href="#" title="">Settings</a>
                                            </li>
                                            <li>
                                                <span>
                                                    <i class="icon-logout"></i>
                                                </span>
                                                <a href="signout" title="">Sign out</a>
                                            </li>
                                        </ul>
                                    </div><!--sd_menu end-->                                    
                                </div>
                            </li>
                            <li>
                                <a href="upload-video" title="" class="btn-default">Upload</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul><!--controls-lv end-->
                <div class="clearfix"></div>
            </div><!--top_header_content end-->
        </div>
    </div>
</header><!--header end-->