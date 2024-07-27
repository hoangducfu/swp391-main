<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="h-100">
    <style>
        .selected {
    color: #FF5733; /* Màu sắc của văn bản khi được chọn */
}

    </style>
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
                            <div class="offcanvas-body justify-content-center">
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
                                            <li><a class="dropdown-item" href="event_detail.jsp">Talkshow</a></li>
                                            <li><a class="dropdown-item" href="online_event_detail_view.html">Workshop</a></li>
                                        </ul>
                                    </li>
                                   
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Giúp đỡ
                                        </a>
                                        <ul class="dropdown-menu dropdown-submenu">
                                            <li><a class="dropdown-item" href="#">Help Center</a></li>
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
                                                    <h5>${account.getUsername()}</h5>
                                                </div>
                                            </li>
                                            <li class="profile-link">
                                                <a href="booking" class="link-item">Lịch sử mua hàng</a>
                                                <a href="view_profile.jsp" class="link-item">Tài khoản của tôi</a>									
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

            <div class="event-dt-block p-80">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="main-title checkout-title">
                                  <h3 id="processing">Danh sách Đang xử lý</h3>
                                  <h3 id="cancelled">Danh sách vé đã hủy</h3>
                                  <h3 id="failed">Danh sách vé không thể hủy</h3>
                            </div>
                        </div>
                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="">
                                <div class="main-card">

                                    <div class="bp-content ">
                                        <div class="row">
                                            <table class="table" id="processing-table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Event ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Số Ghế C: </th>
                                                        <th scope="col">Lý do</th>
                                                        <th scope="col">Trạng thái</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="showcancel" items="${requestScope.showcancel}">
                                                        <tr>
                                                            <td>${showcancel.id_event}</td>
                                                            <td>${showcancel.account_name}</td>
                                                            <td>${showcancel.id_seat}</td>
                                                            <td>${showcancel.reason}</td>
                                                            <td>${showcancel.status}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            
                                             <table class="table" id="cancelled-table" >
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Event ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Số Ghế C: </th>
                                                        <th scope="col">Lý do</th>
                                                        <th scope="col">Trạng thái</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="showcancel" items="${requestScope.showcancel_success}">
                                                        <tr>
                                                            <td>${showcancel.id_event}</td>
                                                            <td>${showcancel.account_name}</td>
                                                            <td>${showcancel.id_seat}</td>
                                                            <td>${showcancel.reason}</td>
                                                            <td>${showcancel.status}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            
                                            
                                             <table class="table" id="failed-table" >
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Event ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Số Ghế C: </th>
                                                        <th scope="col">Lý do</th>
                                                        <th scope="col">Trạng thái</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="showcancel" items="${requestScope.showcancel_fail}">
                                                        <tr>
                                                            <td>${showcancel.id_event}</td>
                                                            <td>${showcancel.account_name}</td>
                                                            <td>${showcancel.id_seat}</td>
                                                            <td>${showcancel.reason}</td>
                                                            <td>${showcancel.status}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            
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
<script>
    // Lấy các phần tử DOM cần thiết
    const processingTitle = document.getElementById('processing');
    const cancelledTitle = document.getElementById('cancelled');
    const failedTitle = document.getElementById('failed');

    const processingTable = document.getElementById('processing-table');
    const cancelledTable = document.getElementById('cancelled-table');
    const failedTable = document.getElementById('failed-table');

    // Ẩn tất cả các bảng, trừ bảng danh sách Đang xử lý ban đầu
    cancelledTable.classList.add('d-none');
    failedTable.classList.add('d-none');

    // Hàm để xử lý khi nhấp vào các tiêu đề
    function handleTitleClick(selectedTitle, selectedTable) {
        // Đặt lại các tiêu đề
        const titles = [processingTitle, cancelledTitle, failedTitle];
        titles.forEach(title => {
            if (title === selectedTitle) {
                title.classList.add('selected'); // Thêm lớp selected
            } else {
                title.classList.remove('selected'); // Bỏ lớp selected
            }
        });

        // Hiển thị bảng tương ứng và ẩn các bảng còn lại
        processingTable.classList.add('d-none');
        cancelledTable.classList.add('d-none');
        failedTable.classList.add('d-none');
        selectedTable.classList.remove('d-none');
    }

    // Đăng ký sự kiện click cho các tiêu đề
    processingTitle.addEventListener('click', () => {
        handleTitleClick(processingTitle, processingTable);
    });

    cancelledTitle.addEventListener('click', () => {
        handleTitleClick(cancelledTitle, cancelledTable);
    });

    failedTitle.addEventListener('click', () => {
        handleTitleClick(failedTitle, failedTable);
    });
</script>

            <script src="js/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/OwlCarousel/owl.carousel.js"></script>
            <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
            <script src="js/custom.js"></script>
            <script src="js/night-mode.js"></script>
    </body>
</html>