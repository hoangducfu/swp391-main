<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    </head>

    <body class="d-flex flex-column h-100">
        <!-- Header Start-->
        <jsp:include page="header_user.jsp"></jsp:include>
            <!-- Header End-->
            <!-- Body Start-->
            <div class="wrapper">

                <div class="event-dt-block p-80">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="main-title checkout-title">
                                    <h3>Lịch sử mua vé</h3>
<!--                                    <a><a href="showpaymentcancel" target="_blank">Danh sách hủy vé</a>-->
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <div class="">
                                    <div class="main-card">

                                        <div class="bp-content ">
                                            <div class="row">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Booking ID</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Event ID</th>
                                                            <th scope="col">Thời gian thanh toán</th>
                                                            <th scope="col">Số tiền </th>
                                                            <th scope="col">Mã đơn</th>
                                                            <th scope="col">Nội Dung</th>
                                                            <th scope="col">Phương thức</th>
                                                            <th scope="col">Trạng thái</th>
                                                            <th scope="col" style="text-align: center">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="pay" items="${requestScope.pay_history}">
                                                        <tr>
                                                            <td>${pay.getPayment_id()}</td>
                                                            <td>${pay.getAccountId()}</td>
                                                            <td>${pay.getEvent_id()}</td>
                                                            <td>${pay.getPayment_date()}</td>
                                                            <td>${pay.getAmount()}</td>
                                                            <td>${pay.getTrasaction_id()}</td>
                                                            <td>${pay.getTransaction_description()}</td>
                                                            <td>${pay.getPayment_method()}</td>
                                                            <td>
                                                                ${pay.status == '00' ? 'Thành công' : 
                                                                  (pay.status == '01' ? 'Vé đã hủy' : 
                                                                  (pay.status == '02' ? 'Không thành công' : 
                                                                  (pay.status == '03' ? 'Đang xử lý' : '')))}
                                                            </td>                                                            <td style="text-align: center">
                                                                <a href="bookingdetail?payment_id=${pay.payment_id}&event_id=${pay.event_id}" type="button" class="btn btn-success">Detail</a>
                                                                <c:if test="${pay.status=='00'}">
                                                                    <a href="payment_cancel?payment_id=${pay.payment_id}&event_id=${pay.event_id}&id_seat=${pay.id_seat}" type="button" class="btn btn-success">Hủy</a>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <p style="color: red"> ${mess} </p>
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

            <!-- Footer End-->

            <script src="js/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/OwlCarousel/owl.carousel.js"></script>
            <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
            <script src="js/custom.js"></script>
            <script src="js/night-mode.js"></script>
    </body>
</html>