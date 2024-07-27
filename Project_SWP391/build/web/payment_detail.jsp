<%-- Document : payment_ticket Created on : Jun 16, 2024, 3:29:40 PM Author : mactu --%>
<!--đồng bộ-->
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

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
    <c:if test="${(account.getType() == 'customer')}">
            <jsp:include page="header_user.jsp"></jsp:include>
        </c:if>
        <!--nếu là staff-->
        <c:if test="${(account.getType() == 'staff')}">
            <c:if test="${account.getRoleId() eq '1'}"> 
                <jsp:include page="header_admin.jsp" ></jsp:include>
            </c:if>
            <c:if test="${account.getRoleId() eq '2'}"> 
                <jsp:include page="header_staff.jsp" ></jsp:include>
            </c:if>
        </c:if>
        <body class="d-flex flex-column h-100">

        

        <div class="wrapper">
            <div class="breadcrumb-block">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-10">
                            <div class="barren-breadcrumb">
                                <!--                                <nav aria-label="breadcrumb">
                                                                    <ol class="breadcrumb">
                                                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                                        <li class="breadcrumb-item active" aria-current="page">Booking
                                                                            Confirmed</li>
                                                                    </ol>
                                                                </nav>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="event-dt-block p-80">
                <div class="invoice-body">
                    <div class="back-button mt-3" style="padding-bottom: 20px   ">
                        <c:set var="back" value="exploreshow"/> 

                        <c:if test="${ empty account}">
                            <c:set var="back" value="exploreshow"/>
                        </c:if>

                        <c:if test="${(account.getType() eq 'customer')}">
                            <c:set var="back" value="payment_history"/> 
                        </c:if>
                        <!--nếu là staff-->
                        <c:if test="${(account.getType() eq 'staff')}">
                            <c:if test="${account.getRoleId() eq '1'}"> 
                                <c:set var="back" value="adminpayment"/> 
                            </c:if>
                            <c:if test="${account.getRoleId() eq '2'}"> 
                                <c:set var="back" value="staffmanagecancelticket"/> 
                            </c:if>
                        </c:if>

                        <a href="${back}" class="main-btn btn-hover">
                            <i class="fas fa-arrow-left me-2"></i> Quay Lại
                        </a>
                    </div>
                    <div class="invoice_dts">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="invoice_title">Chi tiết thanh toán</h2>
                            </div>
                            <div class="col-md-6">
                                <div class="vhls140">
                                    <ul>
                                        <li>
                                            <div class="vdt-list">Thanh toán bởi ${account.username}</div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="vhls140">
                                    <ul>
                                        <li>
                                            <div class="vdt-list">Ngày thanh toán : ${payed.payment_date}
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main-table bt_40">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Mã giao dịch</th>
                                        <th scope="col">Ghế</th>
                                        <th scope="col">Tên sự kiện</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Phương thức </th>
                                        <th scope="col">Tổng tiền</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>${payed.getTrasaction_id()}</td>
                                        <td>${payed.getId_seat()}</td>
                                        <td>${event.getEventName()}</td>
                                        <td>${payed.status == '00' ? 'Thành công' : 
                                              (payed.status == '01' ? 'Vé đã hủy' : 
                                              (payed.status == '02' ? 'Không thành công' : 
                                              (payed.status == '03' ? 'Đang xử lý' : 
                                              (payed.status == '04' ? 'Cần xử lý' : 
                                              (payed.status == '05' ? 'Đang chờ xác nhận' : '')))))}</td>
                                        <td>${payed.payment_method}</td>
                                        <td>${payed.amount}</td>
                                    </tr>

                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="invoice_footer">
                        <div class="cut-line">
                            <i class="fa-solid fa-scissors"></i>
                        </div>
                        <div class="main-card">

                            <div class="booking-confirmed-bottom">
                                <div class="booking-confirmed-bottom-bg p_30">
                                    <div class="event-order-dt">
                                        <div class="event-thumbnail-img">
                                            <img src="${event.getEventImg()}" alt="">
                                        </div>
                                        <div class="event-order-dt-content">
                                            <h5>${event.getEventName()}</h5>
                                            <div class="buyer-name"> ${event.getTimeStartFormat()},${event.getTimePeriod()}</div>
                                            <div class="buyer-name">${user.getUsername()}</div>
                                            <div class="buyer-name">Tổng tiền: ${payed.amount}</div>
                                            <div class="booking-total-tickets">
                                            </div>
                                            <div class="booking-total-grand">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="cut-line">
                            <i class="fa-solid fa-scissors"></i>
                        </div>
                        <!--<a class="main-btn btn-hover h_50 w-100 mt-5" href="exploreshow">Hoàn thành</a>-->
                    </div>
                    <div class="container">


                    </div>
                </div>
            </div>
            <!-- Body End-->
            <!-- Footer Start-->
        
            <!-- Footer End-->


            <script src="js/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/OwlCarousel/owl.carousel.js"></script>
            <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
            <script src="js/custom.js"></script>
            <script src="js/night-mode.js"></script>
    </body>

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/booking_confirmed.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:15 GMT -->

</html>
</body>

</html>