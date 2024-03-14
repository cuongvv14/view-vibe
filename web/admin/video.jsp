<%-- 
    Document   : video
    Created on : Nov 7, 2023, 4:20:50 AM
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
                <!-- MAIN CONTENT-->
                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- DATA TABLE -->
                                    <h3 class="title-5 m-b-35">Videos</h3>
                                    <div class="table-data__tool">
                                        <div class="table-data__tool-left d-flex align-items-center">
                                            <form class="form-header mr-2" action="/admin/video" method="GET">
                                                <input class="au-input au-input--w435" type="text" name="keyword" placeholder="Search..." value="${param.keyword}"/>
                                                <button class="au-btn--submit" type="submit">
                                                    <i class="zmdi zmdi-search"></i>
                                                </button>
                                            </form>
                                        </div>
                                        <!--                                        <div class="table-data__tool-right">
                                                                                    <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                                                                        <i class="zmdi zmdi-plus"></i>new video
                                                                                    </button>
                                                                                </div>-->
                                    </div>
                                    <div class="table-responsive table-responsive-data2">
                                        <table class="table table-data2">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>title</th>
                                                    <th>view</th>
                                                    <th>category</th>
                                                    <th>date</th>
                                                    <th>user</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${videos}" var="video">
                                                    <tr class="tr-shadow">
                                                        <td>
                                                            <a href="/video?id=${video.id}" target="_blank">
                                                                <img src="/thumbnail/${video.thumbnail}" style="height: 100px">
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <p style="max-width: 200px">${video.title}</p>
                                                        </td>
                                                        <td>
                                                            <span class="block-email">${video.view}</span>
                                                        </td>
                                                        <td class="desc">${video.category.name}</td>
                                                        <td>${video.date}</td>
                                                        <td>
                                                            <span class="block-email">${video.channel.username}</span>
                                                        </td>
                                                        <td>
                                                            <div class="table-data-feature">
                                                                <a href="/video?id=${video.id}" target="_blank" class="item" data-toggle="tooltip" data-placement="top" title="Watch">
                                                                    <i class="fas fa-external-link-alt"></i>
                                                                </a>
                                                                <!--                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                                                                                                    <i class="zmdi zmdi-edit"></i>
                                                                                                                                </button>-->
                                                                <button class="item deleteBtn" data-toggle="tooltip" data-placement="top" data-id="${video.id}" data-channel="${video.channel.id}"title="Delete">
                                                                    <i class="zmdi zmdi-delete"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr class="spacer"></tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- END DATA TABLE -->
                                </div>
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

        <script>
            const deleteBtns = Array.from(document.querySelectorAll(".deleteBtn"));
            deleteBtns.forEach(btn => {
                btn.onclick = () => {
                    $.ajax({
                    type: "post",
                            url: "/admin/video/delete",
                            data: {
                            videoId: btn.dataset.id,
                                    videoChannel: btn.dataset.channel
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
