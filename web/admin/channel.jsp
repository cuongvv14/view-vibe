<%-- 
    Document   : channel
    Created on : Nov 10, 2023, 12:43:14 AM
    Author     : acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <!-- Fontfaces CSS-->
        <link href="../css/font-face.css" rel="stylesheet" media="all">
        <link href="../vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="../vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="../vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="../vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="../vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="../vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="../vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="../vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="../vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="../vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="../vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="../css/theme.css" rel="stylesheet" media="all">
    </head>
    <body class="animsition">
        <div class="page-wrapper">
            <%@include file="components/header.jsp" %>

            <%@include file="components/sidebar.jsp" %>

            <div class="page-container">
                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <c:forEach items="${channels}" var="channel">
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-header">
                                                <strong class="card-title mb-3">Channel</strong>
                                            </div>
                                            <div class="card-body">
                                                <div class="mx-auto d-block">
                                                    <a class="w-100" href="/admin/video?keyword=${channel.username}">
                                                        <img style="width: 100px; height: 100px" class="rounded-circle mx-auto d-block" src="/channelAvatar/${channel.avatar}" alt="${channel.channelName}">
                                                        <h5 class="text-sm-center mt-2 mb-1">${channel.channelName}</h5>
                                                        <div class="location text-sm-center">${channel.username}</div>
                                                    </a>
                                                </div>
                                                <hr>
                                                <div class="card-text text-sm-center">
                                                    <a href="/channel?username=${channel.username}">
                                                        <i class="fab fa-youtube"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Jquery JS-->
        <script src="../vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="../vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="../vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="../vendor/slick/slick.min.js">
        </script>
        <script src="../vendor/wow/wow.min.js"></script>
        <script src="../vendor/animsition/animsition.min.js"></script>
        <script src="../vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="../vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="../vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="../vendor/circle-progress/circle-progress.min.js"></script>
        <script src="../vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="../vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="../vendor/select2/select2.min.js">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Main JS-->
        <script src="../js/main.js"></script>
    </body>
</html>
