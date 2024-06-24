
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="h-100">

<<<<<<< Updated upstream
    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:06:46 GMT -->
    <head>

=======
    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/my_organisation_dashboard_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:26 GMT -->
    <head>
>>>>>>> Stashed changes
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=9">
        <meta name="description" content="Gambolthemes">
        <meta name="author" content="Gambolthemes">		
<<<<<<< Updated upstream
        <title>TicketTicket - Hệ thống mua vé một cách dễ dàng</title>
=======
        <title>Barren - Simple Online Event Ticketing System</title>
>>>>>>> Stashed changes

        <!-- Favicon Icon -->
        <link rel="icon" type="image/png" href="images/fav.png">

<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
        <!-- Stylesheets -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
<<<<<<< Updated upstream
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
        
=======
        <link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/vertical-responsive-menu.min.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/night-mode.css" rel="stylesheet">

        <!-- Vendor Stylesheets -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">	

>>>>>>> Stashed changes
    </head>

    <body class="d-flex flex-column h-100">
        <!-- Header Start-->
        <header class="header">
<<<<<<< Updated upstream
            <div class="header-inner">
                <nav class="navbar navbar-expand-lg bg-barren barren-head navbar fixed-top justify-content-sm-start pt-0 pb-0">
                    <div class="container">	
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
=======
            <div class="header-inner">		
                <nav class="navbar navbar-expand-lg bg-barren barren-head navbar fixed-top justify-content-sm-start pt-0 pb-0 ps-lg-0 pe-2">
                    <div class="container-fluid ps-0">
                        <button type="button" id="toggleMenu" class="toggle_menu">
                            <i class="fa-solid fa-bars-staggered"></i>
                        </button>
                        <button id="collapse_menu" class="collapse_menu me-4">
                            <i class="fa-solid fa-bars collapse_menu--icon "></i>
                            <span class="collapse_menu--label"></span>
                        </button>
                        <button class="navbar-toggler order-3 ms-2 pe-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                                <ul class="navbar-nav justify-content-between" >
                                    <li class="nav-item"> 
                                        <img src="image/icon/logo (2).png" alt="" width="90px" href="Home.jsp" /></li>
=======
                                <div class="offcanvas-top-area">
                                    <div class="create-bg">
                                        <a href="createevent" class="offcanvas-create-btn">
                                            <i class="fa-solid fa-calendar-days"></i>
                                            <span>Tạo sự kiện </span>
                                        </a>
                                    </div>
                                </div>
                                <ul class="navbar-nav justify-content-end flex-grow-1 pe_5">
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
                                </ul>
                            </div>

                        </div>
<<<<<<< Updated upstream

=======
                        <div class="right-header order-2">
                            <ul class="align-self-stretch">
                                <li>
                                    <a href="createevent" class="create-btn btn-hover">
                                        <i class="fa-solid fa-calendar-days"></i>
                                        <span>Tạo sự kiện </span>
                                    </a>
                                </li>
                                <li class="dropdown account-dropdown order-3">
                                    <a href="#" class="account-link" role="button" id="accountClick" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                                        <img src="images/profile-imgs/img-13.jpg" alt="">
                                        <i class="fas fa-caret-down arrow-icon"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-account dropdown-menu-end" aria-labelledby="accountClick">

                                        <div class="dropdown-account-header">
                                            <div class="account-holder-avatar">
                                                <img src="images/profile-imgs/img-13.jpg" alt="">
                                            </div>
                                            <c:set var="user" value="${account}" />
                                            <h5>${user.username}</h5>
                                        </div>


                                        <li class="profile-link">
                                            <a href="Adminprofile.jsp" class="link-item">Tài khoản của tôi</a>									
                                            <a href="logout" class="link-item">Đăng xuất</a>									
                                        </li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
>>>>>>> Stashed changes
                    </div>
                </nav>
                <div class="overlay"></div>
            </div>
        </header>
        <!-- Header End-->
