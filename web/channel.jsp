<%-- 
    Document   : channel
    Created on : Oct 29, 2023, 11:00:02 PM
    Author     : acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <div class="wrapper">

            <%@include file="components/header.jsp" %>

            <%@include file="components/sideBar.jsp" %>

            <section class="videso_section">
                <div class="info-pr-sec">
                    <div class="container">
                        <div class="vcp_inf cr">
                            <span class="vc_hd">
                                <img src="channelAvatar/${channel.avatar}" alt="">
                            </span>
                            <div class="vc_info pr">
                                <h4>${channel.channelName} <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                <span>${totalSubscribe} subscribers</span>
                            </div>
                        </div><!--vcp_inf end-->
                        <ul class="chan_cantrz">
                            <c:if test="${sessionScope.user.username == channel.username}">
                                <li> 
                                    <a href="profile" class="btn btn-success" style="border-radius: 30px">
                                        Profile
                                    </a>
                                </li>
                            </c:if>
                            <li>
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
                            </li>
                        </ul><!--chan_cantrz end-->

                        <div class="clearfix"></div>
                    </div>
                </div><!--info-pr-sec end-->
                <div class="history-lst tbY">
                    <div class="container">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="video-tab" data-toggle="tab" href="#video" role="tab" aria-controls="video" aria-selected="true">Videos </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="playlist-tab" data-toggle="tab" href="#playlist" role="tab" aria-controls="playlist" aria-selected="false">Playlist</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="about-tab" data-toggle="tab" href="#about" role="tab" aria-controls="about" aria-selected="false">About</a>
                            </li>
                        </ul><!--nav-tabs end-->
                        <div class="clearfix"></div>
                    </div>
                </div><!--history-lst end-->
                <div class="tab-content p-0" id="myTabContent">
                    <div class="tab-pane fade show active" id="video" role="tabpanel" aria-labelledby="video-tab">
                        <div class="videso_tb_details">
                            <div class="container">
                                <div class="vidz_sec">
                                    <h3>Uploads</h3>
                                    <div class="clearfix"></div>
                                    <div class="vidz_list">
                                        <div class="row">
                                            <c:forEach items="${videos}" var="video">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="video?id=${video.id}" title="">
                                                                <img src="thumbnail/${video.thumbnail}" alt="">
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="video?id=${video.id}" title="">Kingdom Come: Deliverance Funny Moments and Fails</a></h3>
                                                            <h4><a href="channel?username=${video.channel.username}" title="">${video.channel.channelName}</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>${video.view} views .<small class="posted_dt">${video.date}</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div><!--vidz_list end-->
                                </div><!--vidz_videos end-->
                            </div>
                        </div><!--videso_tb_details end-->
                    </div>
                    <div class="tab-pane fade" id="playlist" role="tabpanel">
                        <div class="playlist_tab">
                            <div class="viddz">
                                <div class="container">
                                    <div class="vidz_sec">
                                        <h3>SNL Season 43 Episode 15 Sterling K. Brown - 21</h3>
                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">View all</a>
                                        <div class="clearfix"></div>
                                        <div class="vidz_list">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide1.png" alt="">
                                                                <span class="vid-time">10:21</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Kingdom Come: Deliverance Funny Moments and Fails</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>686K views .<small class="posted_dt">1 week ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide2.png" alt="">
                                                                <span class="vid-time">13:49</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">DR DISRESPECT - Before They Were Famous - Twitch Streamer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Eros Now</a> </h4>
                                                            <span>283K views .<small class="posted_dt">3 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide3.png" alt="">
                                                                <span class="vid-time">2:54</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top Perectly Timed Twitch Moments 2017 #7</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Animal Planet</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>2.6M views .<small class="posted_dt">2 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide4.png" alt="">
                                                                <span class="vid-time">5:25</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top 5 Amazing Bridge Block ever in PUBG</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Maketzi</a> </h4>
                                                            <span>612K views .<small class="posted_dt">5 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                        </div><!--vidz_list end-->
                                    </div><!--vidz_videos end-->
                                </div>
                            </div><!--viddz end-->
                            <div class="viddz">
                                <div class="container">
                                    <div class="vidz_sec">
                                        <h3>Cut for Time: Star Warriors - SNL - 30</h3>
                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">View all</a>
                                        <div class="clearfix"></div>
                                        <div class="vidz_list">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide5.png" alt="">
                                                                <span class="vid-time">4:01</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Trailer Park Boys Season 12 - Official Trailer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">ScereBro</a> </h4>
                                                            <span>45K views .<small class="posted_dt">3 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide6.png" alt="">
                                                                <span class="vid-time">6:20</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">A day in the life of a Google software engineer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">MathChief</a> </h4>
                                                            <span>86K views .<small class="posted_dt">6 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide7.png" alt="">
                                                                <span class="vid-time">8:16</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Avengers: Infinity War - Gym Workout motivation 2019</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">RealLifeLore</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>144K views .<small class="posted_dt">6 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide8.png" alt="">
                                                                <span class="vid-time">29:32</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">How the Universe Works - The Milky Way Galaxy - Space</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Loskes</a></h4>
                                                            <span>408K views .<small class="posted_dt">19 hours ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                        </div><!--vidz_list end-->
                                    </div><!--vidz_videos end-->
                                </div>
                            </div><!--viddz end-->
                            <div class="viddz">
                                <div class="container">
                                    <div class="vidz_sec">
                                        <h3>Natalie Portman is Back - 6</h3>
                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">View all</a>
                                        <div class="clearfix"></div>
                                        <div class="vidz_list">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide9.png" alt="">
                                                                <span class="vid-time">4:01</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Trailer Park Boys Season 12 - Official Trailer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">ScereBro</a> </h4>
                                                            <span>45K views .<small class="posted_dt">3 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide10.png" alt="">
                                                                <span class="vid-time">6:20</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">A day in the life of a Google software engineer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">MathChief</a> </h4>
                                                            <span>86K views .<small class="posted_dt">6 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide11.png" alt="">
                                                                <span class="vid-time">8:16</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Avengers: Infinity War - Gym Workout </a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">RealLifeLore</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>144K views .<small class="posted_dt">6 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide12.png" alt="">
                                                                <span class="vid-time">29:32</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">How the Universe Works - The Milky Way Galaxy - Space</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Loskes</a> </h4>
                                                            <span>408K views .<small class="posted_dt">19 hours ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                        </div><!--vidz_list end-->
                                    </div><!--vidz_videos end-->
                                </div>
                            </div><!--viddz end-->
                            <div class="viddz">
                                <div class="container">
                                    <div class="vidz_sec">
                                        <h3>SNL Season 43 Episode 12 Will Ferrell - 37</h3>
                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">View all</a>
                                        <div class="clearfix"></div>
                                        <div class="vidz_list">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide1.png" alt="">
                                                                <span class="vid-time">10:21</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Kingdom Come: Deliverance Funny Moments and Fails</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>686K views .<small class="posted_dt">1 week ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide2.png" alt="">
                                                                <span class="vid-time">13:49</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">DR DISRESPECT - Before They Were Famous - Twitch Streamer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Eros Now</a> </h4>
                                                            <span>283K views .<small class="posted_dt">3 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide3.png" alt="">
                                                                <span class="vid-time">2:54</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top Perectly Timed Twitch Moments 2017 #7</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Animal Planet</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>2.6M views .<small class="posted_dt">2 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide4.png" alt="">
                                                                <span class="vid-time">5:25</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top 5 Amazing Bridge Block ever in PUBG</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Maketzi</a> </h4>
                                                            <span>612K views .<small class="posted_dt">5 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                        </div><!--vidz_list end-->
                                    </div><!--vidz_videos end-->
                                </div>
                            </div><!--viddz end-->
                            <div class="viddz">
                                <div class="container">
                                    <div class="vidz_sec">
                                        <h3>SNL Season 43 Episode 11 Jessica Chastain - 23</h3>
                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">View all</a>
                                        <div class="clearfix"></div>
                                        <div class="vidz_list">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide1.png" alt="">
                                                                <span class="vid-time">10:21</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Kingdom Come: Deliverance Funny Moments and Fails</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>686K views .<small class="posted_dt">1 week ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide2.png" alt="">
                                                                <span class="vid-time">13:49</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">DR DISRESPECT - Before They Were Famous - Twitch Streamer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Eros Now</a> </h4>
                                                            <span>283K views .<small class="posted_dt">3 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide3.png" alt="">
                                                                <span class="vid-time">2:54</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top Perectly Timed Twitch Moments 2017 #7</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Animal Planet</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>2.6M views .<small class="posted_dt">2 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide4.png" alt="">
                                                                <span class="vid-time">5:25</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top 5 Amazing Bridge Block ever in PUBG</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Maketzi</a> </h4>
                                                            <span>612K views .<small class="posted_dt">5 months ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                        </div><!--vidz_list end-->
                                    </div><!--vidz_videos end-->
                                </div>
                            </div><!--viddz end-->
                            <div class="viddz">
                                <div class="container">
                                    <div class="vidz_sec">
                                        <h3>Kevin Hart is Back - 6</h3>
                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">View all</a>
                                        <div class="clearfix"></div>
                                        <div class="vidz_list">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide5.png" alt="">
                                                                <span class="vid-time">4:01</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Trailer Park Boys Season 12 - Official Trailer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">ScereBro</a> </h4>
                                                            <span>45K views .<small class="posted_dt">3 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide6.png" alt="">
                                                                <span class="vid-time">6:20</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">A day in the life of a Google software engineer</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">MathChief</a> </h4>
                                                            <span>86K views .<small class="posted_dt">6 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide7.png" alt="">
                                                                <span class="vid-time">8:16</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Avengers: Infinity War - Gym Workout motivation 2019</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">RealLifeLore</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                            <span>144K views .<small class="posted_dt">6 days ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-6 full_wdth">
                                                    <div class="videoo">
                                                        <div class="vid_thumbainl">
                                                            <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                                <img src="./Singgle Channel Home_files/vide8.png" alt="">
                                                                <span class="vid-time">29:32</span>
                                                                <span class="watch_later">
                                                                    <i class="icon-watch_later_fill"></i>
                                                                </span>
                                                            </a>	
                                                        </div><!--vid_thumbnail end-->
                                                        <div class="video_info">
                                                            <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">How the Universe Works - The Milky Way Galaxy - Space</a></h3>
                                                            <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">Loskes</a></h4>
                                                            <span>408K views .<small class="posted_dt">19 hours ago</small></span>
                                                        </div>
                                                    </div><!--videoo end-->
                                                </div>
                                            </div>
                                        </div><!--vidz_list end-->
                                    </div><!--vidz_videos end-->
                                </div>
                            </div><!--viddz end-->
                        </div><!--home_tb_details end-->
                    </div>
                    <div class="tab-pane fade" id="about" role="tabpanel">
                        <div class="about_tab_content">
                            <div class="container">
                                <div class="description">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="decp_cotnet">
                                                <h2 class="ab-fd">Description </h2>
                                                <p>${channel.description}</p>
                                            </div><!--abt-founder end-->
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="stats">
                                                <h2 class="ab-fd">Stats</h2>
                                                <ul>
                                                    <li>Joined ${channel.date}</li>
                                                    <li>${totalView} views</li>
                                                    <li>${totalSubscribe} subscribers</li>
                                                    <li>${videos.size()} videos</li>
                                                </ul>
                                            </div><!--stats end-->
                                            <div class="flagg">
                                                <ul>
                                                    <li>
                                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                            <i class="icon-flag"></i>
                                                        </a>		
                                                    </li>
                                                    <li>
                                                        <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html#" title="">
                                                            <i class="icon-message"></i>
                                                        </a>		
                                                    </li>
                                                </ul>
                                            </div><!--flagg end-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!--about_tab_content end-->
                    </div>
                </div>
            </section><!--Featured Videos end-->
        </div><!--wrapper end-->

        <script src="js/jquery.min.js.download" type="text/javascript"></script>
        <script src="js/popper.js.download" type="text/javascript"></script>
        <script src="js/bootstrap.min.js.download" type="text/javascript"></script>
        <script src="js/flatpickr.js.download" type="text/javascript"></script>
        <script src="js/script.js.download" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>


            let params = new URLSearchParams(document.location.search);

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
                if (isSubscribed) {
                    totalSubscribe++;
                    subscribeLabel.innerHTML = 'Unsubscribe';
                    $.ajax({
                        type: "post",
                        url: "channel/subscribe",
                        data: {
                            channelUsername: params.get("username")
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
                            channelUsername: params.get("username")
                        },
                        cache: false,
                        success: function (response) {

                        }
                    });
                }
                updateSubscribe(totalSubscribe);
            }
        </script>
    </body>
</html>
