<%-- 
    Document   : explore_show
    Created on : Jun 12, 2024, 8:40:05 AM
    Author     : mactu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="dal.EventDAO" %>
﻿<!DOCTYPE html>
<html lang="en" class="h-100">
    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
    <head>
            <jsp:useBean id="a" class="dal.EventDAO" scope="request"></jsp:useBean>

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
        <!--nếu là user-->
        <c:if test="${!(account.getRoleid() eq '2')}">
            <jsp:include page="header_user.jsp"></jsp:include>
        </c:if>
        <!--nếu là staff-->
        <c:if test="${(account.getRoleid() eq '2')}">
            <jsp:include page="header_staff.jsp" ></jsp:include>
        </c:if>


        <!-- Header End-->
        <!-- Body Start-->
        <div class="wrapper">
            <div class="hero-banner">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8 col-md-10">
                            <div class="hero-banner-content">
                                <h2>Khám phá những sự kiện bạn yêu thích</h2>
                                <form action="exploreshow" method="post">
                                    <div class="search-form main-form">
                                        <div class="row g-3">
                                            <div class="col-lg-4 col-md-12">
                                                <div class="form-group search-category">
                                                    <select class="selectpicker" data-width="100%" data-size="7" name="lid">
                                                        <option value="0" data-icon="fa-solid fa-location-dot" ${(lid eq '0')? 'selected' : ''}>Địa điểm</option>
                                                        <c:forEach items="${listlocation}" var="c">
                                                            <option value="${c.getLocationId()}" ${(lid eq c.getLocationId())? 'selected' : ''} data-icon="fa-solid fa-location-dot">${c.getLocationName()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-12">
                                                <div >
                                                    <select class="selectpicker" data-width="100%" data-size="7"  name="cid">
                                                        <option value="0" ${(cid eq '0')? 'selected' : ''}>Danh mục</option>
                                                        <c:forEach items="${listcategory}" var="c" >
                                                            <option value="${c.getId()}" ${(cid eq c.getId() )? 'selected' : ''}>${c.getName()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-12">
                                                <button type="submit" class="main-btn btn-hover w-100">Tìm kiếm</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="explore-events p-80">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-filter-items">
                                <div class="featured-controls">
                                    <div class="controls">
                                        <p>Mã giảm giá dành cho những khác hàng mua trên 5 vé </p>
                                        <select>
                                            <option >Mã giảm giá</option>
                                            <c:forEach items="${listdiscount}" var="s" >
                                                <option>${s.getCode()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="controls">
                                        <button type="button" class="control" data-filter="all">All</button>
                                        <c:forEach items="${listcategory}" var="s" >
                                            <button type="button" class="control" data-filter=".${s.getName()}">${s.getName()}</button>
                                        </c:forEach> 
                                    </div>
                                    <div class="row" data-ref="event-filter-content">
                                        <!--for each-->
                                        <c:forEach items="${listevent}" var="event">
                                            <!--allCategory.get(event.getCategoryID())-->
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix ${event.getEventName()} concert workshops volunteer sports health_Wellness" data-ref="mixitup-target">
                                                <div class="main-card mt-4">
                                                    <div class="event-thumbnail">
                                                        <a href="eventdetail?eid=${event.getEventId()}" class="thumbnail-img">
                                                            <img src="${event.getEventImg()}" alt="">
                                                        </a>
                                                        <span class="bookmark-icon" title="Bookmark"  onClick="addToCart('${event.getEventId()}')"></span>
                                                    </div>
                                                    <div class="event-content">
                                                        <a href="eventdetail?eid=${event.getEventId()}" class="event-title">${event.getEventName()}</a>
                                                    </div>
                                                    <div class="event-footer">
                                                        <div class="event-timing">
                                                            <div class="publish-date">
                                                                <span><i class="fa-solid fa-calendar-day me-2"></i>${event.getTimeStartFormat()}</span>
                                                                <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                            </div>
                                                            <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>${event.getTimePeriod()}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <!--for each-->
                                    </div>
                                    
                                    <div class="browse-btn">
                                        <a href="#" class="main-btn btn-hover ">See More</a>
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
                                <h4>Company</h4>
                                <ul class="footer-link-list">
                                    <li><a href="about_us.html" class="footer-link">About Us</a></li>
                                    <li><a href="help_center.html" class="footer-link">Help Center</a></li>
                                    <li><a href="faq.html" class="footer-link">FAQ</a></li>
                                    <li><a href="contact_us.html" class="footer-link">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-content">
                                <h4>Useful Links</h4>
                                <ul class="footer-link-list">
                                    <li><a href="create.html" class="footer-link">Create Event</a></li>
                                    <li><a href="sell_tickets_online.html" class="footer-link">Sell Tickets Online</a></li>
                                    <li><a href="privacy_policy.html" class="footer-link">Privacy Policy</a></li>
                                    <li><a href="term_and_conditions.html" class="footer-link">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-content">
                                <h4>Resources</h4>
                                <ul class="footer-link-list">
                                    <li><a href="pricing.html" class="footer-link">Pricing</a></li>
                                    <li><a href="our_blog.html" class="footer-link">Blog</a></li>
                                    <li><a href="refer_a_friend.html" class="footer-link">Refer a Friend</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-content">
                                <h4>Follow Us</h4>
                                <ul class="social-links">
                                    <li><a href="#" class="social-link"><i class="fab fa-facebook-square"></i></a>
                                    <li><a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                                    <li><a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                                    <li><a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                                    <li><a href="#" class="social-link"><i class="fab fa-youtube"></i></a>
                                </ul>
                            </div>
                            <div class="footer-content">
                                <h4>Download Mobile App</h4>
                                <div class="download-app-link">
                                    <a href="#" class="download-btn"><img src="images/app-store.png" alt=""></a>
                                    <a href="#" class="download-btn"><img src="images/google-play.png" alt=""></a>
                                </div>
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
                                <p class="mb-0">© 2024, <strong>Barren</strong>. All rights reserved. Powered by Gambolthemes</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer End-->

        <script src="./js/jquery.min.js" type="text/javascript"></script>
        <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="./vendor/OwlCarousel/owl.carousel.js" type="text/javascript"></script>
        <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="./vendor/mixitup/dist/mixitup.min.js" type="text/javascript"></script>
        <!--	<script src="js/custom.js"></script>-->
        <script src="./js/night-mode.js" type="text/javascript"></script>
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
                                                                                alert('Sản phẩm đã được thêm vào giỏ hàng!');
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
                                                                    fetch('getcartcounr') // Cần tạo một Servlet khác để lấy số lượng sản phẩm trong giỏ hàng
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
    </body>

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
</html>
