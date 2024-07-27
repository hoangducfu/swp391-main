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
        <title>TicketTicket - Hệ thống mua vé một cách dễ dàng</title>
		
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
        <c:if test="${(account.getType() == 'customer')}">
            <jsp:include page="header_user.jsp"></jsp:include>
        </c:if>
        <!--nếu là staff-->
        <c:if test="${(account.getType() == 'staff')}">
            <c:if test="${account.getRoleId() eq '1'}"> 
                <jsp:include page="header_admin.jsp" ></jsp:include>
            </c:if>
            <c:if test="${account.getRoleId() eq '2'}"> 
                <jsp:include page="header_staff.jsp" ></jsp:include>
            </c:if>
        </c:if>
        <!-- Header End-->
        <!-- Body Start--> 
        <c:set var="back" value="exploreshow"/> 
        <c:if test="${(account.getType() eq 'customer')}">
            <c:set var="back" value="exploreshow"/> 
        </c:if>
        <!--nếu là staff-->
        <c:if test="${(account.getType() eq 'staff')}">
            <c:if test="${account.getRoleId() eq '1'}"> 
                <c:set var="back" value="adminevent"/> 
            </c:if>
            <c:if test="${account.getRoleId() eq '2'}"> 
                <c:set var="back" value="staffevent"/> 
            </c:if>
        </c:if>
       
        <div class="wrapper">

            <div class="event-dt-block p-80">
                <div class="container">
                    <div class="back-button mt-3" style="padding-bottom: 20px   ">

                        <a href="${back}" class="main-btn btn-hover">
                            <i class="fas fa-arrow-left me-2"></i> Quay Lại
                        </a>
                    </div>  

                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-top-dts">
                                <div class="event-top-date">
                                    <span class="event-month">Tháng ${event.getTimeStart().substring(5,7)}</span>
                                    <span class="event-date">${event.getTimeStart().substring(8,10)}</span>
                                </div>
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
                                <div class="main-event-content">
                                    <h4>Giới thiệu</h4>
                                    <p>${event.description}</p>
                                </div>
                                <c:if test="${(account.getType() == 'staff')}">
                                    <div class="back-button mt-3" style="padding-bottom: 20px   ">
                                        <a href="discount?eventId=${event.getEventId()}" class="main-btn btn-hover">
                                            <i></i> Tạo mã giảm giá
                                        </a>
                                    </div> 
                                </c:if>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 col-md-12">
                            <div class="main-card event-right-dt">
                                <div class="bp-title">
                                    <h4>Chi Tiết Sự Kiện</h4>
                                </div>
                                <div class="time-left">
                                    <div class="countdown">
                                        <div class="countdown-item">
                                            <span id="day"></span>days
                                        </div>  
                                        <div class="countdown-item">							
                                            <span id="hour"></span>Hours
                                        </div>
                                        <div class="countdown-item">
                                            <span id="minute"></span>Minutes
                                        </div> 
                                        <div class="countdown-item">
                                            <span id="second"></span>Seconds
                                        </div>														
                                    </div>
                                </div>
                                <div class="event-dt-right-group mt-5">
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
                                        <h4>Địa Chỉ</h4>
                                        <h5 class="mb-0">${location.getLocationName()}</h5>
                                        <a href="https://www.google.com/maps/search/${location.getLocationName()}" target="_blank"><i class="fa-solid fa-location-dot me-2"></i>Xem Map</a>
                                    </div>
                                </div>
                                <div class="event-dt-right-group">
                                    <div class="event-dt-right-icon">
                                        <i class="fa-solid fa-chair"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <h4>Số ghế còn lại</h4>
                                        <h5 class="mb-0">${seats}</h5>
                                    </div>
                                </div>
                                <div class="event-dt-right-group">
                                    <div class="event-dt-right-icon">
                                        <i class="fa-solid fa-money-bill-wave me-2"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <h4>Giá chỉ từ</h4>
                                        <h5 class="mb-0">${event.getPriceMin()}đ</h5>
                                    </div>
                                </div>
                                <c:if test="${(account.getType() eq 'staff')}">
                                    <div class="booking-btn">
                                        <a href="controllerseat?eid=${event.getEventId()}" class="main-btn btn-hover w-100">Xem Ghế</a>
                                    </div>

                                </c:if>

                                <c:if test="${event.getStatusDisable() eq 'false'}">
                                    <c:if test="${(account.getType() eq 'customer')}">
                                        <div class="booking-btn">
                                            <a href="controllerseat?eid=${event.getEventId()}" class="main-btn btn-hover w-100">Mua Vé </a>
                                        </div>
                                    </c:if>
                                    <c:if test="${(account.getType() eq 'staff')}">
                                        <c:if test="${(account.getId() eq event.getStaffId())||(account.getRoleId() eq '1')}">
                                            <div class="booking-btn">
                                                <a href="eventdetail?eid=${event.getEventId()}&action=disable" class="main-btn btn-hover w-100">Hủy Sự Kiện</a>
                                            </div>
                                            <div class="booking-btn">
                                                <a href="eventdetail?eid=${event.getEventId()}&action=pause" class="main-btn btn-hover w-100">Dừng bán vé</a>
                                            </div>
                                        </c:if>
                                        <c:if test="${!(account.getId() eq event.getStaffId())}">

                                        </c:if>

                                    </c:if>
                                </c:if>
                                <c:if test="${event.getStatusDisable() eq 'true'}">
                                    <div class="booking-btn">
                                        <h2 style="color: red">  Sự Kiện Đã Đóng </h2>
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
    <script>
        // Chuyển đổi thời gian kết thúc từ phía server sang JavaScript
        var eventTimeEnd = "${event.getTimeStart()}".replace(" ", "T");

        // Tạo đối tượng Date từ thời gian kết thúc
        var endDate = new Date(eventTimeEnd).getTime();

        // Cập nhật đồng hồ đếm ngược mỗi giây
        var countdownFunction = setInterval(function () {
            // Lấy thời gian hiện tại
            var now = new Date().getTime();

            // Tính toán khoảng cách giữa hiện tại và thời gian kết thúc
            var distance = endDate - now;

            // Kiểm tra nếu đã kết thúc
            if (distance <= 0) {
                clearInterval(countdownFunction); // Dừng đồng hồ đếm ngược

                // Đặt giá trị đồng hồ đếm ngược về 0
                document.getElementById("day").innerHTML = "0";
                document.getElementById("hour").innerHTML = "0";
                document.getElementById("minute").innerHTML = "0";
                document.getElementById("second").innerHTML = "0";
            } else {
                // Tính toán số ngày, giờ, phút, giây còn lại
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Hiển thị kết quả lên các phần tử HTML tương ứng
                document.getElementById("day").innerHTML = days;
                document.getElementById("hour").innerHTML = hours;
                document.getElementById("minute").innerHTML = minutes;
                document.getElementById("second").innerHTML = seconds;
            }
        }, 1000);
    </script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


</body>

<!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/venue_event_detail_view.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:55 GMT -->
</html>