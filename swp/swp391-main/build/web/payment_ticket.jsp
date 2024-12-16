<%-- 
Document   : payment_ticket
Created on : Jun 16, 2024, 3:29:40 PM
Author     : mactu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header_user.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--nghe sự kiện tắt web và nghe sự kiện back web-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="wrapper">

            <!--<div class="event-dt-block p-80">-->
            <div class="container">
                <div class="back-button mt-3" style="padding-bottom: 20px   ">

                            <a href="controllerseat?eid=${event_id}" class="main-btn btn-hover">
                                <i class="fas fa-arrow-left me-2"></i> Quay Lại
                            </a>
                        </div> 
                <div class="row justify-content-center">
                    <div class="col-xl-5 col-lg-7 col-md-10">
                        <div class="booking-confirmed-content">
                            <div class="main-card">
                                <div class="booking-confirmed-top text-center p_30">
                                    <div class="booking-confirmed-img mt-4">
                                        <img src="images/confirmed.png" alt="">
                                    </div>
                                    <h4>Thanh toán</h4>
                                    <p class="ps-lg-4 pe-lg-4">Chúng tôi vui mừng thông báo với bạn rằng yêu cầu đặt vé của bạn đã được tiếp nhận và xác nhận.</p>
                                    <div class="add-calender-booking">
                                        <!--										<h5>Add</h5>
                                                                                                                        <a href="#" class="cb-icon"><i class="fa-brands fa-windows"></i></a>
                                                                                                                        <a href="#" class="cb-icon"><i class="fa-brands fa-apple"></i></a>
                                                                                                                        <a href="#" class="cb-icon"><i class="fa-brands fa-google"></i></a>
                                                                                                                        <a href="#" class="cb-icon"><i class="fa-brands fa-yahoo"></i></a>-->
                                    </div>
                                </div>

                                <div class="booking-confirmed-bottom">
                                    <div class="booking-confirmed-bottom-bg p_30">
                                        <div class="event-order-dt">
                                            <div class="event-thumbnail-img">
                                                <img src="${event.getEventImg()}" alt="">
                                            </div>
                                            <div class="event-order-dt-content">
                                                <h5>${event.getEventName()}</h5>
                                                <span>${event.getTimeStartFormat()}, ${event.getTimePeriod()} </span>
                                                <div class="buyer-name">${user.username}</div>
                                                <div class="booking-total-tickets">
                                                    <i class="fa-solid fa-ticket rotate-icon"></i>
                                                    <span class="booking-count-tickets mx-2">${quantity}</span>x Vé
                                                </div>                                                              
                                                <div class="booking-total-grand">
                                                    Tổng : <span>${amount}vnd</span>
                                                </div>
                                                <div class="booking-total-grand">
                                                    Vị trí C : <span>${status}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <form action="vnpaytest" method="get">
                                            <label for="discountCodeInput">Nhập mã giảm giá:</label>
                                            <input type="text" id="discountCodeInput" name="discountCodeInput" value="${discountCode}">
                                            <input type="hidden" name="amount" value="${amount}">
                                            <input type="hidden" name="event_id" value="${event_id}">
                                            <input type="hidden" name="status" value="${status}">
                                            <input type="hidden" name="username" value="${username}">
                                            <input type="hidden" name="quantity" value="${quantity}">

                                            <button type="submit" class="main-btn btn-hover h_50 w-100 mt-5">Áp dụng mã giảm giá</button>

                                        </form>
                                        <div class="booking-total-grand">
                                            <p style="color: red">${err}</p>
                                            <c:if test="${not empty pass}">
                                                <p style="color: green">${pass}</p>
                                                Số tiền cần thanh toán sau khi giảm giá: <span>${discountAmount}vnd</span>
                                            </c:if>
                                        </div>

                                        <form action="vnpaytest" method="post">
                                            <input type="hidden" name="amount" value="${discountAmount}">
                                            <input type="hidden" name="event_id" value="${event_id}">
                                            <input type="hidden" name="status" value="${status}">
                                            <input type="hidden" name="username" value="${username}">
                                            <input type="hidden" name="quantity" value="${quantity}">
                                            <input type="hidden" name="discountCode" value="${discountCode}">
                                            <button type="submit" class="main-btn btn-hover h_50 w-100 mt-5">Thanh toán</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--</div>-->
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
