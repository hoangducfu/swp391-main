<%@ page import="java.util.List" %>
<%@ page import="model.Event" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=9">
        <meta name="description" content="Gambolthemes">
        <meta name="author" content="Gambolthemes">		
        <title>TicketTicket - Hệ thống mua vé một cách dễ dàng</title>

        <!-- Favicon Icon -->
        <link rel="icon" type="image/png" href="images/fav.png">

        <!-- Stylesheets -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
        <link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/datepicker.min.css" rel="stylesheet">
        <link href="css/jquery-steps.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/night-mode.css" rel="stylesheet">

        <!-- Vendor Stylesheets -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">		
        <link href="vendor/ckeditor5/sample/css/sample.css" rel="stylesheet">
        <style>
            .blur {
                filter: blur(5px);
            }
            .form-control-lg, .btn-lg {
                height: calc(2.5em + 1rem + 2px);
                font-size: 1.25rem;
                line-height: 1.5;
                border-radius: 0.3rem;
            }
            .form-control-lg {
                padding: 1rem 1rem;
            }
            .btn-lg {
                padding: 0.5rem 1rem;
            }
            .selectpicker {
                height: calc(2.5em + 1rem + 2px);
                padding: 0.5rem 1rem;
                font-size: 1.25rem;
                line-height: 1.5;
                border-radius: 0.3rem;
            }
            .controls {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
            }
            .right-select {
                margin-left: auto;
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }
            .full-width-form {
                width: 100%;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .full-width-form button.control, .full-width-form select.right-select {
                margin: 0;
                padding: 0.5rem;
                box-sizing: border-box;
                height: calc(2.5em + 1rem + 2px);
                font-size: 1rem;
            }
            .full-width-form button.control, .full-width-form select.right-select {
                flex: 1;
                margin-right: 0.5rem;
            }
            .full-width-form select.right-select {
                flex: none;
            }
            .control.active {
                background-color: #6AC045;
                color: white;
            }
            .event-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .event-price {
                font-weight: bold;
                margin-top: 8px;
            }
            .event-timing, .event-price {
                display: flex;
                align-items: center;
            }
            .event-price i {
                margin-right: 4px;
                color: #32CD32;
            }

            .wrapp {
                width: 100%;
            }
            .herobanner {
                width: 100%;
                overflow: hidden; /* Prevents content from overflowing */
            }

            /* Ensure the containers take full width and are centered */
            .containers {
                width: 100%;
                max-width: 1200px; /* Optional: Sets a max-width for large screens */
                margin: 0 auto; /* Centers the content horizontally */
            }

            /* Make the carousel take full width */
            #eventCarousel {
                width: 100%;
            }

            /* Flexbox for carousel item content */
            .carousel-item-content {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 20px;
            }

            /* Style for the image container */
            .carousel-image {
                flex: 1;
                max-width: 50%;
                margin-right: 20px; /* Adds space between image and text */
            }

            /* Ensure images fill their container */
            .carousel-image img {
                width: 100%;
                height: auto;
            }

            /* Style for the text container */
            .carousel-text {
                flex: 1;
                max-width: 50%;
            }

            /* Ensure proper spacing and alignment for text */
            .post-meta {
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .post-date {
                display: flex;
                align-items: center;
                margin-bottom: 10px; /* Space between lines */
            }

            .post-date i {
                margin-right: 5px; /* Space between icon and text */
            }

            /* Adjust the carousel controls to fit better */
            .carousel-control-prev, .carousel-control-next {
                width: 5%;
            }

            /* Optional: Add some padding to the carousel controls */
            .carousel-control-prev-icon, .carousel-control-next-icon {
                background-color: rgba(0, 0, 0, 0.5); /* Adds a background color for visibility */
                border-radius: 50%;
            }

            /*phan pagination*/
            .pagination-container {
                display: flex;
                justify-content: center;
                margin: 20px 0; /* Khoảng cách phía trên và dưới của phân trang */
            }

            /* Phần phân trang */
            .pagination {
                display: flex;
                gap: 10px; /* Khoảng cách giữa các liên kết phân trang */
            }

            /* Liên kết phân trang */
            .pagination-link {
                text-decoration: none;
                color: #007bff; /* Màu sắc của liên kết */
                padding: 10px 15px;
                border-radius: 5px;
                border: 1px solid #007bff;
                font-weight: bold;
                transition: background-color 0.3s, color 0.3s;
            }

            /* Màu nền và màu chữ khi di chuột qua liên kết phân trang */
            .pagination-link:hover {
                background-color: #007bff;
                color: #fff;
            }
        </style>



    </head>

    <body class="d-flex flex-column h-100">

        <!-- Header Start-->
        <!--nếu là user-->
        <jsp:include page="header_user.jsp"></jsp:include>
            <!--nếu là staff-->

            <!-- Header End-->
            <!-- Body Start-->
            <div class="wrapper">
                <div class="hero-banner">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-12 col-lg-12 col-md-10">
                                <div class="hero-banner-content">
                                    <h2>Khám phá những sự kiện bạn yêu thích</h2>
                                    <form action="exploreshow?mode=search1" method="post">
                                        <div class="search-form main-form">
                                            <div class="row d-flex justify-content-between">
                                                <div class="col-lg-5 col-md-12">
                                                    <div class="form-group search-category">
                                                        <select  class="form-control form-control-lg" name="lid" >
                                                            <option value="0" data-icon="fa-solid fa-location-dot" ${(lid eq '0')? 'selected' : ''} placeholder="Địa điểm ">Địa điểm</option>
                                                        <c:forEach items="${listlocation}" var="c">
                                                            <option value="${c.getLocationId()}" ${(lid eq c.getLocationId())? 'selected' : ''} >${c.getLocationName()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group search-category">
                                                    <input type="text" class="form-control form-control-lg" name="keyword" value="${keyword}" placeholder="Tìm kiếm theo tên hoặc miêu tả ">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <button type="submit" class="main-btn btn-hover w-100 btn-lg">Tìm kiếm</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapp">
                <div class="herobanner">
                    <div class="containers">
                        <div id="eventCarousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach var="banner" items="${banner}" varStatus="status">
                                    <div class="carousel-item ${status.first ? 'active' : ''}">
                                        <div class="carousel-item-content">
                                            <div class="carousel-image">
                                                <a href="eventdetail?eid=${banner.getEventId()}" class="bbig-img">
                                                    <img src="${banner.eventImg}" class="d-block w-100" alt="${banner.eventName}">
                                                </a>
                                            </div>
                                            <div class="carousel-text">
                                                <div class="post-meta">
                                                    <span class="post-date me-4"><i ></i>${banner.eventName}</span>
                                                    <span class="post-date"><i class="fa-regular fa-calendar-days me-2"></i>${banner.timeStart}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <a class="carousel-control-prev" href="#eventCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#eventCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="explore-events p-80">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-filter-items">
                                <div class="featured-controls">
                                    <div class="controls">
                                        <form action="exploreshow?mode=search2" method="post" class="full-width-form">
                                            <button type="submit" name="cid" value="0" class="control ${(cid eq '0' or cid == null) ? 'active' : ''}">Tất cả</button>
                                            <c:forEach items="${listcategory}" var="s">
                                                <button type="submit" name="cid" class="control ${(cid eq s.getId()) ? 'active' : ''}" value="${s.getId()}">${s.getName()}</button>
                                            </c:forEach> 
                                            <input type="hidden" name="keyword" value="${keyword}"/>
                                            <input type="hidden" name="lid" value="${lid}"/>
                                            <select class="right-select" name="disable" onchange="this.form.submit()">
                                                <option value="2" ${(disable eq '2') ? 'selected' :''}>Tất cả</option>
                                                <option value="0" ${(disable eq '0') ? 'selected' :''}>Sự kiện sắp diễn ra</option>
                                                <option value="1" ${(disable eq '1') ? 'selected' :''}>Sự kiện đã dừng</option>
                                            </select> 
                                        </form>
                                    </div>
                                    <div class="row" data-ref="event-filter-content">
                                        <!--for each-->
                                        <c:forEach items="${listevent}" var="event">
                                            <!--allCategory.get(event.getCategoryID())-->
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix ${event.getEventName()} concert workshops volunteer sports health_Wellness " data-ref="mixitup-target">
                                                <div class="main-card mt-4">
                                                    <div class="event-thumbnail">
                                                        <a href="eventdetail?eid=${event.getEventId()}"  class="thumbnail-img ${(event.getStatusDisable() eq 'true') ? 'blur' :''}">
                                                            <img src="${event.getEventImg()}" alt="">
                                                        </a>
                                                        <c:if test="${not empty account}">
                                                            <span class="bookmark-icon" title="Bookmark"  onClick="addToCart('${event.getEventId()}')"></span>
                                                        </c:if>
                                                    </div>
                                                    <div class="event-content">
                                                        <a href="eventdetail?eid=${event.getEventId()}" class="event-title">${event.getEventName()}</a>
                                                    </div>
                                                    <!--thêm giá tiền-->                                                    
                                                    <div class="event-price">
                                                        <span style="margin-left: 20px"><i class="fa-solid fa-money-bill-wave me-2"></i>Giá chỉ từ ${event.getPriceMin()}đ</span>
                                                    </div>
                                                    <div class="event-footer">
                                                        <div class="event-timing">
                                                            <div class="publish-date">
                                                                <span><i class="fa-solid fa-calendar-day me-2"></i>${event.getTimeStartFormat()}</span>
                                                                <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                            </div>
                                                            <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>${event.getTimePeriod()}</span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <!--for each-->
                                        <div class="pagination-container" style="padding-top: 50px">
                                            <div class="pagination">
                                                <c:forEach begin="1" end="${endP}" var="i">
                                                    <a href="exploreshow?index=${i}&cid=${cid}&keyword=${keyword}&lid=${lid}&disable=${disable}" class="pagination-link ${(index eq i) ? 'active' : ''}">${i}</a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Body End-->
                </body>

                <script src="./js/jquery.min.js" type="text/javascript"></script>
                <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
                <script src="./vendor/OwlCarousel/owl.carousel.js" type="text/javascript"></script>
                <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
                <script src="./vendor/mixitup/dist/mixitup.min.js" type="text/javascript"></script>
                <!--	<script src="js/custom.js"></script>-->
                <script src="./js/night-mode.js" type="text/javascript"></script>
                <script>
                                                                function addToCart(eventId) {
                                                                    fetch('favorite', {
                                                                        method: 'POST',
                                                                        headers: {
                                                                            'Content-Type': 'application/x-www-form-urlencoded'
                                                                        },
                                                                        body: 'eventId=' + encodeURIComponent(eventId)
                                                                    })
                                                                            .then(response => {
                                                                                if (response.ok) {
                                                                                    alert('Sản phẩm đã được thêm vào yêu thích!');
                                                                                    updateCartCount();
                                                                                } else {
                                                                                    alert('Có lỗi xảy ra. Vui lòng thử lại.');
                                                                                }
                                                                            })
                                                                            .catch(error => console.error('Error:', error));
                                                                }

                                                                function updateCartCount() {
                                                                    let cartCountElement = document.getElementById('cart-count');
                                                                    if (cartCountElement) {
                                                                        fetch('GetcardcountServlet') // Cần tạo một Servlet khác để lấy số lượng sản phẩm trong giỏ hàng
                                                                                .then(response => response.text())
                                                                                .then(data => {
                                                                                    cartCountElement.innerText = data;
                                                                                })
                                                                                .catch(error => console.error('Error:', error));
                                                                    }
                                                                }

                                                                document.addEventListener("DOMContentLoaded", function () {
                                                                    updateCartCount();
                                                                });
                </script>
                <script>
                    var containerEl = document.querySelector('[data-ref~="event-filter-content"]');

                    var mixer = mixitup(containerEl, {
                        selectors: {
                            target: '[data-ref~="mixitup-target"]'
                        }
                    });
                </script>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
                </html>
