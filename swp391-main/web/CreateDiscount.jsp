<<<<<<< Updated upstream
<%-- 
<<<<<<< Updated upstream
    Document   : CreateDiscount.jsp
    Created on : Jun 24, 2024, 10:13:23 PM
    Author     : Admin
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
=======

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        <link href="vendor/ckeditor5/sample/css/sample.css" rel="stylesheet">		
    </head>

    <body class="d-flex flex-column h-100">
        <!-- Header Start-->
        <!--nếu là user-->
        <c:if test="${!(account.getRoleid() eq '2')}">
            <jsp:include page="header_staff.jsp"></jsp:include>
        </c:if>

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
=======
        <link href="vendor/ckeditor5/sample/css/sample.css" rel="stylesheet">
        <style>
            .container{
                  display: flex;
                justify-content: center;
                align-items: center;
            }
            .discount-form-frame {
        background-color: #f0f0f0; /* Màu nền xám trắng */
        padding: 20px;
        border: 1px solid #ccc; /* Viền xám nhạt */
        border-radius: 5px; /* Đường viền cong */
    }
    
    .discount-form-frame form div {
        margin-bottom: 10px;
    }
    
    .discount-form-frame label {
        display: inline-block;
        width: 180px; /* Chiều rộng của nhãn */
        text-align: left;
        margin-right: 10px;
        color: #333; /* Màu chữ */
    }
    
    .discount-form-frame input[type="text"],
    .discount-form-frame input[type="number"] {
        width: 200px; /* Chiều rộng của input */
        padding: 5px;
        box-sizing: border-box; /* Đảm bảo padding và border không làm thay đổi kích thước input */
        background-color: white; /* Màu nền của ô input là trắng */
        border: 1px solid #ccc; /* Viền */
        color: #333; /* Màu chữ */
    }
    
    .discount-form-frame button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4CAF50; /* Màu nền nút */
        color: white; /* Màu chữ nút */
        border: none;
        cursor: pointer;
    }
    
    /* Hover effect for button */
    .discount-form-frame button:hover {
        background-color: #45a049;
    }
        </style>

        <style>
            .explore-events{
                display: flex;
                justify-content: center;
                align-items: center;
                
            }
        </style>

    </head>

    <body class="d-flex flex-column h-100">

        <!-- Header Start-->
        <!--nếu là user-->

        <!--nếu là staff-->
        <c:if test="${(account.getType() == 'staff')}">
            <jsp:include page="header_staff.jsp" ></jsp:include>
        </c:if>


        <!-- Header End-->
        <!-- Body Start-->
        <div class="wrapper">

            <div class="explore-events p-80" >
                <div class="container ">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="event-filter-items">
                                <div class="featured-controls">


                                    <div class="row" data-ref="event-filter-content">
                                        <!--for each-->

                                        <div class="discount-form-frame">
                                            <h2>Tạo mã giảm giá cho sự kiện</h2>
                                            <form action="discount" method="POST">
                                                <div>
                                                    <label for="code">Mã giảm giá:</label>
                                                    <input type="text" id="code" name="code" required>
                                                </div>
                                                <div>
                                                    <label for="quantity">Số lượng mã:</label>
                                                    <input type="number" id="quantity" name="quantity">
                                                </div>
                                                <div>
                                                    <label for="discountPercent">Phần trăm giảm giá (%):</label>
                                                    <input type="number" id="discountPercent" name="discountPercent" required>
                                                </div>
                                                <input type="hidden" id="eventId" name="eventId" value="${param.eventId}">
                                                <input type="hidden" id="eventName" name="eventName" value="${param.eventName}">
                                                <div>
                                                    <button type="submit">Tạo mã giảm giá</button>
                                                </div>
                                            </form>

                                            <%-- Hiển thị thông báo lỗi nếu có --%>
                                            <c:if test="${not empty err}">
                                                <p style="color: red;">${err}</p>
                                            </c:if>

                                            <%-- Hiển thị thông báo thành công nếu có --%>
                                            <c:if test="${not empty status}">
                                                <p style="color: green;">${status}</p>
                                            </c:if>
                                        </div>

                                        <a href="exploreshow">Quay lại trang chủ</a>

                                        <!--for each-->
                                    </div>

                                </div>