<<<<<<< Updated upstream
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
                                                        <a href="eventdetail?eid=${c.getEventId()}" class="thumbnail-img">
                                                            <img src="${c.getEventImg() }" alt="">
                                                        </a>
                                                        <button type="submit" class="bookmark-icon" title="Bookmark"></button>
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
=======
        <!-- Left Sidebar Start -->
        <nav class="vertical_nav">
            <div class="left_section menu_left" id="js-menu">
                <div class="left_section">
                    <ul>

                        <li class="menu--item">
                            <a href="" class="menu--link active " title="Events" data-bs-toggle="tooltip" data-bs-placement="right">
                                <i class="fa-solid fa-calendar-days menu--icon"></i>
                                <span class="menu--label">Sự kiện</span>
                            </a>
                        </li>


                        <li class="menu--item">
                            <a href="my_organisation_dashboard_about.html" class="menu--link" title="About" data-bs-toggle="tooltip" data-bs-placement="right">
                                <i class="fa-solid fa-circle-info menu--icon"></i>
                                <span class="menu--label">Thông tin về tôi</span>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- Left Sidebar End -->
        <!-- Body Start -->
        <div class="wrapper wrapper-body">
            <div class="dashboard-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="d-main-title">
                                <h3><i class="fa-solid fa-calendar-days me-3"></i>Sự kiện</h3>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="main-card mt-5">
                                <div class="dashboard-wrap-content p-4">
                                    <h5 class="mb-4">Tất cả sự kiện</h5>
                                    <div class="d-md-flex flex-wrap align-items-center">
                                        <div class="dashboard-date-wrap">
                                            <div class="form-group">
                                                <div class="relative-input position-relative">
                                                    <form action="stafflist?action=search" method ="post">
                                                        <input class="form-control h_40" type="text" placeholder="Tìm kiếm bằng tên sự kiện" value="">
                                                        <i class="uil uil-search"></i>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="rs ms-auto mt_r4">
                                            <div class="nav custom2-tabs btn-group" role="tablist">
                                                <button class="tab-link active" data-bs-toggle="tab" data-bs-target="#all-tab" type="button" role="tab" aria-controls="all-tab" aria-selected="true">All Event </button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="event-list">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="all-tab" role="tabpanel">
                                        <div class="main-card mt-4">
                                            <div class="contact-list">
                                                <div class="card-top event-top p-4 align-items-center top d-md-flex flex-wrap justify-content-between">
                                                    <div class="d-md-flex align-items-center event-top-info">
                                                        <div class="card-event-img">
                                                            <img src="images/event-imgs/img-7.jpg" alt="">
                                                        </div>
                                                        <div class="card-event-dt">
                                                            <h5>Tutorial on Canvas Painting for Beginners</h5>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown">
                                                        <button class="option-btn" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-gear me-3"></i>Manage</a>
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-eye me-3"></i>Preview Event</a>
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-clone me-3"></i>Duplicate</a>
                                                            <a href="#" class="dropdown-item delete-event"><i class="fa-solid fa-trash-can me-3"></i>Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="bottom d-flex flex-wrap justify-content-between align-items-center p-4">
                                                    <div class="icon-box ">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-location-dot"></i>
                                                        </span>
                                                        <p>Trạng thái</p>
                                                        <h6 class="coupon-status">Publish</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-calendar-days"></i>
                                                        </span>
                                                        <p>Thời gian</p>
                                                        <h6 class="coupon-status">30 Jun, 2022 10:00 AM</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-ticket"></i>
                                                        </span>
                                                        <p>Vé</p>
                                                        <h6 class="coupon-status">60</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-tag"></i>
                                                        </span>
                                                        <p>Số vé đã bán</p>
                                                        <h6 class="coupon-status">20</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="online-tab" role="tabpanel">
                                        <div class="main-card d-none mt-4">
                                            <div class="d-flex align-items-center justify-content-center flex-column min-height-430">
                                                <div class="event-list-icon">
                                                    <img src="images/calendar.png" alt="">
                                                </div>
                                                <p class="font-16 mt-4 text-light3">No Event found</p>
                                            </div>
                                        </div>
                                        <div class="main-card mt-4">
                                            <div class="contact-list">
                                                <div class="card-top event-top p-4 align-items-center top d-md-flex flex-wrap justify-content-between">
                                                    <div class="d-md-flex align-items-center event-top-info">
                                                        <div class="card-event-img">
                                                            <img src="images/event-imgs/img-2.jpg" alt="">
                                                        </div>
                                                        <div class="card-event-dt">
                                                            <h5>Earrings Workshop with Bronwyn David</h5>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown">
                                                        <button class="option-btn" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-gear me-3"></i>Manage</a>
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-eye me-3"></i>Preview Event</a>
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-clone me-3"></i>Duplicate</a>
                                                            <a href="#" class="dropdown-item delete-event"><i class="fa-solid fa-trash-can me-3"></i>Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="bottom d-flex flex-wrap justify-content-between align-items-center p-4">
                                                    <div class="icon-box ">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-location-dot"></i>
                                                        </span>
                                                        <p>Status</p>
                                                        <h6 class="coupon-status">Publish</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-calendar-days"></i>
                                                        </span>
                                                        <p>Starts on</p>
                                                        <h6 class="coupon-status">30 Jun, 2022 10:00 AM</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-ticket"></i>
                                                        </span>
                                                        <p>Ticket</p>
                                                        <h6 class="coupon-status">250</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-tag"></i>
                                                        </span>
                                                        <p>Tickets sold</p>
                                                        <h6 class="coupon-status">20</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="venue-tab" role="tabpanel">
                                        <div class="main-card mt-4">
                                            <div class="contact-list">
                                                <div class="card-top event-top p-4 align-items-center top d-md-flex flex-wrap justify-content-between">
                                                    <div class="d-md-flex align-items-center event-top-info">
                                                        <div class="card-event-img">
                                                            <img src="images/event-imgs/img-7.jpg" alt="">
                                                        </div>
                                                        <div class="card-event-dt">
                                                            <h5>Tutorial on Canvas Painting for Beginners</h5>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown">
                                                        <button class="option-btn" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical"></i></button>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-gear me-3"></i>Manage</a>
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-eye me-3"></i>Preview Event</a>
                                                            <a href="#" class="dropdown-item"><i class="fa-solid fa-clone me-3"></i>Duplicate</a>
                                                            <a href="#" class="dropdown-item delete-event"><i class="fa-solid fa-trash-can me-3"></i>Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="bottom d-flex flex-wrap justify-content-between align-items-center p-4">
                                                    <div class="icon-box ">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-location-dot"></i>
                                                        </span>
                                                        <p>Status</p>
                                                        <h6 class="coupon-status">Publish</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-calendar-days"></i>
                                                        </span>
                                                        <p>Starts on</p>
                                                        <h6 class="coupon-status">30 Jun, 2022 10:00 AM</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-ticket"></i>
                                                        </span>
                                                        <p>Ticket</p>
                                                        <h6 class="coupon-status">250</h6>
                                                    </div>
                                                    <div class="icon-box">
                                                        <span class="icon">
                                                            <i class="fa-solid fa-tag"></i>
                                                        </span>
                                                        <p>Tickets sold</p>
                                                        <h6 class="coupon-status">20</h6>
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
        <!-- Body End -->


        <script src="js/vertical-responsive-menu.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
        <script src="js/custom.js"></script>
        <script src="js/night-mode.js"></script>

    </body>

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/my_organisation_dashboard_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:26 GMT -->
</html>
>>>>>>> Stashed changes
