<%-- 
    Document   : in dex
    Created on : Oct 22, 2023, 3:41:11 PM
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
        <div class="wrapper hp_1">

            <%@include file="components/header.jsp" %>

            <%@include file="components/sideBar.jsp" %>

            <section class="banner-section">
                <div class="container">
                    <div class="banner-text">
                        <h2>Watch share and upload with friends</h2>
                        <a href="https://oren.azyrusthemes.com/index.html?fbclid=IwAR2cOxf4nUcP9jKrt_fadhyUcYWi9nYLsSTueU1AgaiCDRfwIiOCKkaVl6A#" title="">Create my account</a>
                    </div><!--banner-text end-->
                    <h3 class="headline">Video of the Day by <a href="https://oren.azyrusthemes.com/index.html?fbclid=IwAR2cOxf4nUcP9jKrt_fadhyUcYWi9nYLsSTueU1AgaiCDRfwIiOCKkaVl6A#" title="">newfox media</a></h3>
                </div>
            </section><!--banner-section end-->

            <section class="services-sec">
                <div class="container">
                    <div class="services-row">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                <div class="service-col">
                                    <img src="./Oren Video Template_files/sv1.png" alt="">
                                    <h3>Get paid by your fans</h3>
                                    <p>Accept money from your fans through tips.</p>
                                </div><!--service-col end-->
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                <div class="service-col">
                                    <img src="./Oren Video Template_files/sv2.png" alt="">
                                    <h3>Grow your audience</h3>
                                    <p>Join a growing community of young millennialaas &amp; get new fans. </p>
                                </div><!--service-col end-->
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                <div class="service-col">
                                    <img src="./Oren Video Template_files/sv3.png" alt="">
                                    <h3>Simple transfer from YouTube</h3>
                                    <p>Upload your videos from YouTube with an easy link copy/paste.</p>
                                </div><!--service-col end-->
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                <div class="service-col">
                                    <img src="./Oren Video Template_files/sv4.png" alt="">
                                    <h3>Make money with Amazon </h3>
                                    <p>Extra income through Amazon Affiliates on your channel.</p>
                                </div><!--service-col end-->
                            </div>
                        </div>
                    </div><!--services-row end-->
                </div>
            </section><!--services-sec end-->

            <section class="vds-main">
                <div class="vidz-row">
                    <div class="container">
                        <div class="vidz_sec">
                            <h3>Latest Videos</h3>
                            <div class="vidz_list">
                                <div class="row">
                                    <c:forEach items="${videos}" var="video">
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
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
                                                    <h3><a href="video?id=${video.id}" title="">${video.title}</a></h3>
                                                    <h4><a href="channel?username=${video.channel.username}" title="">${video.channel.channelName}</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                    <span>${String.format("%,d", video.view)} views .<small class="posted_dt"> ${video.date}</small></span>
                                                </div>
                                            </div><!--videoo end-->
                                        </div>
                                    </c:forEach>
                                </div>
                            </div><!--vidz_list end-->
                        </div><!--vidz_videos end-->
                    </div>
                </div><!--vidz-row end-->
                <div class="vidz-row">
                    <div class="container">
                        <div class="vidz_sec">
                            <h3>Updates from Subscriptions</h3>
                            <a href="https://oren.azyrusthemes.com/index.html?fbclid=IwAR2cOxf4nUcP9jKrt_fadhyUcYWi9nYLsSTueU1AgaiCDRfwIiOCKkaVl6A#" title="" class="view-btn">View all</a>
                            <div class="vidz_list">
                                <div class="row">
                                    <c:forEach items="${subscribedVideos}" var="video">
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
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
                                                    <h3><a href="video?id=${video.id}" title="">${video.title}</a></h3>
                                                    <h4><a href="channel?username=${video.channel.username}" title="">${video.channel.channelName}</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                    <span>${String.format("%,d", video.view)} views .<small class="posted_dt"> ${video.date}</small></span>
                                                </div>
                                            </div><!--videoo end-->
                                        </div>
                                    </c:forEach>
                                </div>
                            </div><!--vidz_list end-->
                        </div><!--vidz_videos end-->
                    </div>
                </div><!--vidz-row end-->
                <div class="vidz-row">
                    <div class="container">
                        <div class="vidz_sec">
                            <h3>New Videos</h3>
                            <div class="vidz_list">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide13.png" alt="">
                                                    <span class="vid-time">10:21</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Kingdom Come: Deliverance Funny Moments and Fails</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide14.png" alt="">
                                                    <span class="vid-time">13:49</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">DR DISRESPECT - Before They Were Famous - Twitch Streamer</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Eros Now</a> </h4>
                                                <span>283K views .<small class="posted_dt">3 months ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide15.png" alt="">
                                                    <span class="vid-time">2:54</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top Perectly Timed Twitch Moments 2017 #7</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Animal Planet</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <span>2.6M views .<small class="posted_dt">2 months ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide16.png" alt="">
                                                    <span class="vid-time">5:25</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top 5 Amazing Bridge Block ever in PUBG</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Maketzi</a> </h4>
                                                <span>612K views .<small class="posted_dt">5 months ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide17.png" alt="">
                                                    <span class="vid-time">4:01</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Trailer Park Boys Season 12 - Official Trailer</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">ScereBro</a> </h4>
                                                <span>45K views .<small class="posted_dt">3 days ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide18.png" alt="">
                                                    <span class="vid-time">6:20</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">A day in the life of a Google software engineer</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">MathChief</a> </h4>
                                                <span>86K views .<small class="posted_dt">6 days ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide19.png" alt="">
                                                    <span class="vid-time">8:16</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Avengers: Infinity War - Gym Workout motivation 2019</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">RealLifeLore</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <span>144K views .<small class="posted_dt">6 days ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide20.png" alt="">
                                                    <span class="vid-time">29:32</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">How the Universe Works - The Milky Way Galaxy - Space</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Loskes</a></h4>
                                                <span>408K views .<small class="posted_dt">19 hours ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                </div>
                            </div><!--vidz_list end-->
                        </div><!--vidz_videos end-->
                    </div>
                </div><!--vidz-row end-->
                <div class="vidz-row">
                    <div class="container">
                        <div class="vidz_sec">
                            <h3>Popular Videos</h3>
                            <div class="vidz_list">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide1.png" alt="">
                                                    <span class="vid-time">10:21</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Kingdom Come: Deliverance Funny Moments and Fails</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <span>686K views .<small class="posted_dt">1 week ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide2.png" alt="">
                                                    <span class="vid-time">13:49</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">DR DISRESPECT - Before They Were Famous - Twitch Streamer</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Eros Now</a> </h4>
                                                <span>283K views .<small class="posted_dt">3 months ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide3.png" alt="">
                                                    <span class="vid-time">2:54</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top Perectly Timed Twitch Moments 2017 #7</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Animal Planet</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <span>2.6M views .<small class="posted_dt">2 months ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide4.png" alt="">
                                                    <span class="vid-time">5:25</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Top 5 Amazing Bridge Block ever in PUBG</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Maketzi</a> </h4>
                                                <span>612K views .<small class="posted_dt">5 months ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide5.png" alt="">
                                                    <span class="vid-time">4:01</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Trailer Park Boys Season 12 - Official Trailer</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">ScereBro</a> </h4>
                                                <span>45K views .<small class="posted_dt">3 days ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide6.png" alt="">
                                                    <span class="vid-time">6:20</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">A day in the life of a Google software engineer</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">MathChief</a> </h4>
                                                <span>86K views .<small class="posted_dt">6 days ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide7.png" alt="">
                                                    <span class="vid-time">8:16</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">Avengers: Infinity War - Gym Workout motivation 2019</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">RealLifeLore</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <span>144K views .<small class="posted_dt">6 days ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/single_video_page.html" title="">
                                                    <img src="./Oren Video Template_files/vide8.png" alt="">
                                                    <span class="vid-time">29:32</span>
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/single_video_page.html" title="">How the Universe Works - The Milky Way Galaxy - Space</a></h3>
                                                <h4><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Loskes</a></h4>
                                                <span>408K views .<small class="posted_dt">19 hours ago</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                </div>
                            </div><!--vidz_list end-->
                        </div><!--vidz_videos end-->
                    </div>
                </div><!--vidz-row end-->
                <div class="vidz-row pop_channels">
                    <div class="container">
                        <div class="vidz_sec">
                            <h3>Popular Channels</h3>
                            <div class="vidz_list">
                                <div class="row">
                                    <div class="col-lg-2 col-md-4 col-sm-4 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">
                                                    <img src="./Oren Video Template_files/ch1.jpg" alt="">
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">BattleState</a></h3>
                                                <span>230K Followers</span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-4 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">
                                                    <img src="./Oren Video Template_files/ch2.jpg" alt="">
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">BlackPink</a></h3>
                                                <span>191K Followers</span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-4 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">
                                                    <img src="./Oren Video Template_files/ch3.jpg" alt="">
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Vevo</a> <span class="verify_ic"><i class="icon-tick"></i></span></h3>
                                                <span>12M Followers</span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-4 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">
                                                    <img src="./Oren Video Template_files/ch4.jpg" alt="">
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">Official PSY</a> <span class="verify_ic"><i class="icon-tick"></i></span></h3>
                                                <span>48M Followers</span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-4 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">
                                                    <img src="./Oren Video Template_files/ch5.jpg" alt="">
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">People</a></h3>
                                                <span>954K Followers</span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                    <div class="col-lg-2 col-md-4 col-sm-4 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">
                                                    <img src="./Oren Video Template_files/ch6.jpg" alt="">
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="https://oren.azyrusthemes.com/Single_Channel_Home.html" title="">SmTown</a></h3>
                                                <span>1.3M Followers</span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                </div>
                            </div><!--vidz_list end-->
                        </div><!--vidz_videos end-->
                    </div>
                </div><!--vidz-row end-->
            </section><!--vds-main end-->

        </div><!--wrapper end-->




        <script src="./js/jquery.min.js.download"></script>
        <script src="./js/popper.js.download"></script>
        <script src="./js/bootstrap.min.js.download"></script>
        <script src="./js/flatpickr.js.download"></script>
        <script src="./js/script.js.download"></script>
    </body></html>
</html>
