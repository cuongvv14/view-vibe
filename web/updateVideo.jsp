<%-- 
    Document   : uploadVideo
    Created on : Nov 2, 2023, 10:24:03 PM
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
            <section class="upload-detail d-none" id="uploadDetail">
                <div class="container">
                    <h3> Update Details</h3>
                    <div class="vid_thumbainl tr">
                        <a class="newVideoLink" href="video?id=${video.id}" title="">
                            <img id="previewThumbnail" src="" alt="">
                        </a>	
                    </div><!--vid_thumbnail tr end-->
                    <div class="video_info sr">
                        <h3><a class="newVideoLink" href="video?id=${video.id}" title="" id="previewTitle"></a></h3>
                        <h4><span id="uploadPercent">0</span>%</h4>
                        <div class="progress">
                            <div id="progressBar" class="progress-bar" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                                <span class="sr-only"/>
                            </div>
                        </div>
                        <p id="previewMsg"> Your Video is still uploading, please keep this page open util it’s done.</p>
                    </div><!--video end-->
                    <div class="clearfix"></div>
                </div>
            </section><!--upload-detail end-->


            <section class="vid-title-sec">
                <div class="container">
                    <form>
                        <div class="vid-title">
                            <h2 class="title-hd">Video Title </h2>
                            <div class="form_field">
                                <input type="text" name="title" id="title" placeholder="Add here (99 characters remaining)" value="${video.title}">
                            </div>
                        </div><!--vid-title-->
                        <div class="abt-vidz-pr">
                            <h2 class="title-hd"> About </h2>
                            <div class="form_field">
                                <textarea placeholder="Description" id="description">${video.description}</textarea>
                            </div>
                        </div><!--abt-vidz-->
                        <div class="abt-vidz-pr">
                            <h2 class="title-hd"> Thumbnail </h2>
                            <div class="form_field">
                                <input type="file" name="thumbnail" id="thumbnail" accept=".jpg, .png">
                            </div>
                        </div><!--abt-vidz-->
                        <div class="category">
                            <h2 class="title-hd">Category</h2>
                            <div class="category-typ">
                                <ul class="catgss_list">
                                    <c:forEach items="${categories}" var="c">
                                        <li>
                                            <div class="chekbox-lg">
                                                <label>
                                                    <input class="category" type="radio" name="category" value="${c.id}" ${video.category.id == c.id ? "checked" : ""}>
                                                    <b class="checkmark"></b>
                                                    <span>${c.name}</span>
                                                </label>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <div class="clearfix"></div>
                                <div class="btn-sbmit">
                                    <button type="button" id="uploadBtn">Save</button>
                                </div><!--btn-sbmit end-->
                            </div><!--category-typ-->
                        </div><!--Category-->
                    </form>
                </div>
            </section><!--vid-title-sec-->
        </div>

        <script src="./js/jquery.min.js.download"></script>
        <script src="./js/popper.js.download"></script>
        <script src="./js/bootstrap.min.js.download"></script>
        <script src="./js/flatpickr.js.download"></script>
        <script src="./js/script.js.download"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            let title = document.querySelector("#title");
            let description = document.querySelector("#description");
            let thumbnail = document.querySelector("#thumbnail");
            let categoryId;

            const uploadDetail = document.querySelector("#uploadDetail");
            let newVideoLinks = Array.from(document.querySelectorAll(".newVideoLink"));
            let previewTitle = document.querySelector("#previewTitle");
            let previewThumbnail = document.querySelector("#previewThumbnail");
            let uploadPercent = document.querySelector("#uploadPercent");
            let progressBar = document.querySelector("#progressBar");
            let previewMsg = document.querySelector("#previewMsg");

            const setUploadDetail = () => {

                uploadDetail.classList.remove("d-none");
                previewTitle.innerHTML = title.value;
                previewThumbnail.src = "thumbnail/" + getThumbnail();
                let percent = 0;
                let progress = setInterval(() => {
                    if (percent >= 100) {
                        clearInterval(progress);
                        previewMsg.innerHTML = "Update successfully!"
                    } else {
                        percent++;
                        progressBar.style.width = percent + "%";
                        uploadPercent.innerHTML = percent;
                        previewMsg.innerHTML = "Your Video is still updating, please keep this page open util it’s done."
                    }
                }, 100)
            }
            
            let params = new URLSearchParams(document.location.search);
            const uploadBtn = document.querySelector("#uploadBtn");
            
            const getThumbnail = () => {
                if(typeof thumbnail.files[0] === 'undefined') {
                    return '${video.thumbnail}'
                }
                return thumbnail.files[0].name;
            }
            uploadBtn.onclick = () => {
                $.ajax({
                    type: "post",
                    url: "/update-video",
                    data: {
                        videoId: params.get("id"),
                        title: title.value,
                        description: description.value,
                        thumbnail: getThumbnail(),
                        categoryId: document.querySelector('.category[name="category"]:checked').value
                    },
                    cache: false,
                    success: function (response) {
                        newVideoLinks.forEach(a => {
                            a.href = "video?id=" + params.get("id");
                        });
                    }
                });
                setUploadDetail();
            };
        </script>
    </body>
</html>
