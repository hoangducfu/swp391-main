<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/venue_event_detail_view.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=9">
        <meta name="description" content="Gambolthemes">
        <meta name="author" content="Gambolthemes">		
        <title>Barren - Simple Online Event Ticketing System</title>

        <!-- Favicon Icon -->
        <link rel="icon" type="image/png" href="images/fav.png">

        <!-- Stylesheets -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
        <link href='./vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="./css/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="./css/night-mode.css" rel="stylesheet" type="text/css"/>
        <link href="./css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Vendor Stylesheets -->		
        <link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="./vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet" type="text/css"/>
        <link href="./vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet" type="text/css"/>
        <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>			

    </head>
    <body class="d-flex flex-column h-100">
        <!-- Header Start-->
        <!-- Header End-->
        <!-- Body Start-->
        <div class="wrapper">

            <div class="event-dt-block p-80">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-top-dts">
                                <div class="event-top-dt">
                                    <h3 class="event-main-title">${event.getEventName()} </h3>
                                    <div class="event-top-info-status">
                                        <span class="event-type-name"><i class="fa-solid fa-location-dot"></i>${location.getLocationName()}</span>
                                        <span class="event-type-name details-hr">Bắt đầu lúc <span class="ev-event-date">${event.getTimeStartFormat()}</span></span>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-7 col-md-12">
                            <div class="main-event-dt">
                                <div class="event-img">
                                    <img src="${event.eventImg}" alt="">		
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 col-md-12">
                            <div class="main-card event-right-dt">
                                <div class="bp-title">
                                    <h4>Event Details</h4>
                                </div>
                                <div class="event-dt-right-group">
                                    <div class="event-dt-right-icon">
                                        <i class="fa-solid fa-calendar-day"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <h4>Thời Gian Bắt Đầu</h4>
                                        <h5>${event.getTimeStartFormat()} </h5>
                                    </div>
                                </div>
                                <div class="event-dt-right-group">
                                    <div class="event-dt-right-icon">
                                        <i class="fa-solid fa-calendar-day"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <h4>Thời Lượng</h4>
                                        <h5>${event.getTimePeriod()}</h5>
                                    </div>
                                </div>
                                <div class="event-dt-right-group">
                                    <div class="event-dt-right-icon">
                                        <i class="fa-solid fa-location-dot"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <h4>Địa chỉ</h4>
                                        <h5 class="mb-0">${location.getLocationName()}</h5>
                                        <a href="https://www.google.com/maps/search/${location.getLocationName()}" target="_blank"><i class="fa-solid fa-location-dot me-2"></i>Xem Map</a>
                                    </div>
                                </div>
                                <div class="select-tickets-block">
                                    <h6>Mô tả sự kiện</h6>
                                    <p>${event.description}</p>

                                </div>
                                <!--kiểm tra role của của account-->
                                <c:if test="${(account.getRoleid() eq '2')}">
                                    <c:if test="${event.getStatusDisable() eq 'false'}">
                                        <div class="booking-btn">
                                            <a href="eventdetail?eid=${event.getEventId()}&action=disable" class="main-btn btn-hover w-100">Tạm Dừng Sự Kiện</a>
                                        </div>
                                    </c:if>
                                    <c:if test="${event.getStatusDisable() eq 'true'}">
                                        <div class="booking-btn">
                                            <h2 style="color: red">  Sự Kiện Đã Đóng </h2>
                                        </div>
                                    </c:if>
                                </c:if>
                                <c:if test="${!(account.getRoleid() eq '3')}">
                                    <div class="booking-btn">
                                        <a href="controllerseat?eid=${event.getEventId()}" class="main-btn btn-hover w-100">Mua Vé </a>
                                    </div>
                                </c:if>


                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>

    <script src="./js/jquery.min.js" type="text/javascript"></script>
    <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="./vendor/OwlCarousel/owl.carousel.js" type="text/javascript"></script>
    <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="./vendor/mixitup/dist/mixitup.min.js" type="text/javascript"></script>
    <!--	<script src="js/custom.js"></script>-->
    <script src="./js/night-mode.js" type="text/javascript"></script>
</body>

<!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/venue_event_detail_view.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:55 GMT -->
</html>