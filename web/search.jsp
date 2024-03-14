<%-- 
    Document   : search
    Created on : Oct 26, 2023, 8:52:36 PM
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


        <div class="wrapper hp_1">

            <%@include file="components/header.jsp" %>

            <%@include file="components/sideBar.jsp" %>


            <section class="vds-main mt-4">
                <div class="container">
                    <div class="vidz_list m-0">
                        <div class="row">
                            <c:choose>
                                <c:when test="${videos.size() == 0}">
                                    <div class="d-flex align-items-center justify-content-center w-100">No video found :(</div>
                                </c:when>
                                <c:otherwise>
                                    
                                <c:forEach items="${videos}" var="video">

                                    <div class="col-lg-3 col-md-6 col-sm-6 col-6 full_wdth">
                                        <div class="videoo">
                                            <div class="vid_thumbainl">
                                                <a href="/video?id=${video.id}" title="">
                                                    <img src="/thumbnail/${video.thumbnail}" alt="">
                                                    <span class="watch_later">
                                                        <i class="icon-watch_later_fill"></i>
                                                    </span>
                                                </a>	
                                            </div><!--vid_thumbnail end-->
                                            <div class="video_info">
                                                <h3><a href="/video?id=${video.id}" title="">${video.title}</a></h3>
                                                <h4><a href="channel?username=${video.channel.username}" title="">${video.channel.channelName}</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
                                                <span>${video.view} views .<small class="posted_dt">${video.date}</small></span>
                                            </div>
                                        </div><!--videoo end-->
                                    </div>
                                </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            </div>
                        </div><!--vidz_list end-->
                    </div>

                </section><!--vds-main end-->
            </div>
            <script src="./js/jquery.min.js.download"></script>
            <script src="./js/popper.js.download"></script>
            <script src="./js/bootstrap.min.js.download"></script>
            <script src="./js/flatpickr.js.download"></script>
            <script src="./js/script.js.download"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        </body>
    </html>
