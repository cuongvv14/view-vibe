<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, model.*, dao.*" %>
<%
    Channel currChannel = (Channel) session.getAttribute("user");
    ArrayList<Channel> subscribedChannels = new ArrayList<>();
    if(currChannel != null) {
        subscribedChannels = new ChannelDAO().getSubscribedChannels(currChannel.getId());
    }
    request.setAttribute("subscribedChannels", subscribedChannels);
%>

<aside class="side_menu" style="top: 90.3333px;">
    <div class="form_dvv">
        <a href="https://oren.azyrusthemes.com/index.html?fbclid=IwAR2cOxf4nUcP9jKrt_fadhyUcYWi9nYLsSTueU1AgaiCDRfwIiOCKkaVl6A#" title="" class="login_form_show">Sign in</a>
    </div>
    <div class="sd_menu">
        <ul class="mm_menu">
            <li>
                <span>
                    <i class="icon-home"></i>
                </span>
                <a href="/" title="">Home</a>
            </li>
            <li>
                <span>
                    <i class="icon-fire"></i>
                </span>
                <a href="#" title="">Trending</a>
            </li>
            <li>
                <span>
                    <i class="icon-subscriptions"></i>
                </span>
                <a href="#" title="">Subscriptions</a>
            </li>
        </ul>
    </div><!--sd_menu end-->
    <div class="sd_menu">
        <h3>Library</h3>
        <ul class="mm_menu">
            <li>
                <span>
                    <i class="icon-history"></i>
                </span>
                <a href="#" title="">History</a>
            </li>
            <li>
                <span>
                    <i class="icon-watch_later"></i>
                </span>
                <a href="#" title="">Watch Later</a>
            </li>
            <li>
                <span>
                    <i class="icon-purchased"></i>
                </span>
                <a href="#" title="">Purchases</a>
            </li>
            <li>
                <span>
                    <i class="icon-like"></i>
                </span>
                <a href="#" title="">Liked Videos</a>
            </li>
            <li>
                <span>
                    <i class="icon-play_list"></i>
                </span>
                <a href="#" title="">Playlist</a>
            </li>
        </ul>
    </div><!--sd_menu end-->
    <c:if test="${sessionScope.user != null}">
        <div class="sd_menu subs_lst">
            <h3>Subscriptions</h3>
            <ul class="mm_menu">
                <c:forEach items="${subscribedChannels}" var="channel">
                    <li>
                        <span class="usr_name">
                            <img src="channelAvatar/${channel.avatar}" alt="">
                        </span>
                        <a href="channel?username=${channel.username}" title="">${channel.channelName}</a>
                    </li>
                </c:forEach>
            </ul>
        </div><!--sd_menu end-->
    </c:if>
    <div class="sd_menu">
        <ul class="mm_menu">
            <li>
                <span>
                    <i class="icon-settings"></i>
                </span>
                <a href="#" title="">Settings</a>
            </li>
            <li>
                <span>
                    <i class="icon-flag"></i>
                </span>
                <a href="#" title="">Report history</a>
            </li>
            <li>
                <span>
                    <i class="icon-logout"></i>
                </span>
                <a href="/signout" title="">Sign out</a>
            </li>
        </ul>
    </div><!--sd_menu end-->
    <div class="sd_menu m_linkz">
        <ul class="mm_menu">
            <li><a href="#">About</a></li>
            <li><a href="#">Community Rules </a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Terms</a></li>
            <li><a href="#">Blogs</a></li>
            <li><a href="#">Contracts </a></li>
            <li><a href="#">Donate</a></li>
            <li><a href="#">FAQ</a></li>
        </ul>
    </div><!--sd_menu end-->
    <div class="sd_menu bb-0">
        <ul class="social_links">
            <li>
                <a href="https://www.facebook.com/profile.php?id=100020328438958" title="" target="_blank">
                    <i class="icon-facebook-official"></i>
                </a>
            </li>
            <li>
                <a href="#" title="" target="_blank">
                    <i class="icon-twitter"></i>
                </a>
            </li>
            <li>
                <a href="https://www.instagram.com/inkyung97/" title="" target="_blank">
                    <i class="icon-instagram"></i>
                </a>
            </li>
        </ul><!--social_links end-->
    </div><!--sd_menu end-->
    <div class="dd_menu"></div>
</aside><!--side_menu end-->