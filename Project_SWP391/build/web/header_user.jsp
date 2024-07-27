<%-- 
    Document   : header
    Created on : Jun 12, 2024, 8:46:12 AM
    Author     : mactu
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
        <header class="header">
            <div class="header-inner">
                <nav class="navbar navbar-expand-lg bg-barren barren-head navbar fixed-top justify-content-sm-start pt-0 pb-0">
                    <div class="container">	
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                            <span class="navbar-toggler-icon">
                                <i class="fa-solid fa-bars"></i>
                            </span>
                        </button>
                        <a class="navbar-brand order-1 order-lg-0 ml-lg-0 ml-2 me-auto" href="exploreshow">
                            <div class="res-main-logo">
                                <img src="image/icon/logo (2).png" alt="">
                            </div>
                            <div class="main-logo" id="logo">
                                <img style="height: 60px" src="image/icon/logo (2).png" alt="">
                                <img style="height: 60px" class="logo-inverse" src="image/icon/logo (2).png" alt="">
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
                                            <span>Create Event</span>
                                        </a>
                                    </div>
                                </div>							
                                <ul class="navbar-nav justify-content-end flex-grow-1 pe_5">
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="exploreshow">Trang chủ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" aria-current="page" href="ListDiscount">Mã giảm giá</a>
                                    </li>
                                    <c:if test="${(account.getType() == 'customer')}">
                                        <li class="nav-item">
                                            <a class="nav-link" aria-current="page" href="favorite">Danh sách yêu thích</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" aria-current="page" href="sendmessage">Hỗ trợ</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${(account.getType() != 'customer')}">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link" aria-current="page" href="signup">Đăng kí</a>

                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link" aria-current="page" href="loginGoogleHandler">Đăng nhập</a>

                                        </li>
                                    </c:if>

                                </ul>
                            </div>

                        </div>
                        <div class="right-header order-2">
                            <ul class="align-self-stretch">
                                <li>
                                    <!--								<a href="create.html" class="create-btn btn-hover">
                                                                                                            <i class="fa-solid fa-calendar-days"></i>
                                                                                                            <span>Create Event</span>
                                                                                                    </a>-->
                                </li>
                                <c:if test="${(account.getType() == 'customer')}">
                                    <li style="margin-right: 50px" class="dropdown account-dropdown">
                                        <a href="#" class="account-link" role="button" id="accountClick" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="image/icon/hihi.jpg" alt="">
                                            <i class="fas fa-caret-down arrow-icon"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-account dropdown-menu-end" aria-labelledby="accountClick">
                                            <li>
                                                <div class="dropdown-account-header">
                                                    <div class="account-holder-avatar">
                                                        <img src="image/icon/hihi.jpg" alt="">
                                                    </div>
                                                    <c:set var="user" value="${account}" />
                                                    <h5>${user.username}</h5>		

                                                </div>
                                            </li>
                                            <li class="profile-link">
                                                <c:if test="${account.getId() != null}">
                                                    <a href="payment_history?user_name=${user.username}" class="link-item">Lịch sử mua hàng</a>

                                                    <a href="profile" class="link-item">Thông tin tài khoản</a>									
                                                    <a href="logout" class="link-item">Đăng Xuất</a>	
                                                </c:if>
                                                <c:if test="${account.getId() == null}">
                                                    <a href="loginGoogleHandler" class="link-item">Đăng nhập</a>	
                                                </c:if>

                                            </li>
                                        </ul>
                                    </li>
                                </c:if>
                                <li>
                                    <div class="night_mode_switch__btn">
                                        <div id="night-mode" class="fas fa-moon fa-sun"></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="overlay"></div>
            </div>
        </header>
    </body>
</html>