>>>>>>> Stashed changes
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<<<<<<< Updated upstream
            <div>    
                <div class="main-card mt-5">
                    <div class="dashboard-wrap-content p-4">
                        <div class="nav custom2-tabs btn-group" role="tablist">
                            <button class="tab-link ms-0 active" data-bs-toggle="tab" data-bs-target="#staffs-tab" type="button" role="tab" aria-controls="orders-tab" aria-selected="true">Mã giảm giá (<span class="total_event_counter">${dataDiscount.size()}</span>)</button>
                        </div>
                        <div class="d-md-flex flex-wrap align-items-center">

                            <div class="rs ms-auto mt-4 mt_r4">
                                <a href="#addEmployeeModal" class="pe-4 w-100 ps-4 text-center co-main-btn h_40 d-inline-block" data-bs-toggle="modal"><i class="fa-solid fa-plus me-3" ></i>Thêm mã giảm giá</a>
                            </div>

                        </div>

                    </div>
                    <div class="event-list">
                        <div class="tab-content">
                            <!--danh sách nhân viên-->
                            <div class="tab-pane fade show active" id="staffs-tab" role="tabpanel">
                                <div class="table-card mt-4">
                                    <div class="main-table">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Mã giảm giá</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Trang thái</th>


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="c" items="${dataDiscount}">
                                                        <tr>										
                                                            <td>${c.id}</td>	
                                                            <td>${c.code}</td>	
                                                            <td>${c.quantity}</td>	

                                                            <td>
                                                                <div class="card-actions">
                                                                    <form action="discount?action=delete&id=${c.id}" method="post">
                                                                        <button type="submit" class="action-link">
                                                                            <i class="fa-solid fa-trash-can"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>

                                                            </td>


                                                        </tr>
                                                    </c:forEach>`
                                                </tbody>									
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <!-- Body End -->
                <div id="addEmployeeModal" class="modal fade" tabindex="-1" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="discount?action=add" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title" id="addEmployeeModalLabel">Thêm mã giảm giá</h4>
                                </div>
                                <div class="row mt-3">
                                    <p style="color: red">${err}</p>
                                    <p style="color: green">${status}</p>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">Mã code</label>
                                            <input class="form-control h_50" type="text" name="code" required placeholder="" value="${code}">																								
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">Số lượng</label>
                                            <input class="form-control h_50" type="text" name="quantity" placeholder="" value="${quantity}">																								
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">		
                                        <button class="btn btn-secondary w-100 mt-4" type="reset">Reset</button>
                                    </div>
                                    <div class="col-lg-6 col-md-6">		
                                        <button class="btn btn-danger w-100 mt-4" data-bs-dismiss="modal" type="button">Cancel</button>
                                    </div>
                                    <div class="col-lg-12 col-md-12">		
                                        <button class="main-btn btn-hover w-100 mt-4" type="submit">Thêm</button>
                                    </div>
                                </div>
                            </form>                       
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
                    var containerEl = document.querySelector('[data-ref~="event-filter-content"]');

                    var mixer = mixitup(containerEl, {
                        selectors: {
                            target: '[data-ref~="mixitup-target"]'
                        }
                    });
                </script>
                </body>
                >>>>>>> Stashed changes
=======
        </div>
        <!-- Body End-->
    </body>

    <script src="./js/jquery.min.js" type="text/javascript"></script>
    <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="./vendor/OwlCarousel/owl.carousel.js" type="text/javascript"></script>
    <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="./vendor/mixitup/dist/mixitup.min.js" type="text/javascript"></script>
    <!--	<script src="js/custom.js"></script>-->
    <script src="./js/night-mode.js" type="text/javascript"></script>\
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
                            alert('Sản phẩm đã được thêm vào yêu thích!');
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
                fetch('GetcarcountServlet') // Cần tạo một Servlet khác để lấy số lượng sản phẩm trong giỏ hàng
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

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
</html>
>>>>>>> Stashed changes
