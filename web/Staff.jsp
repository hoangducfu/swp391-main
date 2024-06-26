<%-- 
    Document   : staff_dashboard
    Created on : Jun 4, 2024, 1:03:15 AM
    Author     : hoangduc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/my_organisation_dashboard_reports.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:27 GMT -->
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
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/vertical-responsive-menu.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/night-mode.css" rel="stylesheet">

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
                                    <a href="CreateEvent_Ticket.jsp" class="create-btn btn-hover">
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
                <div class="overlay"></div>
            </div>
        </header>
        <!-- Header End-->
        <!-- Left Sidebar Start -->
        <nav class="vertical_nav">
            <div class="left_section menu_left" id="js-menu">
                <div class="left_section">
                    <ul>
                        
                        <li class="menu--item">
                            <a href="EventofStaff.jsp " class="menu--link" title="Events" data-bs-toggle="tooltip" data-bs-placement="right">
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
   	<div class="wrapper">
			<div class="hero-banner">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-8 col-md-10">
							<div class="hero-banner-content">
								<h2>Khám phá những sự kiện bạn yêu thích</h2>
								<div class="search-form main-form">
									<div class="row g-3">
										<div class="col-lg-4 col-md-12">
											<div class="form-group search-category">
												<select class="selectpicker" data-width="100%" data-size="5">
													<option value="browse_all" data-icon="fa-solid fa-tower-broadcast" selected>Địa điểm</option>
													<option value="online_events" data-icon="fa-solid fa-location-dot">Hà Nội</option>
													<option value="venue_events" data-icon="fa-solid fa-location-dot">TP.Hồ Chí Minh</option>
                                                                                                        <option value="online_events" data-icon="fa-solid fa-location-dot">Huế</option>
													<option value="venue_events" data-icon="fa-solid fa-location-dot">Đà Nẵng</option>
                                                                                                        <option value="venue_events" data-icon="fa-solid fa-location-dot">Đà Lạt</option>
												</select>
											</div>
										</div>
										<div class="col-lg-4 col-md-12">
											<div class="form-group">
												<select class="selectpicker" data-width="100%" data-size="5" data-live-search="true">
													<option value="01" selected>Danh mục</option>
													<option value="02">Ca Nhạc</option>
													<option value="03">Talk Show</option>
													<option value="04">Workshop</option>
													
												</select>
											</div>
										</div>
										
										<div class="col-lg-4 col-md-12">
											<a href="#" class="main-btn btn-hover w-100">Tìm kiếm</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="explore-events p-80">
				<div class="container">
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12">
							
						</div>
						<div class="col-xl-12 col-lg-12 col-md-12">
							<div class="event-filter-items">
								<div class="featured-controls">
									
									
									<div class="most-popular-posts">
										<div class="container">
											<div class="row">
												<div class="col-lg-12 col-md-12">
													<div class="slide-posts">
														<div class="row">
															<div class="col-lg-12 col-md-12">
																<div class="">
																	<div class="owl-carousel most-posts-slider owl-theme">
																		<div class="item">
																			<div class="main-card">
																				<div class="blog-block flex-slide">
																					<div class="blog-img-card left">
																						<a href="blog_detail_view.html" class="bbig-img">
																							<img src="images/blog-imgs/img-1.jpg" alt="">
																						</a>
																					</div>
																					<div class="blog-content right">
																						<a href="blog_detail_view.html" class="blog--title">Tổ chức tiệc Giáng sinh thành công cùng TicketTicket</a>
																						<p class="mb-4">Đón giáng sinh một cách trọn vẹn và yên vui cùng mọi người</p>
																						<div class="post-meta">
																							<span class="post-date me-4"><i class="fa-regular fa-calendar-days me-2"></i>20/12/2024</span>
																							<span class="post-read-time"><i class="fa-regular fa-clock me-2"></i>10 phút đọc </span>
																						</div>
																						<a href="blog_detail_view.html" class="main-btn h_50 btn-hover bt_40">Xem chi tiết</a>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="item">
																			<div class="main-card">
																				<div class="blog-block flex-slide">
																					<div class="blog-img-card left">
																						<a href="blog_detail_view.html" class="bbig-img">
																							<img src="images/blog-imgs/img-12.jpg" alt="">
																						</a>
																					</div>
																					<div class="blog-content right">
																						<a href="blog_detail_view.html" class="blog--title">Làm sao để quảng bá sự kiện trên mạng xã hội</a>
																						<p class="mb-4">Mạng xã hội ngày càng phát triển, ai ai cũng dùng mạng xã hội hàng ngày. Vậy làm sao để quảng bá sự kienj của mình đến với mọi người qua mạng xã hội.</p>
																						<div class="post-meta">
																							<span class="post-date me-4"><i class="fa-regular fa-calendar-days me-2"></i>06/05/2024</span>
																							<span class="post-read-time"><i class="fa-regular fa-clock me-2"></i>15 phút đọc</span>
																						</div>
																						<a href="blog_detail_view.html" class="main-btn h_50 btn-hover bt_40">Xem chi tiết</a>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="item">
																			<div class="main-card">
																				<div class="blog-block flex-slide">
																					<div class="blog-img-card left">
																						<a href="blog_detail_view.html" class="bbig-img">
																							<img src="images/blog-imgs/img-3.jpg" alt="">
																						</a>
																					</div>
																					<div class="blog-content right">
																						<a href="blog_detail_view.html" class="blog--title">Tổ chức tiệc Giáng sinh thành công cùng TicketTicket </a>
																						<p class="mb-4">>Mạng xã hội ngày càng phát triển, ai ai cũng dùng mạng xã hội hàng ngày.</p>
																						<div class="post-meta">
																							<span class="post-date me-4"><i class="fa-regular fa-calendar-days me-2"></i>06/05/2024</span>
																							<span class="post-read-time"><i class="fa-regular fa-clock me-2"></i>15 phút đọc </span>
																						</div>
																						<a href="blog_detail_view.html" class="main-btn h_50 btn-hover bt_40">Xem chi tiết</a>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="item">
																			<div class="main-card">
																				<div class="blog-block flex-slide">
																					<div class="blog-img-card left">
																						<a href="blog_detail_view.html" class="bbig-img">
																							<img src="images/blog-imgs/img-4.jpg" alt="">
																						</a>
																					</div>
																					<div class="blog-content right">
																						<a href="blog_detail_view.html" class="blog--title">Làm sao để quảng bá sự kiện trên mạng xã hội</a>
																						<p class="mb-4">Mạng xã hội ngày càng phát triển, ai ai cũng dùng mạng xã hội hàng ngày. Vậy làm sao để quảng bá sự kienj của mình đến với mọi người qua mạng xã hội.</p>
																						<div class="post-meta">
																							<span class="post-date me-4"><i class="fa-regular fa-calendar-days me-2"></i>06/05/2024</span>
																							<span class="post-read-time"><i class="fa-regular fa-clock me-2"></i>10 phút đọc </span>
																						</div>
																						<a href="blog_detail_view.html" class="main-btn h_50 btn-hover bt_40">Xem chi tiết</a>
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
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix arts concert workshops volunteer sports health_Wellness" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="venue_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-1.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="venue_event_detail_view.html" class="event-title">A New Way Of Life</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">AUD $100.00*</span>
                                                <span class="remaining"></span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>15 Apr</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Fri, 3.45 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>1h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix business workshops volunteer sports health_Wellness" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="online_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-2.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="online_event_detail_view.html" class="event-title">Earrings Workshop with Bronwyn David</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">AUD $75.00*</span>
                                                <span class="remaining"><i class="fa-solid fa-ticket fa-rotate-90"></i>6 Remaining</span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>30 Apr</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Sat, 11.20 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>2h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix coaching_consulting free concert volunteer health_Wellness bussiness" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="venue_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-3.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="venue_event_detail_view.html" class="event-title">Spring Showcase Saturday April 30th 2022 at 7pm</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">Free*</span>
                                                <span class="remaining"></span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>1 May</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Sun, 4.30 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>3h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class=" col-xl-3 col-lg-4 col-md-6 col-sm-12 mix health_Wellness concert volunteer sports free business" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="online_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-4.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="online_event_detail_view.html" class="event-title">Shutter Life</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">AUD $85.00</span>
                                                <span class="remaining"><i class="fa-solid fa-ticket fa-rotate-90"></i>7 Remaining</span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>1 May</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Sun, 5.30 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>1h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix concert sports health_Wellness free arts" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="venue_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-5.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="venue_event_detail_view.html" class="event-title">Friday Night Dinner at The Old Station May 27 2022</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">AUD $41.50*</span>
                                                <span class="remaining"></span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>27 May</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Fri, 12.00 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>5h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix workshops concert arts volunteer sports" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="venue_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-6.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="venue_event_detail_view.html" class="event-title">Step Up Open Mic Show</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">AUD $200.00*</span>
                                                <span class="remaining"></span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>30 Jun</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Thu, 4.30 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>1h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix volunteer free health_Wellness" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="online_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-7.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="online_event_detail_view.html" class="event-title">Tutorial on Canvas Painting for Beginners</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">AUD $50.00*</span>
                                                <span class="remaining"><i class="fa-solid fa-ticket fa-rotate-90"></i>17 Remaining</span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>17 Jul</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Sun, 5.30 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>1h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix sports concert volunteer arts" data-ref="mixitup-target">
                                    <div class="main-card mt-4">
                                        <div class="event-thumbnail">
                                            <a href="venue_event_detail_view.html" class="thumbnail-img">
                                                <img src="images/event-imgs/img-8.jpg" alt="">
                                            </a>
                                            <span class="bookmark-icon" title="Bookmark"></span>
                                        </div>
                                        <div class="event-content">
                                            <a href="venue_event_detail_view.html" class="event-title">Trainee Program on Leadership' 2022</a>
                                            <div class="duration-price-remaining">
                                                <span class="duration-price">AUD $120.00*</span>
                                                <span class="remaining"><i class="fa-solid fa-ticket fa-rotate-90"></i>7 Remaining</span>
                                            </div>
                                        </div>
                                        <div class="event-footer">
                                            <div class="event-timing">
                                                <div class="publish-date">
                                                    <span><i class="fa-solid fa-calendar-day me-2"></i>20 Jul</span>
                                                    <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                    <span>Wed, 11.30 PM</span>
                                                </div>
                                                <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>12h</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

<!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/our_blog.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:01 GMT -->
</html>