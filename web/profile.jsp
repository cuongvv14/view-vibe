<%-- 
    Document   : userLogin
    Created on : Oct 26, 2023, 10:00:09 PM
    Author     : acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <link rel="icon" href="https://oren.azyrusthemes.com/images/Favicon.png">
        <link rel="stylesheet" type="text/css" href="./css/animate.css">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./css/flatpickr.min.css">
        <link rel="stylesheet" type="text/css" href="./css/fontello.css">
        <link rel="stylesheet" type="text/css" href="./css/fontello-codes.css">
        <link rel="stylesheet" type="text/css" href="./css/thumbs-embedded.css">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <link rel="stylesheet" type="text/css" href="./css/responsive.css">
        <link rel="stylesheet" type="text/css" href="./css/color.css">
        <link rel="stylesheet" href="https://cdn.lineicons.com/4.0/lineicons.css" />
    </head>
    <body>
        <style>
            html{
                scroll-behavior: smooth;
            }
        </style>
        <%@include file="components/header.jsp" %>

        <%@include file="components/sideBar.jsp" %>
        
        <section class="user-account">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3">
                        <div class="sidebar">
                            <div class="widget video_info pr sp">
                                <span class="vc_hd">
                                    <img src="/channelAvatar/${sessionScope.user.avatar}" alt="">
                                </span>
                                <h4>${sessionScope.user.channelName}</h4>
                            </div><!--video_info pr-->
                            <div class="widget account">
                                <h2 class="hd-uc"> <i class="icon-user"></i> Account</h2>
                                <ul>
                                    <li><a href="#home">My Account</a></li>
                                    <li><a href="#change-password"> Change Password</a></li>
                                    <li><a href="#update-profile"> Profile Settings </a></li>
                                </ul>
                            </div><!--account end-->


                            <div class="widget vid-ac">
                                <h2 class="hd-uc"><i class="icon-play"></i>Videos </h2>
                                <ul>
                                    <li><a href="upload-video">Uploaded Videos </a></li>
                                </ul>
                            </div><!--vid-ac end-->

                            <div class="widget playlist">
                                <h2 class="hd-uc"><i class="icon-add_to_playlist"></i>Playlists  </h2>
                                <span><a href="https://oren.azyrusthemes.com/User_Account_Page.html#"> Manage Playlists</a></span>
                            </div><!--playlist end-->


                        </div><!--sidebar end-->
                    </div>
                    <div class="col-lg-9">
                        <div class="video-details">
                            <div class="latest_vidz">
                                <div class="latest-vid-option">
                                    <h2 class="hd-op" id="home"> Latest Videos</h2>
                                    <div class="clearfix"></div>
                                </div><!--latest-vid-option end-->
                                <div class="vidz_list">
                                    <c:forEach items="${videos}" var="video">

                                        <div class="tb-pr">
                                            <div class="row">
                                                <div class="col-xl-8 col-lg-9 col-md-9 col-sm-12">
                                                    <div class="tab-history acct_page">
                                                        <div class="videoo">
                                                            <div class="vid_thumbainl ms br">
                                                                <a href="/video?id=${video.id}" title="">
                                                                    <img src="/thumbnail/${video.thumbnail}" alt="">
                                                                    <span class="vid-time"></span>
                                                                    <span class="watch_later">
                                                                        <i class="icon-watch_later_fill"></i>
                                                                    </span>
                                                                </a>	
                                                            </div><!--vid_thumbnail end-->
                                                            <div class="video_info ms br">
                                                                <h3><a href="/video?id=${video.id}" title="">${video.title}</a></h3>
                                                                <h4><a href="/channel?username=${sessionScope.user.username}" title="">${video.channel.channelName}</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                                <span>${String.format("%,d", video.view)} views . ${video.date}</span>
                                                                <ul>
                                                                    <li><span class="br-2">Successful</span></li>
                                                                </ul>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div><!--videoo end-->
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-3 col-md-3 col-sm-12">
                                                    <div class="icon-list">
                                                        <ul>
                                                            <li><a href="/video?id=${video.id}" title="Watch"><i class="icon-play"></i></a></li>
                                                            <li><a href="/update-video?id=${video.id}" title="Edit video"><i class="icon-pencil"></i></a></li>
                                                            <li><span class="delete-btn" data-video="${video.id}" title="Delete video" style="cursor: pointer"><i class="icon-cancel"></i></span></li>
                                                        </ul>
                                                    </div><!--icon-list end-->
                                                </div>
                                            </div>
                                        </div><!--tb-pr end-->
                                    </c:forEach>


                                </div><!--vidz_list end-->
                            </div><!--latest_vidz end-->


                            <div class="change-pswd">
                                <h2 class="hd-op" id="change-password">Change password</h2>
                                <form action="change-password" method="post">
                                    <div class="ch-pswd">
                                        <input type="password" name="oldPassword" placeholder="Old Password">
                                    </div><!--ch-pswd end-->
                                    <div class="ch-pswd">
                                        <input type="password" name="newPassword" placeholder=" New Password">
                                    </div><!--ch-pswd end-->
                                    <div class="ch-pswd">
                                        <input type="password" name="confirmPassword" placeholder="Confirm New Password">
                                    </div><!--ch-pswd end-->
                                    <div class="ch-pswd">
                                        <button type="submit"> Update</button>
                                    </div><!--ch-pswd end-->
                                    <span class="text-danger">${errorMsg}</span>
                                    <span class="text-success">${successMsg}</span>
                                </form>
                            </div><!--change-pswd end-->

                            <div class="account-details">
                                <h2 class="hd-op" id="update-profile">  Account Details </h2>
                                <form id="update-profile-form">
                                    <h4 class="title-hd">Username</h4>
                                    <div class="ch-pswd">
                                        <input name="username" value="${sessionScope.user.username}" id="username">
                                    </div>
                                    <h4 class="title-hd">Channel name</h4>
                                    <div class="ch-pswd">
                                        <input name="channelName" value="${sessionScope.user.channelName}" id="channelName">
                                    </div>
                                    <h4 class="title-hd">Description</h4>
                                    <div class="ch-pswd">
                                        <input name="description" value="${sessionScope.user.description}" id="description">
                                    </div>
                                    <h4 class="title-hd">Avatar</h4>
                                    <div class="ch-pswd">
                                        <input name="avatar" type="file" accept=".jpg, .png" id="avatar">
                                    </div>
                                    <div class="ch-pswd">
                                        <button type="button" id="updateProfileBtn"> Update</button>
                                    </div><!--ch-pswd end-->
                                </form>
                            </div><!--Account Details end-->
                        </div><!--video-details end-->
                    </div>
                </div>
            </div>
        </section><!--user-account end-->



        <script src="./js/jquery.min.js.download"></script>
        <script src="./js/popper.js.download"></script>
        <script src="./js/bootstrap.min.js.download"></script>
        <script src="./js/flatpickr.js.download"></script>
        <script src="./js/script.js.download"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            const deleteBtns = Array.from(document.querySelectorAll(".delete-btn"));
            deleteBtns.forEach(btn => {
                btn.onclick = () => {
                    $.ajax({
                        type: "post",
                        url: "/video/delete",
                        data: {
                            videoId: btn.dataset.video
                        },
                        cache: false,
                        success: function (response) {
                            window.location.reload();
                        }
                    });
                }
            })

            const usernameInput = document.querySelector("#username");
            const channelNameInput = document.querySelector("#channelName");
            const descriptionInput = document.querySelector("#description");
            const avatarInput = document.querySelector("#avatar");
            const updateProfileBtn = document.querySelector("#updateProfileBtn");
            
            const getAvatar = () => {
                let file = avatarInput.files[0];
                if(typeof file === 'undefined') return "";
                return file.name;
            }

            updateProfileBtn.onclick = () => {
                $.ajax({
                    type: "post",
                    url: "/profile/update",
                    data: {
                        username: usernameInput.value,
                        channelName: channelNameInput.value,
                        description: descriptionInput.value,
                        avatar: getAvatar()
                    },
                    cache: false,
                    success: function (response) {
                        window.location.reload();
                    }
                });
            }
        </script>
    </body>
</html>
