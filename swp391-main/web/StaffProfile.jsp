<%-- 
    Document   : Adminprofile
    Created on : Jun 13, 2024, 10:06:15 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/organiser_profile_view.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:16 GMT -->
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
        <link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/night-mode.css" rel="stylesheet">

        <!-- Vendor Stylesheets -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">		

    </head>

    <body class="d-flex flex-column h-100">
        <!-- Follow People Model Start-->
        <div class="modal fade" id="FFModal" tabindex="-1" aria-labelledby="FFModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="FFModalLabel">Following & Followers</h5>
                        <button type="button" class="close-model-btn" data-bs-dismiss="modal" aria-label="Close"><i class="uil uil-multiply"></i></button>
                    </div>
                    <div class="modal-body">
                        <div class="model-content follow-people-content">
                            <div class="">
                                <ul class="nav nav-pills ff-tablist mb-2" role="tablist">
                                    <li class="nav-item d-flex me-4">
                                        <a class="nav-link px-0 pt-0 pb-3 active" id="pills-following-tab" data-bs-toggle="pill" href="#following" role="tab" aria-controls="following" aria-selected="true">Following <span class="following_count">(2)</span></a>
                                    </li>
                                    <li class="nav-item d-flex">
                                        <a class="nav-link px-0 pt-0 pb-3" id="pills-followers-tab" data-bs-toggle="pill" href="#followers" role="tab" aria-controls="followers" aria-selected="false">Followers  </a>
                                    </li>
                                </ul>
                                <div class="tab-content mt-4">
                                    <div class="tab-pane fade active show" id="following" role="tabpanel" aria-labelledby="pills-following-tab">							
                                        <div class="users-list min-height-430">
                                            <div class="user-follow-card mb-4">
                                                <div class="follow-card-left">
                                                    <div class="follow-avatar">
                                                        <img src="images/profile-imgs/img-2.jpg" alt="">
                                                    </div>
                                                    <div class="follow-name">
                                                        <h5>Jassica William</h5>
                                                        <span>1 Follower</span>
                                                    </div>
                                                </div>
                                                <div class="follow-card-btn">
                                                    <button class="follow-btn">Following</button>
                                                </div>
                                            </div>
                                            <div class="user-follow-card mb-4">
                                                <div class="follow-card-left">
                                                    <div class="follow-avatar">
                                                        <img src="images/profile-imgs/img-1.jpg" alt="">
                                                    </div>
                                                    <div class="follow-name">
                                                        <h5>Rock Smith</h5>
                                                        <span>3 Followers</span>
                                                    </div>
                                                </div>
                                                <div class="follow-card-btn">
                                                    <button class="follow-btn">Following</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="followers" role="tabpanel" aria-labelledby="pills-followers-tab">							
                                        <div id="followers-empty-state" class="d-flex align-items-center justify-content-center flex-column min-height-430">
                                            <span>
                                                <svg width="60" height="47" viewBox="0 0 60 47" fill="none">
                                                <path d="M41.8884 39.501C41.2649 38.8161 41.1572 37.7618 41.9808 37.0461L48.8852 30.1433C50.44 28.5811 52.8108 30.9436 51.2559 32.4981L47.1225 36.6306H56.1899C56.467 35.6917 56.644 35.0145 56.644 34.0064C56.644 28.0732 50.5247 24.6256 45.152 24.6256C40.9724 24.6256 36.4387 26.5956 34.5067 30.4819C36.5234 33.0521 37.7088 36.138 37.7088 39.4702C37.7088 41.6788 37.1623 43.8566 36.1693 45.8267C35.1918 47.7967 32.1976 46.3038 33.1828 44.3337C33.9525 42.8023 34.3528 41.1863 34.3528 39.4702C34.3528 31.4515 26.1321 26.7188 18.8505 26.7188C11.5767 26.7188 3.36369 31.4515 3.36369 39.4702C3.36369 41.2017 3.74856 42.7793 4.52598 44.326C5.51892 46.2961 2.5247 47.7967 1.53945 45.8344C0.546504 43.8643 0 41.6711 0 39.4702C0 32.3749 5.23412 26.8573 11.6228 24.5948C7.8127 22.1322 5.49583 17.9151 5.49583 13.3594C5.49583 5.98709 11.4843 0 18.8505 0C26.2322 0 32.2207 5.98709 32.2207 13.3594C32.2207 17.9228 29.8961 22.1322 26.086 24.5948C28.3412 25.3874 30.3656 26.5495 32.0744 27.9808C33.6369 25.4798 36.0616 23.6098 38.7787 22.5016C36.1001 20.4854 34.5221 17.3533 34.5221 13.9904C34.5221 8.11875 39.2867 3.35524 45.152 3.35524C51.0327 3.35524 55.7896 8.11105 55.7896 13.9904C55.7896 17.3533 54.2117 20.4931 51.5253 22.5016C56.2668 24.4332 60 28.6811 60 34.0064C60 34.8683 59.8922 35.7379 59.6921 36.5921C59.492 37.4386 59.1841 38.262 58.7838 39.0623C58.4913 39.6472 57.9063 39.9858 57.2906 39.9858L47.1302 39.9935L51.2559 44.1183C52.8185 45.6805 50.4477 48.0507 48.8852 46.4885L41.8884 39.501ZM18.8505 3.36293C13.3239 3.36293 8.85183 7.83401 8.85183 13.3594C8.85183 18.9001 13.3085 23.3481 18.8505 23.3481C24.3926 23.3481 28.857 18.9001 28.857 13.3594C28.857 7.84171 24.3772 3.36293 18.8505 3.36293ZM45.152 6.71047C41.1418 6.71047 37.8781 9.97336 37.8781 13.9904C37.8781 18.0152 41.1341 21.255 45.1597 21.255C49.1931 21.255 52.4336 18.0228 52.4336 13.9904C52.4336 9.97336 49.1777 6.71047 45.152 6.71047Z" fill="#6ac045"></path>
                                                </svg>
                                            </span>
                                            <p class="font-16 mt-4 text-light3">No followers yet</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Follow People Model End-->
        <!-- About Details Model Start-->
        <div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="aboutModalLabel">Chi tiết chỉnh sửa</h5>
                        <button type="button" class="close-model-btn" data-bs-dismiss="modal" aria-label="Close"><i class="uil uil-multiply"></i></button>
                    </div>
                    <div class="modal-body">
                        <div class="model-content main-form">
                            <div class="row">

                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group mt-4">
                                        <label class="form-label">Tên tài khoản*</label>
                                        <input class="form-control h_40" type="text" placeholder="" value="">																								
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group mt-4">
                                        <label class="form-label">Số điện thoại*</label>
                                        <input class="form-control h_40" type="text" placeholder="" value="">																								
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group mt-4">
                                        <label class="form-label">Ngày sinh*</label>
                                        <input class="form-control h_40" type="date" placeholder="" value="">																								
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="main-btn min-width btn-hover h_40">Cập nhập</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Details Model End-->
        <!-- Header Start-->
        <header class="header">
            <header class="header">
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
                                <span class="navbar-toggler-icon">
                                    <i class="fa-solid fa-bars"></i>
                                </span>
                            </button>
                            <a class="navbar-brand order-1 order-lg-0 ml-lg-0 ml-2 me-auto" href="Home.jsp">
                                <div class="res-main-logo">
                                    <img src="image/icon/logo (2).png" alt=""/>
                                </div>
                                <div class="main-logo" id="logo">
                                    <img src="image/icon/logo (2).png" alt=""/>
                                </div>
                            </a>
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
                                    <div class="offcanvas-top-area">
                                        <div class="create-bg">
                                            <a href="create.html" class="offcanvas-create-btn">
                                                <i class="fa-solid fa-calendar-days"></i>
                                                <span>Tạo sự kiện </span>
                                            </a>
                                        </div>
                                    </div>
                                    <ul class="navbar-nav justify-content-end flex-grow-1 pe_5">
                                        <li class="nav-item">
                                            <a class="nav-link" href="logout">
                                                <i class="fa-solid fa-right-left me-2"></i>Đăng xuất
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                                <div class="offcanvas-footer">
                                    <div class="offcanvas-social">
                                        <h5>Follow Us</h5>
                                        <ul class="social-links">
                                            <li><a href="#" class="social-link"><i class="fab fa-facebook-square"></i></a>
                                            </li><li><a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                                            </li><li><a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                                            </li><li><a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                                            </li><li><a href="#" class="social-link"><i class="fab fa-youtube"></i></a>
                                            </li></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="right-header order-2">
                                <ul class="align-self-stretch">
                                    <li>
                                        <a href="create.html" class="create-btn btn-hover">
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
                        </div>
                    </nav>
                </div>
            </header>

            <!-- Header End-->
            <!-- Body Start-->
            <div class="wrapper">
                <div class="profile-banner">
                    <div class="hero-cover-block">
                        <div class="hero-cover">
                            <div class="hero-cover-img"></div>	
                        </div>
                        <div class="upload-cover">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="cover-img-btn">
                                            <input type="file" id="cover-img">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="user-dt-block">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-4 col-lg-5 col-md-12">
                                    <div class="main-card user-left-dt">
                                        <div class="user-avatar-img">
                                            <img src="images/profile-imgs/img-13.jpg" alt="">
                                            <div class="avatar-img-btn">
                                                <input type="file" id="avatar-img">
                                                <label for="avatar-img"><i class="fa-solid fa-camera"></i></label>
                                            </div>
                                        </div>
                                        <div class="user-description">
                                            <p>Hey I am a John Doe</p>
                                        </div>
                                        

                                        <div class="user-btns">
                                            <a href="stafflist" class="co-main-btn co-btn-width min-width d-inline-block h_40">Sự kiện của tôi<i class="fa-solid fa-right-left ms-3"></i></a>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="col-xl-8 col-lg-7 col-md-12">
                                    <div class="right-profile">
                                        <div class="profile-tabs">
                                            <ul class="nav nav-pills nav-fill p-2 garren-line-tab" id="myTab" role="tablist">

                                                <li class="nav-item">
                                                    <a class="nav-link active" id="about-tab" data-bs-toggle="tab" href="#about" role="tab" aria-controls="about" aria-selected="false"><i class="fa-solid fa-circle-info"></i>Thông tin về tôi</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="setting-tab" data-bs-toggle="tab" href="#setting" role="tab" aria-controls="setting" aria-selected="false"><i class="fa-solid fa-gear"></i>Thay đổi mật khẩu</a>

                                                </li>

                                            </ul>
                                            <div class="tab-content" id="myTabContent">

                                                <div class="tab-pane fade" id="about" role="tabpanel" aria-labelledby="about-tab">
                                                    <div class="main-card mt-4">
                                                        <div class="bp-title position-relative">
                                                            <h4>About</h4>
                                                            <button class="main-btn btn-hover ms-auto edit-btn me-3 pe-4 ps-4 h_40" data-bs-toggle="modal" data-bs-target="#aboutModal">
                                                                <i class="fa-regular fa-pen-to-square me-2"></i>Chỉnh sửa
                                                            </button>
                                                        </div>
                                                        <div class="about-details">
                                                            <div class="about-step">
                                                                <h5>Tên của tôi</h5>
                                                                <span> <c:set var="user" value="${account}" />
                                                                    <h5>${user.username}</h5>
                                                                </span>
                                                            </div>
                                                            
                                                            
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="setting" role="tabpanel" aria-labelledby="setting-tab">
                                                    <div class="row">

                                                        <div class="col-lg-12">
                                                            <div class="main-card mt-4">
                                                                <div >


                                                                    <div class="bp-title">
                                                                        <h4>Cài đặt mật khẩu</h4>
                                                                    </div>
                                                                    <div class="password-setting p-4">
                                                                        <div class="password-des">
                                                                            <h4>Thay đổi mật khẩu</h4>
                                                                            <p>Bnaj có thể thay đổi mật khẩu mới ở đây. Nếu bạn không nhớ mật khẩu hiện tại có thể bấm <a href="">Quên mật khẩu </a></p>
                                                                        </div>
                                                                        <div class="change-password-form">
                                                                            <div class="form-group mt-4">
                                                                                <label class="form-label">Mật khẩu hiện tại*</label>
                                                                                <div class="loc-group position-relative">
                                                                                    <input class="form-control h_50" type="password" placeholder="Enter your password">
                                                                                    <span class="pass-show-eye"><i class="fas fa-eye-slash"></i></span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group mt-4">
                                                                                <label class="form-label">Mật khẩu mới*</label>
                                                                                <div class="loc-group position-relative">
                                                                                    <input class="form-control h_50" type="password" placeholder="Enter your password">
                                                                                    <span class="pass-show-eye"><i class="fas fa-eye-slash"></i></span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group mt-4">
                                                                                <label class="form-label">Xác nhận mật khẩu*</label>
                                                                                <div class="loc-group position-relative">
                                                                                    <input class="form-control h_50" type="password" placeholder="Enter your password">
                                                                                    <span class="pass-show-eye"><i class="fas fa-eye-slash"></i></span>
                                                                                </div>
                                                                            </div>
                                                                            <button class="main-btn btn-hover w-100 mt-5" type="submit">Cập nhập mật khẩu</button>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="orders" role="tabpanel" aria-labelledby="orders-tab">
                                                    <div class="main-card mt-4">
                                                        <div class="card-top p-4">
                                                            <div class="card-event-img">
                                                                <img src="images/event-imgs/img-7.jpg" alt="">
                                                            </div>
                                                            <div class="card-event-dt">
                                                                <h5>Tutorial on Canvas Painting for Beginners</h5>
                                                                <div class="invoice-id">Invoice ID : <span>BRCCRW-11111111</span></div>
                                                            </div>
                                                        </div>
                                                        <div class="card-bottom">
                                                            <div class="card-bottom-item">
                                                                <div class="card-icon">
                                                                    <i class="fa-solid fa-calendar-days"></i>
                                                                </div>
                                                                <div class="card-dt-text">
                                                                    <h6>Event Starts on</h6>
                                                                    <span>01 June 2022</span>
                                                                </div>
                                                            </div>
                                                            <div class="card-bottom-item">
                                                                <div class="card-icon">
                                                                    <i class="fa-solid fa-ticket"></i>
                                                                </div>
                                                                <div class="card-dt-text">
                                                                    <h6>Total Tickets</h6>
                                                                    <span>1</span>
                                                                </div>
                                                            </div>
                                                            <div class="card-bottom-item">
                                                                <div class="card-icon">
                                                                    <i class="fa-solid fa-money-bill"></i>
                                                                </div>
                                                                <div class="card-dt-text">
                                                                    <h6>Paid Amount</h6>
                                                                    <span>AUD $50.00</span>
                                                                </div>
                                                            </div>
                                                            <div class="card-bottom-item">
                                                                <div class="card-icon">
                                                                    <i class="fa-solid fa-money-bill"></i>
                                                                </div>
                                                                <div class="card-dt-text">
                                                                    <h6>Invoice</h6>
                                                                    <a href="invoice.html">Download</a>
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
                                        <li><a href="contact_us.html" class="footer-link">Liên hệ với chúng tôi</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="footer-content">
                                    <h4>Các links hữu ích</h4>
                                    <ul class="footer-link-list">
                                        <li><a href="privacy_policy.html" class="footer-link">Chính sách bảo mật</a></li>
                                        <li><a href="term_and_conditions.html" class="footer-link">điều khoản và điều kiện</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="footer-content">
                                    <h4>Nguồn</h4>
                                    <ul class="footer-link-list">
                                        <li><a href="our_blog.html" class="footer-link">Blog</a></li>
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
                                    <p class="mb-0">© 2024, <strong>TicketTicket</strong>.Mang đến sự trải nghiệm tốt tới với mọi người</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer End-->


            <script src="js/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/OwlCarousel/owl.carousel.js"></script>
            <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
            <script src="js/custom.js"></script>
            <script src="js/night-mode.js"></script>
    </body>

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/organiser_profile_view.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:16 GMT -->
</html>
