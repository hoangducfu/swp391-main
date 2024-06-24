
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="./header_staff.jsp" %>

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
        <style>
            .blur {
                filter: blur(5px);
            }
            .form-control-lg, .btn-lg {
                height: calc(2.5em + 1rem + 2px); /* Tăng chiều cao để chúng đồng đều */
                font-size: 1.25rem;
                line-height: 1.5;
                border-radius: 0.3rem;
            }
            .form-control-lg {
                padding: 1rem 1rem; /* Điều chỉnh đệm để phù hợp với chiều cao mới */
            }
            .btn-lg {
                padding: 0.5rem 1rem;
            }
            .selectpicker {
                height: calc(2.5em + 1rem + 2px); /* Tăng chiều cao để chúng đồng đều */
                padding: 0.5rem 1rem;
                font-size: 1.25rem;
                line-height: 1.5;
                border-radius: 0.3rem;
            }
            .controls {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%; /* Đảm bảo phần tử controls chiếm toàn bộ chiều rộng */
            }

            .right-select {
                margin-left: auto; /* Đẩy thẻ select về phía phải */
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            /* Đặt form để chiếm toàn bộ chiều rộng màn hình và loại bỏ padding/margin */
            .full-width-form {
                width: 100%;
                margin: 0;
                padding: 0;
            }

            /* Đặt các button và select để căn chỉnh đúng cách và không có khoảng cách thừa */
            .full-width-form button.control, .full-width-form select.right-select {
                margin: 0;
                padding: 0.5rem; /* Đệm bên trong */
                box-sizing: border-box; /* Đảm bảo padding được bao gồm trong chiều rộng/tổng */
                height: calc(2.5em + 1rem + 2px); /* Chiều cao nhất quán */
                font-size: 1rem; /* Cỡ chữ phù hợp */
            }

            /* Căn chỉnh các button và select theo chiều ngang */
            .full-width-form {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            /* Đảm bảo button và select không bị tràn */
            .full-width-form button.control, .full-width-form select.right-select {
                flex: 1; /* Đảm bảo các phần tử chiếm toàn bộ không gian cần thiết */
                margin-right: 0.5rem; /* Khoảng cách giữa các phần tử */
            }

            .full-width-form select.right-select {
                flex: none; /* Không cho phép select chiếm không gian linh hoạt */
            }
            .control.active {
                background-color: #6AC045; /* Màu nền sáng đèn */
                color: white; /* Màu chữ */
            }

        </style>
    </head>

    <body class="d-flex flex-column h-100">
        <!-- Header Start-->

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

                                    <button type="submit" name="cid" value="0" class="control ${(cid eq '0' or cid == null) ? 'active' : ''}">Tất cả</button>
                                    <c:forEach items="${listcategory}" var="s" >
                                        <button type="submit" name="cid" class="control ${(cid eq s.getId()) ? 'active' : ''}" value="${s.getId()}">${s.getName()}</button>
                                    </c:forEach> 
                                    <input type="hidden" name="cid" value="${cid}"/>   
                                    <select class="right-select" name="disable" onchange="this.form.submit()">
                                        <option value="2" ${(disable eq '2') ? 'selected' :''}>Tất cả</option>
                                        <option value="0" ${(disable eq '0') ? 'selected' :''}>Sự kiện sắp diễn ra</option>
                                        <option value="1" ${(disable eq '1') ? 'selected' :''}>Sự kiện đã dừng</option>
                                    </select> 
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
