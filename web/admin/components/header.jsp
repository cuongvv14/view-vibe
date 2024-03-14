<header class="header-desktop">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="header-wrap justify-content-end">
                <div class="header-button">
                    <div class="account-wrap">
                        <div class="account-item clearfix js-item-menu">
                            <div class="image">
                                <img src="/channelAvatar/${sessionScope.user.avatar}" alt="${sessionScope.user.username}" />
                            </div>
                            <div class="content">
                                <a class="js-acc-btn" href="/profile">${sessionScope.user.channelName}</a>
                            </div>
                            <div class="account-dropdown js-dropdown">
                                <div class="info clearfix">
                                    <div class="image">
                                        <a href="/channel">
                                            <img src="/channelAvatar/${sessionScope.user.avatar}" alt="${sessionScope.user.username}" />
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h5 class="name">
                                            <a href="/profile">${sessionScope.user.channelName}</a>
                                        </h5>
                                        <span class="email">${sessionScope.user.username}</span>
                                    </div>
                                </div>
                                <div class="account-dropdown__footer">
                                    <a href="/signout">
                                        <i class="zmdi zmdi-power"></i>Logout
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>