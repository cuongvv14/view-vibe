<%-- 
    Document   : video
    Created on : Oct 22, 2023, 5:43:25 PM
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
        <div class="wrapper">
            <%@include file="components/header.jsp" %>

            <%@include file="components/sideBar.jsp" %>

            <section class="mn-sec full_wdth_single_video">
                <div class="container">
                    <div class="vid-pr">
                        <video width="1100" height="550" controls autoplay="true" style="background-color: #000"> 
                            <source src="videos/${video.videoUrl}" type="video/mp4"/>
                        </video>
                    </div><!--vid-pr end-->
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="mn-vid-sc single_video">
                                <div class="vid-1">
                                    <div class="vid-info">
                                        <h3>${video.title}</h3>
                                        <div class="info-pr">
                                            <span>${String.format("%,d", video.view)} views</span>
                                            <ul class="pr_links">
                                                <li>
                                                    <c:choose>
                                                        <c:when test="${sessionScope.user == null}">
                                                            <a href="login">
                                                                <i class="icon-thumbs_up" style="margin-right: 12px"></i>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button data-toggle="tooltip" data-placement="top" title="" id="toggleLikeBtn">
                                                                <c:choose>
                                                                    <c:when test="${isChannelLikeVideo == true}">
                                                                        <i class="icon-thumbs_up_fill"></i>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <i class="icon-thumbs_up"></i>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <span id="totalLike">${totalLikes}</span>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div><!--info-pr end-->
                                    </div><!--vid-info end-->
                                </div><!--vid-1 end-->
                                <div class="abt-mk">
                                    <div class="info-pr-sec">
                                        <div class="vcp_inf cr">
                                            <div class="vc_hd">
                                                <img src="channelAvatar/${video.channel.avatar}" alt="">
                                            </div>
                                            <div class="vc_info pr">
                                                <h4><a href="channel?username=${video.channel.username}" title="">${video.channel.channelName}</a></h4>
                                                <span>Published on ${video.date}</span>
                                            </div>
                                        </div><!--vcp_inf end-->							
                                        <ul class="chan_cantrz">
                                            <c:choose>
                                                <c:when test="${sessionScope.user == null}">
                                                    <a href="login" class="btn btn-dark" style="border-radius: 30px">
                                                        Subscribe <strong id="totalSubscribe">${totalSubscribe}</strong>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${isChannelSubscribed == true}">
                                                            <button class="btn btn-outline-dark" style="border-radius: 30px" id="toggleSubscribeBtn">
                                                                <span id="subscribeLabel">Unsubscribe </span>
                                                                <strong id="totalSubscribe">${totalSubscribe}</strong>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-dark" style="border-radius: 30px" id="toggleSubscribeBtn">
                                                                <span id="subscribeLabel">Subscribe </span>
                                                                <strong id="totalSubscribe">${totalSubscribe}</strong>
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul><!--chan_cantrz end-->
                                        <ul class="df-list">
                                            <li>
                                                <button data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to playlist">
                                                    <i class="icon-add_to_playlist"></i>
                                                </button>
                                            </li>
                                            <li>
                                                <button data-toggle="tooltip" data-placement="top" title="" data-original-title="Favorite">
                                                    <i class="icon-like"></i>
                                                </button>
                                            </li>
                                            <li>
                                                <button data-toggle="tooltip" data-placement="top" title="" data-original-title="Watch Later">
                                                    <i class="icon-watch_later"></i>
                                                </button>
                                            </li>
                                            <li>
                                                <button data-toggle="tooltip" data-placement="top" title="" data-original-title="Share">
                                                    <i class="icon-share"></i>
                                                </button>
                                            </li>
                                            <li>
                                                <button data-toggle="tooltip" data-placement="top" title="" data-original-title="Report Video">
                                                    <i class="icon-flag"></i>
                                                </button>
                                            </li>
                                        </ul><!--df-list end-->
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="about-ch-sec">
                                        <div class="abt-rw">
                                            <h4>Category : </h4>
                                            <ul>
                                                <li><span>${video.category.name}</span></li>
                                            </ul>
                                        </div>
                                        <div class="abt-rw">
                                            <h4>Description : </h4>
                                            <p>${video.description} </p>
                                        </div>
                                    </div><!--about-ch-sec end-->
                                </div><!--abt-mk end-->

                                <div class="cmt-bx">
                                    <ul class="cmt-pr">
                                        <li><span>${fn:length(comments)}</span> Comments</li>
                                    </ul>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <c:choose>
                                        <c:when test="${sessionScope.user == null}">
                                            <div class="vcp_inf pc d-flex justify-content-center align-items-lg-center">
                                                <h1>Login to comment <3</h1>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="vcp_inf pc">
                                                <div class="vc_hd">
                                                    <img src="channelAvatar/${sessionScope.user.avatar}" alt="">
                                                </div>
                                                <form id="commentForm">
                                                    <input type="text" placeholder="Add a public comment" id="commentInput" name="content">
                                                    <button type="button" id="commentBtn">Comment</button>
                                                </form>
                                                <div class="clearfix"></div>
                                                <div class="rt-cmt">
                                                    <div id="clearCommentBtn" style="cursor: pointer">
                                                        <i class="icon-cancel"></i>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div><!--vcp_inf end-->
                                            </div><!--cmt-bx end-->
                                        </c:otherwise>
                                    </c:choose>
                                    <ul class="cmn-lst">
                                        <c:forEach items="${comments}" var="comment" >
                                            <li class="mb-4">
                                                <div class="d-flex">
                                                    <div class="vc_hd">
                                                        <img src="channelAvatar/${comment.channel.avatar}" alt="">
                                                    </div>
                                                    <div class="coments" style="padding-left: 30px">
                                                        <div class="d-flex justify-content-between">
                                                            <div>
                                                                <h2>${comment.channel.channelName} <small class="posted_dt"> . ${comment.date}</small></h2>
                                                                <p>${comment.content} </p>    
                                                            </div>
                                                            <c:if test="${sessionScope.user.username == comment.channel.username}">
                                                                <div class="d-flex">
                                                                    <span class="text-danger mr-2 deleteCommentBtn" data-commentid="${comment.id}" style="cursor: pointer" ><i class="lni lni-cool"></i></span>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                        <c:if test="${comment.totalReply > 0}">
                                                            <ul class="cmn-lst">
                                                                <c:forEach items="${comment.reply}" var="repComment" >
                                                                    <li class="mt-4">
                                                                        <div class="d-flex">
                                                                            <div class="vc_hd" style="width: 50px; height: 50px">
                                                                                <img src="channelAvatar/${repComment.channel.avatar}" alt="">
                                                                            </div>
                                                                            <div class="coments" style="padding-left: 30px">
                                                                                <div class="d-flex justify-content-between">
                                                                                    <div>
                                                                                        <h2>${repComment.channel.channelName} <small class="posted_dt"> . ${repComment.date}</small></h2>
                                                                                        <p>${repComment.content} </p>
                                                                                    </div>
                                                                                    <c:if test="${sessionScope.user.username == repComment.channel.username}">
                                                                                        <div class="d-flex">
                                                                                            <span class="text-danger mr-2 deleteCommentBtn" data-commentid="${repComment.id}" style="cursor: pointer"><i class="lni lni-cool"></i></span>
                                                                                        </div>
                                                                                    </c:if>
                                                                                </div>
                                                                            </div><!--coments end-->
                                                                        </div><!--vcp_inf end-->
                                                                    </li>
                                                                </c:forEach>
                                                            </ul>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user != null}">
                                                            <ul class="cmn-lst">
                                                                <li class="mb-4">
                                                                    <div class="vcp_inf pc">
                                                                        <div class="vc_hd" style="width: 50px; height: 50px">
                                                                            <img src="channelAvatar/${sessionScope.user.avatar}" alt="">
                                                                        </div>
                                                                        <form class="replyCommentForm">
                                                                            <input type="text" placeholder="Reply this comment" id="commentInput" name="content">
                                                                            <button type="button" class="replyCommentBtn" data-comment="${comment.id}">Comment</button>
                                                                        </form>
                                                                        <div class="clearfix"></div>
                                                                        <div class="rt-cmt">
                                                                            <div id="clearCommentBtn" style="cursor: pointer">
                                                                                <i class="icon-cancel"></i>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                        </div><!--vcp_inf end-->
                                                                    </div><!--cmt-bx end-->
                                                                </li>
                                                            </ul>
                                                        </c:if>
                                                    </div><!--coments end-->

                                                </div><!--vcp_inf end-->
                                            </li>
                                        </c:forEach>
                                    </ul><!--comment list end-->
                                </div>
                            </div><!--mn-vid-sc end--->
                        </div><!---col-lg-9 end-->
                        <div class="col-lg-3">
                            <div class="sidebar">
                                <div class="vidz-prt">
                                    <h2 class="sm-vidz">Similar Videos</h2>
                                    <h3 class="aut-vid">
                                    </h3>
                                    <div class="clearfix"></div>
                                </div><!--vidz-prt end-->
                                <div class="videoo-list-ab">
                                    <c:forEach items="${relatedVideos}" var="relatedVideo">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="video?id=${relatedVideo.id}" title="">
                                                    <img src="thumbnail/${relatedVideo.thumbnail}" alt="">
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="video?id=${relatedVideo.id}" title=""> ${relatedVideo.title}</a></h3>
                                                <h4><a href="#" title="">${relatedVideo.channel.channelName}</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <!--bam ra ten kenh-->
                                                <span>${relatedVideo.view} views .<small class="posted_dt"> ${relatedVideo.date}</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </c:forEach>
                                </div><!--videoo-list-ab end-->
                            </div><!--side-bar end-->
                        </div>
                    </div>
                </div>
            </section><!--mn-sec end-->
        </div>

        <script src="./js/jquery.min.js.download"></script>
        <script src="./js/popper.js.download"></script>
        <script src="./js/bootstrap.min.js.download"></script>
        <script src="./js/flatpickr.js.download"></script>
        <script src="./js/script.js.download"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <script type="text/javascript">
            let params = new URLSearchParams(document.location.search);

            const totalLikeElement = document.querySelector("#totalLike");
            let totalLike = ${totalLikes}

            const updateLike = (amount) => {
                totalLikeElement.innerHTML = amount;
            }
            const toggleLikeBtn = document.querySelector("#toggleLikeBtn");
            let isLiked = ${isChannelLikeVideo}
            toggleLikeBtn.onclick = () => {
                isLiked = !isLiked;
                setLike(isLiked);
            }
            const setLike = (isLiked) => {
                if (isLiked) {
                    totalLike++;
                    toggleLikeBtn.innerHTML = '<i class="icon-thumbs_up_fill"></i>';
                    $.ajax({
                        type: "post",
                        url: "/video/like",
                        data: {
                            videoId: params.get("id")
                        },
                        cache: false,
                        success: function (response) {
                            
                        }
                    });
                } else {
                    totalLike--;
                    toggleLikeBtn.innerHTML = '<i class="icon-thumbs_up"></i>';
                    $.ajax({
                        type: "post",
                        url: "/video/unlike",
                        data: {
                            videoId: params.get("id")
                        },
                        cache: false,
                        success: function (response) {
                            
                        }
                    });
                }
                updateLike(totalLike);
            }
            
            const totalSubscribeElement = document.querySelector("#totalSubscribe");
            let totalSubscribe = ${totalSubscribe}

            const updateSubscribe = (amount) => {
                totalSubscribeElement.innerHTML = amount;
            }
            
            const toggleSubscribeBtn = document.querySelector("#toggleSubscribeBtn");
            const subscribeLabel = document.querySelector("#subscribeLabel");
            let isSubscribed = ${isChannelSubscribed}
            toggleSubscribeBtn.onclick = () => {
                isSubscribed = !isSubscribed;
                toggleSubscribeBtn.classList.toggle("btn-outline-dark");
                toggleSubscribeBtn.classList.toggle("btn-dark");
                setSubscribe(isSubscribed);
            }
            const setSubscribe = (isSubscribed) => {
                if(isSubscribed) {
                    totalSubscribe++;
                    subscribeLabel.innerHTML = 'Unsubscribe';
                    $.ajax({
                        type: "post",
                        url: "channel/subscribe",
                        data: {
                            channelUsername: '${video.channel.username}'
                        },
                        cache: false,
                        success: function (response) {
                            
                        }
                    });
                } else {
                    totalSubscribe--;
                    subscribeLabel.innerHTML = 'Subscribe';
                    $.ajax({
                        type: "post",
                        url: "channel/unsubscribe",
                        data: {
                            channelUsername: '${video.channel.username}'
                        },
                        cache: false,
                        success: function (response) {
                            
                        }
                    });
                }
                updateSubscribe(totalSubscribe);
            }

            const commentInput = document.querySelector("#commentInput");
            const clearCommentBtn = document.querySelector("#clearCommentBtn");
            const commentBtn = document.querySelector("#commentBtn");



            commentBtn.onclick = () => {
                const commentForm = document.querySelector("#commentForm");
                const data = new FormData(commentForm);
                data.append("videoId", params.get("id"));
                $.ajax({
                    type: "post",
                    url: "/video/comment",
                    processData: false,
                    contentType: false,
                    enctype: "multipart/form-data",
                    data: data,
                    cache: false,
                    success: function (response) {
                        window.location.reload();
                    }
                });
            }

            clearCommentBtn.onclick = () => {
                commentInput.value = "";
            }

            const replyCommentForms = Array.from(document.querySelectorAll(".replyCommentForm"));
            const replyCommentBtns = Array.from(document.querySelectorAll(".replyCommentBtn"));
            replyCommentBtns.forEach((btn, index) => {
                btn.onclick = () => {
                    let commentForm = replyCommentForms[index];
                    let data = new FormData(commentForm);
                    data.append("videoId", params.get("id"));
                    data.append("commentId", btn.dataset.comment);
                    $.ajax({
                        type: "post",
                        url: "/video/rep-comment",
                        processData: false,
                        contentType: false,
                        enctype: "multipart/form-data",
                        data: data,
                        cache: false,
                        success: function (response) {
                            window.location.reload();
                        }
                    });
                }
            })

            const deleteCommentsBtns = Array.from(document.querySelectorAll(".deleteCommentBtn"));
            deleteCommentsBtns.forEach((btn) => {
                btn.onclick = () => {
                    $.ajax({
                        type: "post",
                        url: "/video/delete-comment",
                        data: {
                            commentId: btn.dataset.commentid
                        },
                        cache: false,
                        success: function (response) {
                            window.location.reload();
                        }
                    });
                }
            })


        </script> 
    </body>
</html>
