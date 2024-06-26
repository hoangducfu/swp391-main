<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="header_user.jsp" %>

<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:06:46 GMT -->
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
        <link href='${pageContext.request.contextPath}/vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/night-mode.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Vendor Stylesheets -->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">		

    </head>

    <body class="d-flex flex-column h-100">
        <!-- Body Start-->
        <div class="wrapper">
            <div class="profile-banner">
                <div class="hero-cover-block">
                    <div class="hero-cover">
                        <div class="hero-cover-img"></div>	
                    </div>
                </div>
                <div class="user-dt-block">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-4 col-lg-5 col-md-12">
                                <div class="main-card user-left-dt">
                                    <div class="user-avatar-img">
                                        <img src="images/fav.png" alt="">
                                    </div>
                                    <div class="user-dts">
                                        <c:set var="atPosition" value="${fn:indexOf(user.username, '@')}" />
                                        <c:set var="shortUsername" value="${fn:substring(user.username, 0, atPosition)}" />                                        <h4 class="user-name">${shortUsername}<span class="verify-badge"><i class="fa-solid fa-circle-check"></i></span></h4>
                                        <span class="user-email"> <c:set var="user" value="${account}" />

                                            <h5>${user.username}</h5></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8 col-lg-7 col-md-12">
                                <div class="right-profile">
                                    <div class="profile-tabs">
                                        <ul class="nav nav-pills nav-fill p-2 garren-line-tab" id="myTab" role="tablist">

                                            <li class="nav-item">
                                                <a class="nav-link" id="about-tab" selected data-bs-toggle="tab" href="#about" role="tab" aria-controls="about" aria-selected="true"><i class="fa-solid fa-circle-info"></i>Thông tin tài khoản</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade active show" id="feed" role="tabpanel" aria-labelledby="feed-tab">

                                                <div class="tab-content">
                                                    <div class="tab-pane fade" id="organised" role="tabpanel">
                                                        <div class="row">	
                                                            <div class="col-md-12">														
                                                                <div class="main-card mt-4">
                                                                    <div class="card-top p-4">
                                                                        <div class="card-event-img">
                                                                            <img src="images/event-imgs/img-6.jpg" alt="">
                                                                        </div>
                                                                        <div class="card-event-dt">
                                                                        </div>
                                                                    </div>																
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="about" role="tabpanel" aria-labelledby="about-tab">
                                                <div class="main-card mt-4">
                                                    <div class="bp-title position-relative">
                                                        <h4>Thông tin</h4>
                                                    </div>
                                                    <div class="about-details">
                                                        <div class="about-step">
                                                            <h5>Mật khẩu:</h5>
                                                            <span>*************</span>
                                                        </div>
                                                        <div class="about-step">
                                                            <h5>Email:</h5>
                                                            <span>${user.username}</span>
                                                        </div>
                                                        <div class="about-step">
                                                            <h5>Số điện thoại:</h5>
                                                            <span> ${user.getPhone()}  </span>
                                                        </div>
                                                        <div class="about-step">
                                                            <h5>Ngày tháng năm sinh:</h5>
                                                            <span> ${user.getDob()}  </span>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
        <script src="vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
        <script src="js/custom.js"></script>
        <script src="js/night-mode.js"></script>
        <script>
            var containerEl = document.querySelector('[data-ref~="event-filter-content"]');

            var mixer = mixitup(containerEl, {
                selectors: {
                    target: '[data-ref~="mixitup-target"]'
                }
            });
        </script>
    </body>

</html>