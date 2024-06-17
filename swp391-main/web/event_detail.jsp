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
            <div class="breadcrumb-block">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-10">
                            <div class="barren-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item"><a href="explore_show.jsp">Explore Events</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Venue Event Detail View</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="event-dt-block p-80">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-top-dts">
                                <div class="event-top-dt">
                                    <h3 class="event-main-title">${event.timeStart}, ${event.timeEnd} </h3>
                                    <div class="event-top-info-status">
                                        <span class="event-type-name"><i class="fa-solid fa-location-dot"></i>${event.locationId}</span>
                                        <span class="event-type-name details-hr">Starts on <span class="ev-event-date">${event.timeStart}, ${event.timeEnd}</span></span>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-7 col-md-12">
                            <div class="main-event-dt">
                                <div class="event-img">
                                    <img src="images/event-imgs/${event.eventImg}" alt="">		
                                </div>
                                <div class="share-save-btns dropdown">
                                    <button class="sv-btn me-2"><i class="fa-regular fa-bookmark me-2"></i>Save</button>
                                    <button class="sv-btn" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-share-nodes me-2"></i>Share</button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#"><i class="fa-brands fa-facebook me-3"></i>Facebook</a></li>
                                        <li><a class="dropdown-item" href="#"><i class="fa-brands fa-twitter me-3"></i>Twitter</a></li>
                                        <li><a class="dropdown-item" href="#"><i class="fa-brands fa-linkedin-in me-3"></i>LinkedIn</a></li>
                                        <li><a class="dropdown-item" href="#"><i class="fa-regular fa-envelope me-3"></i>Email</a></li>
                                    </ul>
                                </div>							
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 col-md-12">
                            <div class="main-card event-right-dt">
                                <div class="bp-title">
                                    <h4>Event Details</h4>
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
                                        <i class="fa-solid fa-circle-user"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <!--lấy từ bảng account theo event id--> 
                                        <h4>Organised by</h4>
                                        <h5>The Teeny Rabbit</h5>
                                        <a href="attendee_profile_view.html">View Profile</a>
                                    </div>
                                </div>
                                <div class="event-dt-right-group">
                                    <div class="event-dt-right-icon">
                                        <i class="fa-solid fa-calendar-day"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <h4>Date and Time</h4>
                                        <h5>${event.timeStart}, ${event.timeEnd}</h5>
                                        <div class="add-to-calendar">
                                            <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fa-regular fa-calendar-days me-3"></i>Add to Calendar
                                            </a>
                                            <!--										<ul class="dropdown-menu">
                                                                                                                                    <li><a class="dropdown-item" href="#"><i class="fa-brands fa-windows me-3"></i>Outlook</a></li>
                                                                                                                                    <li><a class="dropdown-item" href="#"><i class="fa-brands fa-apple me-3"></i>Apple</a></li>
                                                                                                                                    <li><a class="dropdown-item" href="#"><i class="fa-brands fa-google me-3"></i>Google</a></li>
                                                                                                                                    <li><a class="dropdown-item" href="#"><i class="fa-brands fa-yahoo me-3"></i>Yahoo</a></li>
                                                                                                                            </ul>-->
                                        </div>
                                    </div>
                                </div>
                                <div class="event-dt-right-group">
                                    <div class="event-dt-right-icon">
                                        <i class="fa-solid fa-location-dot"></i>
                                    </div>
                                    <div class="event-dt-right-content">
                                        <h4>Location</h4>
                                        <h5 class="mb-0">${event.locationId}</h5>
                                        <a href="https://www.google.com/maps/search/${event.locationId}" target="_blank"><i class="fa-solid fa-location-dot me-2"></i>View Map</a>
                                    </div>
                                </div>
                                <div class="select-tickets-block">
                                    <h6>Description Tickets</h6>
                                    <p>${event.description}</p>

                                </div>
                                <div class="booking-btn">
                                    <a href="ControlerSeat?sid=${event.eventId}" class="main-btn btn-hover w-100">Book Now </a>
                                    <a href="vnpaytest?event_id=${event.eventId}" class="main-btn btn-hover w-100">Book Now clone</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="more-events">
                                <div class="main-title position-relative">
                                    <h3>More Events</h3>
                                    <a href="explore_events.html" class="view-all-link">Browse All<i class="fa-solid fa-right-long ms-2"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
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
</body>

<!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/venue_event_detail_view.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:55 GMT -->
</html>