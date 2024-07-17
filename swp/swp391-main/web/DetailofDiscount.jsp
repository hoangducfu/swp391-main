<%-- 
    Document   : DetailofDiscount
    Created on : Jul 15, 2024, 2:54:50 AM
    Author     : Admin
--%>
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
                height: calc(2.5em + 1rem + 2px); /* Tăng chiều cao để chúng đồng đều */
                font-size: 1.25rem;
                line-height: 1.5;
                border-radius: 0.3rem;
            }
            .form-control-lg {
                padding: 1rem 1rem; /* Điều chỉnh đệm để phù hợp với chiều cao mới */
            }
            .btn-lg {
                padding: 0.5rem 1rem;
            }
            .selectpicker {
                height: calc(2.5em + 1rem + 2px); /* Tăng chiều cao để chúng đồng đều */
                padding: 0.5rem 1rem;
                font-size: 1.25rem;
                line-height: 1.5;
                border-radius: 0.3rem;
            }
            .controls {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%; /* Đảm bảo phần tử controls chiếm toàn bộ chiều rộng */
            }

            .right-select {
                margin-left: auto; /* Đẩy thẻ select về phía phải */
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            /* Đặt form để chiếm toàn bộ chiều rộng màn hình và loại bỏ padding/margin */
            .full-width-form {
                width: 100%;
                margin: 0;
                padding: 0;
            }

            /* Đặt các button và select để căn chỉnh đúng cách và không có khoảng cách thừa */
            .full-width-form button.control, .full-width-form select.right-select {
                margin: 0;
                padding: 0.5rem; /* Đệm bên trong */
                box-sizing: border-box; /* Đảm bảo padding được bao gồm trong chiều rộng/tổng */
                height: calc(2.5em + 1rem + 2px); /* Chiều cao nhất quán */
                font-size: 1rem; /* Cỡ chữ phù hợp */
            }

            /* Căn chỉnh các button và select theo chiều ngang */
            .full-width-form {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            /* Đảm bảo button và select không bị tràn */
            .full-width-form button.control, .full-width-form select.right-select {
                flex: 1; /* Đảm bảo các phần tử chiếm toàn bộ không gian cần thiết */
                margin-right: 0.5rem; /* Khoảng cách giữa các phần tử */
            }

            .full-width-form select.right-select {
                flex: none; /* Không cho phép select chiếm không gian linh hoạt */
            }
            .control.active {
                background-color: #6AC045; /* Màu nền sáng đèn */
                color: white; /* Màu chữ */
            }

            /*css cho giá tiền phần show các sự kiện*/

            .event-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .event-price {
                font-weight: bold;
                /*                color: #007bff;  Màu sắc cho giá tiền */
                margin-top: 8px; /* Khoảng cách trên */
            }

            .event-timing, .event-price {
                display: flex;
                align-items: center;
            }

            .event-price i {
                margin-right: 4px; /* Khoảng cách giữa icon và giá tiền */
                color: #32CD32; /* Màu sắc cho biểu tượng, bạn có thể thay đổi màu theo ý thích */
            }
        </style>

        <style>
            .explore-events{
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>

    </head>

    <body class="d-flex flex-column h-100">

        <!-- Header Start-->
        <!--nếu là user-->
         <c:if test="${(account.getType() == 'customer')}">
            <jsp:include page="header_user.jsp"></jsp:include>
        </c:if>
        <!--nếu là staff-->
        <c:if test="${(account.getType() == 'staff')}">
            <jsp:include page="header_staff.jsp" ></jsp:include>
        </c:if>
<c:if test="${(account.getType() != 'customer')}">
            <jsp:include page="header_user.jsp"></jsp:include>
        </c:if>

        <!-- Header End-->
        <!-- Body Start-->
        <div class="wrapper">
<div class="hero-banner">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-12 col-lg-12 col-md-10">
                        <div class="hero-banner-content">
                            <form action="ListDiscount" method="post">
                                <div class="search-form main-form">
                                    <div class="row g-3" style="display: flex; justify-content: center">
                                        <h2>Chi tiết của mã giảm giá </h2>
                                       
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="explore-events p-80" >
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-filter-items">
                                <div class="featured-controls">


                                    <div class="row" data-ref="event-filter-content" style="display: flex; justify-content: center">
                                        <!--for each-->

                                        <c:choose>
                                            <c:when test="${not empty discount}">
                                                <div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 mix ${discount.code} concert workshops volunteer sports health_Wellness" data-ref="mixitup-target">
                                                    <div class="main-card mt-4">
                                                        <div class="event-thumbnail" style="display: flex; justify-items:  center">
                                                            <img src="image/icon/banner.png" alt="" style="width: 300px"/>
                                                        </div>
                                                        <div class="event-content">
                                                            <p class="event-title" style="font-size: 1.5em; font-weight: bold; display: inline;">Mã giảm giá: </p>
                                                            <h1 class="event-title" style="font-size: 2.5em; font-weight: bold; color: #ff0000; display: inline;">${discount.code}</h1>
                                                            <p style="margin: 0px; padding-top: 15px;font-weight: bold">Ưu đãi:</p>
                                                            <p style="margin: 0px; padding-left:  15px">+ Lượt sử dụng có hạn. Nhanh tay kẻo lỡ bạn nhé!</p>
                                                            <p style="margin: 0px; padding-left:  15px">+ Mã giảm giá này giảm ${discount.discountPercent}% tổng giá trị đơn hàng của bạn.</p>
                                                            <a >

                                                                <c:set var="eventName" value="N/A"/> <!-- Default value -->
                                                                <c:forEach var="e" items="${listevent}">
                                                                    <c:if test="${discount.eventID == e.eventId}">
                                                                        <c:set var="eventName" value="${e.eventName}" />
                                                                    </c:if>
                                                                </c:forEach>
                                                                <p style="margin: 0px; padding-top: 15px;font-weight: bold;font-size: 1.5em;"> Ưu đãi với sự kiện:
                                                                    <a href="eventdetail?eid=${discount.eventID}">${eventName}</a> </p>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <p>Không tìm thấy mã giảm giá.</p>
                                            </c:otherwise>
                                        </c:choose>

                                        <!--for each-->
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
    <script src="./js/night-mode.js" type="text/javascript"></script>\
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
                fetch('GetcarcountServlet') // Cần tạo một Servlet khác để lấy số lượng sản phẩm trong giỏ hàng
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

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
</html>

