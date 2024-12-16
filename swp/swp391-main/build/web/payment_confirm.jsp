<%-- 
    Document   : payment_ticket
    Created on : Jun 16, 2024, 3:29:40 PM
    Author     : mactu
--%>
<!--đồng bộ-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header_user.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="wrapper">
            
            <div class="event-dt-block p-80">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-5 col-lg-7 col-md-10">
                            <div class="booking-confirmed-content">
                                <div class="main-card">
                                    <div class="booking-confirmed-top text-center p_30">
                                        <div class="booking-confirmed-img mt-4">
                                            <img src="images/confirmed.png" alt="">
                                        </div>
                                        <h4>Thanh toán thành công</h4>
                                        <p class="ps-lg-4 pe-lg-4">
                                            
                                            Chúng tôi vui mừng thông báo với bạn rằng yêu cầu đặt phòng của bạn đã được tiếp nhận và xác nhận.</p>
                                        <div class="add-calender-booking">

                                        </div>
                                    </div>

                                    <a class="main-btn btn-hover h_50 w-100 mt-5" href="exploreshow">Hoàn thành</a>
                                    <c:set var="confirm" value="${requestScope.event_pay_confirm}" />
                                    <c:set var="payconfirm" value="${requestScope.payconfirm}" />


                                    <div class="booking-confirmed-bottom">
                                        <div class="booking-confirmed-bottom-bg p_30">


                                        </div>

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

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/booking_confirmed.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:15 GMT -->
</html>
