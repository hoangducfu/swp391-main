<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="h-100">


    <head>
        <style>
            .default-event-thumb img {
                width: 100%; /* Đảm bảo hình ảnh chiếm toàn bộ chiều rộng của phần tử chứa */
            }
            .form-group {
                padding-top: 30px;
                padding-bottom: 30px;
            }
            .default-event-thumb img {
                width: 100%;
                height: 200px;
            } /* Đảm bảo ảnh chiếm toàn bộ khung chứa */

            .form-label {
                font-size: 16px;
            }
            .thumb-change-btn input[type="file"] {
                display: none;
            }
            .thumb-change-btn label {
                background-color: #007bff;
                color: white;
                padding: 5px 10px;
                cursor: pointer;
            }
        </style>
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
                                    <li>
                                        <a href="create.html" class="create-btn btn-hover">
                                            <i class="fa-solid fa-calendar-days"></i>
                                            <span>Tạo sự kiện</span>
                                        </a>

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

                                                    <h5>${account.username}</h5>
                                                </div>
                                            </li>
                                            <li class="profile-link">
                                                <a href="organiser_profile_view.html" class="link-item">Tài khoản của tôi</a>	
                                                <a href="#" class="link-item">Quên mật khẩu </a>
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
        <form action="createevent" method="post" enctype="multipart/form-data">
            <div class="wrapper">

                <div class="event-dt-block p-80">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-12 col-md-12">
                                <div class="main-title text-center">
                                    <h3>Tạo sự kiện</h3>
                                </div>
                            </div>
                            <div class="col-xl-8 col-lg-9 col-md-12">
                                <div class="wizard-steps-block">
                                    <div id="add-event-tab" class="step-app">
                                        <ul class="step-steps">
                                            <li class="active">
                                                <a href="#tab_step1">
                                                    <span class="number"></span>
                                                    <span class="step-name">Chi tiết sự kiện</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab_step2">
                                                    <span class="number"></span>
                                                    <span class="step-name">Chi tiết vé</span>
                                                </a>
                                            </li>

                                        </ul>

                                        <div class="step-content">
                                            <div class="step-tab-panel step-tab-info active" id="tab_step1"> 
                                                <div class="tab-from-content">
                                                    <div class="main-card">
                                                        <div class="bp-title">
                                                            <h4><i class="fa-solid fa-circle-info step_icon me-3"></i>Chi tiết sự kiện</h4>
                                                        </div>
                                                        <div class="p-4 bp-form main-form">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12">
                                                                    <div class="form-group border_bottom pb_30">
                                                                        <label class="form-label fs-16">Tên sự kiện*</label>
                                                                        <input class="form-control h_50" type="text" name="nameEvent" placeholder="Enter event name here" value="${nameEvent}">
                                                                    </div>
                                                                    <div class="form-group border_bottom pt_30 pb_30">
                                                                        <label class="form-label fs-16">Thể loại của sự kiện*</label>
                                                                        <select class="selectpicker" name="categoryId" multiple="" data-selected-text-format="count > 4" data-size="5" title="Select category" data-live-search="true">
                                                                            <option value="1">Ca nhạc</option>
                                                                            <option value="2">Talk show</option>
                                                                            <option value="3">Workshop</option>

                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group border_bottom pt_30 pb_30">
                                                                        <label class="form-label fs-16">Sự kiện của bạn bắt đầu khi nào?*</label>
                                                                        <div class="row g-2">
                                                                            <div class="col-md-6">
                                                                                <label class="form-label mt-3 fs-6">Ngày diễn ra sự kiện.*</label>																
                                                                                <div class="loc-group position-relative">
                                                                                    <input class="form-control " name="timeStart" data-language="en" type="datetime-local" placeholder="MM/DD/YYYY" value="">
                                                                                    <!--                                                                        <span class="absolute-icon"><i class="fa-solid fa-calendar-days"></i></span>-->
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">																		
                                                                                <div class="row g-2">
                                                                                    <!--                                                                        <div class="col-md-6">
                                                                                                                                                                <div class="clock-icon">
                                                                                                                                                                    <label class="form-label mt-3 fs-6">Thời gian</label>	
                                                                                                                                                                    <select class="selectpicker" data-size="5" data-live-search="true">
                                                                                                                                                                        <option value="00:00">12:00 AM</option>
                                                                                                                                                                        <option value="00:15">12:15 AM</option>
                                                                                                                                                                        <option value="00:30">12:30 AM</option>
                                                                                                                                                                        <option value="00:45">12:45 AM</option>
                                                                                                                                                                        <option value="01:00">01:00 AM</option>
                                                                                                                                                                        <option value="01:15">01:15 AM</option>
                                                                                                                                                                        <option value="01:30">01:30 AM</option>
                                                                                                                                                                        <option value="01:45">01:45 AM</option>
                                                                                                                                                                        <option value="02:00">02:00 AM</option>
                                                                                                                                                                        <option value="02:15">02:15 AM</option>
                                                                                                                                                                        <option value="02:30">02:30 AM</option>
                                                                                                                                                                        <option value="02:45">02:45 AM</option>
                                                                                                                                                                        <option value="03:00">03:00 AM</option>
                                                                                                                                                                        <option value="03:15">03:15 AM</option>
                                                                                                                                                                        <option value="03:30">03:30 AM</option>
                                                                                                                                                                        <option value="03:45">03:45 AM</option>
                                                                                                                                                                        <option value="04:00">04:00 AM</option>
                                                                                                                                                                        <option value="04:15">04:15 AM</option>
                                                                                                                                                                        <option value="04:30">04:30 AM</option>
                                                                                                                                                                        <option value="04:45">04:45 AM</option>
                                                                                                                                                                        <option value="05:00">05:00 AM</option>
                                                                                                                                                                        <option value="05:15">05:15 AM</option>
                                                                                                                                                                        <option value="05:30">05:30 AM</option>
                                                                                                                                                                        <option value="05:45">05:45 AM</option>
                                                                                                                                                                        <option value="06:00">06:00 AM</option>
                                                                                                                                                                        <option value="06:15">06:15 AM</option>
                                                                                                                                                                        <option value="06:30">06:30 AM</option>
                                                                                                                                                                        <option value="06:45">06:45 AM</option>
                                                                                                                                                                        <option value="07:00">07:00 AM</option>
                                                                                                                                                                        <option value="07:15">07:15 AM</option>
                                                                                                                                                                        <option value="07:30">07:30 AM</option>
                                                                                                                                                                        <option value="07:45">07:45 AM</option>
                                                                                                                                                                        <option value="08:00">08:00 AM</option>
                                                                                                                                                                        <option value="08:15">08:15 AM</option>
                                                                                                                                                                        <option value="08:30">08:30 AM</option>
                                                                                                                                                                        <option value="08:45">08:45 AM</option>
                                                                                                                                                                        <option value="09:00">09:00 AM</option>
                                                                                                                                                                        <option value="09:15">09:15 AM</option>
                                                                                                                                                                        <option value="09:30">09:30 AM</option>
                                                                                                                                                                        <option value="09:45">09:45 AM</option>
                                                                                                                                                                        <option value="10:00" selected="selected">10:00 AM</option>
                                                                                                                                                                        <option value="10:15">10:15 AM</option>
                                                                                                                                                                        <option value="10:30">10:30 AM</option>
                                                                                                                                                                        <option value="10:45">10:45 AM</option>
                                                                                                                                                                        <option value="11:00">11:00 AM</option>
                                                                                                                                                                        <option value="11:15">11:15 AM</option>
                                                                                                                                                                        <option value="11:30">11:30 AM</option>
                                                                                                                                                                        <option value="11:45">11:45 AM</option>
                                                                                                                                                                        <option value="12:00">12:00 PM</option>
                                                                                                                                                                        <option value="12:15">12:15 PM</option>
                                                                                                                                                                        <option value="12:30">12:30 PM</option>
                                                                                                                                                                        <option value="12:45">12:45 PM</option>
                                                                                                                                                                        <option value="13:00">01:00 PM</option>
                                                                                                                                                                        <option value="13:15">01:15 PM</option>
                                                                                                                                                                        <option value="13:30">01:30 PM</option>
                                                                                                                                                                        <option value="13:45">01:45 PM</option>
                                                                                                                                                                        <option value="14:00">02:00 PM</option>
                                                                                                                                                                        <option value="14:15">02:15 PM</option>
                                                                                                                                                                        <option value="14:30">02:30 PM</option>
                                                                                                                                                                        <option value="14:45">02:45 PM</option>
                                                                                                                                                                        <option value="15:00">03:00 PM</option>
                                                                                                                                                                        <option value="15:15">03:15 PM</option>
                                                                                                                                                                        <option value="15:30">03:30 PM</option>
                                                                                                                                                                        <option value="15:45">03:45 PM</option>
                                                                                                                                                                        <option value="16:00">04:00 PM</option>
                                                                                                                                                                        <option value="16:15">04:15 PM</option>
                                                                                                                                                                        <option value="16:30">04:30 PM</option>
                                                                                                                                                                        <option value="16:45">04:45 PM</option>
                                                                                                                                                                        <option value="17:00">05:00 PM</option>
                                                                                                                                                                        <option value="17:15">05:15 PM</option>
                                                                                                                                                                        <option value="17:30">05:30 PM</option>
                                                                                                                                                                        <option value="17:45">05:45 PM</option>
                                                                                                                                                                        <option value="18:00">06:00 PM</option>
                                                                                                                                                                        <option value="18:15">06:15 PM</option>
                                                                                                                                                                        <option value="18:30">06:30 PM</option>
                                                                                                                                                                        <option value="18:45">06:45 PM</option>
                                                                                                                                                                        <option value="19:00">07:00 PM</option>
                                                                                                                                                                        <option value="19:15">07:15 PM</option>
                                                                                                                                                                        <option value="19:30">07:30 PM</option>
                                                                                                                                                                        <option value="19:45">07:45 PM</option>
                                                                                                                                                                        <option value="20:00">08:00 PM</option>
                                                                                                                                                                        <option value="20:15">08:15 PM</option>
                                                                                                                                                                        <option value="20:30">08:30 PM</option>
                                                                                                                                                                        <option value="20:45">08:45 PM</option>
                                                                                                                                                                        <option value="21:00">09:00 PM</option>
                                                                                                                                                                        <option value="21:15">09:15 PM</option>
                                                                                                                                                                        <option value="21:30">09:30 PM</option>
                                                                                                                                                                        <option value="21:45">09:45 PM</option>
                                                                                                                                                                        <option value="22:00">10:00 PM</option>
                                                                                                                                                                        <option value="22:15">10:15 PM</option>
                                                                                                                                                                        <option value="22:30">10:30 PM</option>
                                                                                                                                                                        <option value="22:45">10:45 PM</option>
                                                                                                                                                                        <option value="23:00">11:00 PM</option>
                                                                                                                                                                        <option value="23:15">11:15 PM</option>
                                                                                                                                                                        <option value="23:30">11:30 PM</option>
                                                                                                                                                                        <option value="23:45">11:45 PM</option>
                                                                                                                                                                    </select>
                                                                                                                                                                </div>
                                                                                                                                                            </div>-->
                                                                                    <div class="col-md-6">
                                                                                        <label class="form-label mt-3 fs-6" >Trong khoảng bao lâu</label>	
                                                                                        <select class="selectpicker" data-size="5" data-live-search="true" name="period">
                                                                                            <option value="60" selected="selected">1 tiếng</option>
                                                                                            <option value="90">1 tiếng 30 phút</option>
                                                                                            <option value="120">2 tiếng</option>
                                                                                            <option value="150">2 tiếng 30 phút</option>
                                                                                            <option value="180">3 giờ</option>
                                                                                            <option value="210">3 tiếng 30 phút</option>
                                                                                            <option value="225">3 tiếng 45 phút</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="form-label">Thêm một vài hình ảnh cho sự kiện của bạn</label>
                                                                        <div class="content-holder">
                                                                            <div class="default-event-thumb">
                                                                                <div class="default-event-thumb-btn">
                                                                                    <div class="thumb-change-btn">
                                                                                        <input type="file" id="thumb-img" name="photo" accept=".jpg, .jpeg, .png">
                                                                                        <label for="thumb-img">Change Image</label>
                                                                                    </div>
                                                                                </div>
                                                                                <img id="event-img" src="image/icon/banner.png" alt=""/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group border_bottom pb_30">
                                                                        <label class="form-label fs-16">Mô tả chi tiết về sự kiện của bạn</label>
                                                                        <div class="text-editor mt-4">
                                                                            <textarea id="comments" name="describeEvent" rows="4" cols="97"></textarea>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group pt_30 pb-2">
                                                                        <label class="form-label fs-16">Sự kiện của bạn diễn ra ở đâu*</label>
                                                                        <div class="stepper-data-set">
                                                                            <div class="content-holder template-selector">
                                                                                <div class="row g-4">


                                                                                    <div class="col-md-12">
                                                                                        <div class="form-group main-form mt-1">
                                                                                            <label class="form-label">Địa chỉ*</label>
                                                                                            <select class="selectpicker" name="locationId" data-size="5" title="Nothing selected" data-live-search="true">

                                                                                                <option value="1">Số 57 Phạm Hùng, Mễ Trì, Nam Từ Liêm, Hà Nội</option>
                                                                                                <option value="2">Số 2 Phan Ðang Luu, Hòa Cường Bắc, Hải Châu, Ðà Nẵng</option>
                                                                                                <option value="3">Số 49 Đường Hoa Hồng, phường 4, Ðà Lạt</option>


                                                                                            </select>
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

                                            <div class="step-tab-panel step-tab-gallery" id="tab_step2">
                                                <div class="tab-from-content">
                                                    <div class="main-card">
                                                        <div class="bp-title">
                                                            <h4><i class="fa-solid fa-ticket step_icon me-3"></i>Chi tiết vé</h4>
                                                        </div>
                                                        <div class="bp-form main-form">
                                                            <div class="p-4 form-group border_bottom pb_30">
                                                                <div class="">
                                                                    <div class="ticket-section">
                                                                        <label class="form-label fs-16">Hãy tạo vé cho sự kiện của mình nào!</label>
                                                                    </div>
                                                                    <div class="d-flex align-items-center justify-content-between pt-4 pb-3 full-width">
                                                                        <h3 class="fs-18 mb-0">Vé (<span class="venue-event-ticket-counter">3</span>)</h3>

                                                                    </div>

                                                                    <div class="ticket-type-item-list mt-4">
                                                                        <div class="price-ticket-card mt-4">
                                                                            <div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
                                                                                <div class="d-flex align-items-center top-name">
                                                                                    <div class="icon-box">
                                                                                        <span class="icon-big rotate-icon icon icon-purple">
                                                                                            <i class="fa-solid fa-ticket"></i>
                                                                                        </span>
                                                                                        <h5 class="fs-16 mb-1 mt-1">Vé 1 </h5>
                                                                                        <input type="number" name="ve1"/>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                            <div class="price-ticket-card-body border_top p-4">
                                                                                <div class="full-width d-flex flex-wrap justify-content-between align-items-center">
                                                                                    <div class="icon-box">
                                                                                        <div class="icon me-3">
                                                                                            <i class="fa-solid fa-ticket"></i>
                                                                                        </div>
                                                                                        <span class="text-145">Tổng số vé</span>
                                                                                        <h6 class="coupon-status">20</h6>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="price-ticket-card mt-4">
                                                                            <div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
                                                                                <div class="d-flex align-items-center top-name">
                                                                                    <div class="icon-box">
                                                                                        <span class="icon-big rotate-icon icon icon-yellow">
                                                                                            <i class="fa-solid fa-ticket"></i>
                                                                                        </span>
                                                                                        <h5 class="fs-16 mb-1 mt-1">Vé 2 - 200.000</h5>
                                                                                        <input type="number" name="ve2"/>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                            <div class="price-ticket-card-body border_top p-4">
                                                                                <div class="full-width d-flex flex-wrap justify-content-between align-items-center">
                                                                                    <div class="icon-box">
                                                                                        <div class="icon me-3">
                                                                                            <i class="fa-solid fa-ticket"></i>
                                                                                        </div>
                                                                                        <span class="text-145">Tổng số vé</span>
                                                                                        <h6 class="coupon-status">20</h6>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>																
                                                                        <div class="price-ticket-card mt-4">
                                                                            <div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
                                                                                <div class="d-flex align-items-center top-name">
                                                                                    <div class="icon-box">
                                                                                        <span class="icon-big rotate-icon icon icon-yellow">
                                                                                            <i class="fa-solid fa-ticket"></i>
                                                                                        </span>
                                                                                        <h5 class="fs-16 mb-1 mt-1">Vé 3 - 200.000</h5>
                                                                                        <input type="number" name="ve3"/>

                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                            <div class="price-ticket-card-body border_top p-4">
                                                                                <div class="full-width d-flex flex-wrap justify-content-between align-items-center">
                                                                                    <div class="icon-box">
                                                                                        <div class="icon me-3">
                                                                                            <i class="fa-solid fa-ticket"></i>
                                                                                        </div>
                                                                                        <span class="text-145">Tổng số vé</span>
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

<!--                                            <button data-direction="prev" class="btn btn-default btn-hover steps_btn">Trước</button>
                                            <button data-direction="next" class="btn btn-default btn-hover steps_btn">Tiếp theo</button>-->
                                            <button type="submit" >Tạo </button>

                                    </div>
                                </div> 
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>
</div>
</footer>-->
<!-- Footer End-->


<script src="js/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/OwlCarousel/owl.carousel.js"></script>
<script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
<script src="vendor/ckeditor5/ckeditor.js"></script>
<script src="js/custom.js"></script>
<script src="js/night-mode.js"></script>
<script src="js/jquery-steps.min.js"></script>
<script src="js/datepicker.min.js"></script>
<script src="js/i18n/datepicker.en.js"></script>
<script>
    $('#add-event-tab').steps({
        onFinish: function () {
            alert('Wizard Completed');
        }
    });
</script>
<script>
    ClassicEditor
            .create(document.querySelector('#pd_editor'), {
                // toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]
            })
            .then(editor => {
                window.editor = editor;
            })
            .catch(err => {
                console.error(err.stack);
            });
</script>
<script>
    document.getElementById('thumb-img').addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('event-img').src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    });
</script>
</body>

</html>