<%-- 
    Document   : login
    Created on : Oct 23, 2023, 3:53:09 PM
    Author     : acer
--%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("user") != null) {
        response.sendRedirect("/");
        return;
    }
%>

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
            

            <section class="form_popup">

                <div class="login_form" id="login_form">
                    <div class="hd-lg">
                        <img src="./Login_files/logo.png" alt="">
                        <span>Log into your Oren account</span>
                    </div><!--hd-lg end-->
                    <div class="user-account-pr">
                        <p class="text-danger">${message}</p>
                        <form method="post" action="login">
                            <div class="input-sec">
                                <input type="text" name="username" placeholder="Username">
                            </div>
                            <div class="input-sec">
                                <input type="Password" name="password" placeholder="Password">
                            </div>
<!--                            <div class="chekbox-lg">
                                <label>
                                    <input type="checkbox" name="remember" value="rem">
                                    <b class="checkmark"> </b>
                                    <span>Remember me</span>
                                </label>
                            </div>-->
                            <div class="input-sec mb-0">
                                <button type="submit">Login</button>
                            </div><!--input-sec end-->
                        </form>
                        <a href="#" onclick="forgotNoti()" title="" class="fg_btn">Forgot password?</a>
                    </div><!--user-account end--->
                    <div class="fr-ps">
                        <h1>Don’t have an account? <a href="/register" title="" class="show_signup">Signup here.</a></h1>
                    </div><!--fr-ps end-->
                </div><!--login end--->

            </section><!--form_popup end-->


        </div>
        <script src="./js/jquery.min.js.download"></script>
        <script src="./js/popper.js.download"></script>
        <script src="./js/bootstrap.min.js.download"></script>
        <script src="./js/flatpickr.js.download"></script>
        <script src="./js/script.js.download"></script>
        <script>
            const forgotNoti = () => {
                alert("Try to remember :D")
            }
        </script>
    </body>
</html>
