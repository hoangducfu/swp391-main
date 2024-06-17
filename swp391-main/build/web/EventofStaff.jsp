<<<<<<< Updated upstream
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

>>>>>>> Stashed changes
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- Header Start-->
        <header class="header">
            <div class="header-inner">
                <nav class="navbar navbar-expand-lg bg-barren barren-head navbar fixed-top justify-content-sm-start pt-0 pb-0">
                    <div class="container">	
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                            <span class="navbar-toggler-icon">
                                <i class="fa-solid fa-bars"></i>
                            </span>
                        </button>

                        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                            <div class="offcanvas-header">
                                <div class="offcanvas-logo" id="offcanvasNavbarLabel">
                                    <img src="images/logo-icon.svg" alt="">
                                </div>
                                <button type="button" class="close-btn" data-bs-dismiss="offcanvas" aria-label="Close">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                            </div>
                            <div class="offcanvas-body">
                                <ul class="navbar-nav justify-content-between" >
                                    <li class="nav-item"> 
                                        <img src="image/icon/logo (2).png" alt="" width="90px" href="Home.jsp" /></li>
                                    <li class="nav-item">
                                </ul>
                                <ul class="navbar-nav">
                                    <a class="nav-link active" aria-current="page" href="#">
                                        Trang chủ
                                    </a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Danh mục
                                        </a>
                                        <ul class="dropdown-menu dropdown-submenu">
                                            <li><a class="dropdown-item" href="explore_events.html">Ca Nhạc</a></li>
                                            <li><a class="dropdown-item" href="venue_event_detail_view.html">Talkshow</a></li>
                                            <li><a class="dropdown-item" href="online_event_detail_view.html">Workshop</a></li>
                                        </ul>
                                    </li>
                                    <!--                                comment-->
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Giúp đỡ
                                        </a>
                                        <ul class="dropdown-menu dropdown-submenu">
                                            <li><a class="dropdown-item" href="help_center.html">Help Center</a></li>
                                            <li><a class="dropdown-item" href="contact_us.html">Liên hệ với chúng tôi</a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Trang khác
                                        </a>
                                        <ul class="dropdown-menu dropdown-submenu">
                                            <li><a class="dropdown-item" href="help_center.html">Thông tin về chúng tôi </a></li>
                                            <li><a class="dropdown-item" href="contact_us.html">Điều khoản và điều kiện</a></li>
                                            <li><a class="dropdown-item" href="contact_us.html">Chính sách bảo mật</a></li>

                                        </ul>
                                    </li>


                                </ul>
                                <ul>
                                    <li class="dropdown account-dropdown">
                                        <a href="#" class="account-link" role="button" id="accountClick" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="images/profile-imgs/img-13.jpg" alt="">
                                            <i class="fas fa-caret-down arrow-icon"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-account dropdown-menu-end" aria-labelledby="accountClick">
                                            <li>
                                                <div class="dropdown-account-header">
                                                    <div class="account-holder-avatar">
                                                        <img src="images/profile-imgs/img-13.jpg" alt="">
                                                    </div>
                                                    <c:set var="user" value="${account}" />
                                                    <h5>${user.username}</h5>
                                                </div>
                                            </li>
                                            <li class="profile-link">
                                                <a href="organiser_profile_view.html" class="link-item">Tài khoản của tôi</a>									
                                                <a href="logout" class="link-item">Đăng xuất</a>									
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>

                        </div>

                    </div>
                </nav>
                <div class="overlay"></div>
            </div>
        </header>
        <!-- Header End-->
        <!-- Body Start-->
        <div class="wrapper">
            <div class="explore-events p-80">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="main-title">
                                <h3>Danh mục sản phẩm</h3>
                            </div>
                        </div>
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-filter-items">
                                <div class="featured-controls">

                                    <div class="controls">
                                        <button type="button" class="control" data-filter="all">Tất cả</button>
                                        <button type="button" class="control" data-filter=".arts">Ca nhạc</button>

                                        <button type="button" class="control" data-filter=".concert">Talkshow</button>

                                        <button type="button" class="control" data-filter=".health_Wellness">Workshop</button>									

                                    </div>
                                        <div class="row" data-ref="event-filter-content">
                                    <c:forEach items="${dataevent}" var="c">
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix arts concert workshops volunteer sports health_Wellness" data-ref="mixitup-target">
                                                <div class="main-card mt-4">
                                                    <div class="event-thumbnail">
                                                        <a href="venue_event_detail_view.html" class="thumbnail-img">
                                                            <img src="${c.getEventImg() }" alt="">
                                                        </a>
                                                        <span class="bookmark-icon" title="Bookmark"></span>
                                                    </div>
                                                    <div class="event-content">
                                                        <a href="venue_event_detail_view.html" class="event-title">${c.getEventName()}</a>
                                                        <div class="duration-price-remaining">
                                                            <span class="duration-price">AUD $100.00*</span>
                                                            <span class="remaining"></span>
                                                        </div>
                                                    </div>
                                                    <div class="event-footer">
                                                        <div class="event-timing">
                                                            <div class="publish-date">
                                                                <span><i class="fa-solid fa-calendar-day me-2"></i>${c.getTimeStart()}</span>
                                                                <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                                <span>Fri, 3.45 PM</span>
                                                            </div>
                                                            <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>1h</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </c:forEach>
                                        </div>
                                    <div class="browse-btn">
                                        <a href="explore_events.html" class="main-btn btn-hover ">Browse All</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Body End-->
                <!-- Footer Start-->
                <footer class="footer mt-auto">
                    <div class="footer-top">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-content">
                                        <h4>Công ty</h4>
                                        <ul class="footer-link-list">
                                            <li><a href="help_center.html" class="footer-link">Giúp đỡ</a></li>
                                            <li><a href="contact_us.html" class="footer-link">Liên hệ với chúng tôi </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-content">
                                        <h4>Các LINKS hữu ích</h4>
                                        <ul class="footer-link-list">
                                            <li><a href="privacy_policy.html" class="footer-link">Chính sách bảo mật </a></li>
                                            <li><a href="term_and_conditions.html" class="footer-link">Điều khoản & Điều kiện </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="footer-content">
                                        <h4>Nguồn</h4>
                                        <ul class="footer-link-list">
                                            <li><a href="our_blog.html" class="footer-link">Trang chủ</a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="footer-copyright-text">
                                        <p class="mb-0">© 2024, <strong>TicketTicket</strong>.Mang đến sự trải nghiệm tốt tới với mọi người </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer><!-- Footer End-->


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
