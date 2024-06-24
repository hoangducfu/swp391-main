<%-- 
    Document   : payment_ticket
    Created on : Jun 16, 2024, 3:29:40 PM
    Author     : mactu
--%>

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
                                        <h4>Hóa Đơn</h4>
                                        <p class="ps-lg-4 pe-lg-4">Chúng tôi vui mừng thông báo với bạn rằng yêu cầu đặt chỗ của bạn đã được tiếp nhận và xác nhận.</p>

                                    </div>

                                    <!--
                                    <c:set var="event" value="${requestScope.payment_event}"/>
                                    <c:set var="quantity" value="${requestScope.quantity}"/>
                                    <c:set var="amount" value="${requestScope.amount}"/>
                                    <c:set var="status" value="${requestScope.status}"/>
                                    -->
                                    <div class="booking-confirmed-bottom">
                                        <div class="booking-confirmed-bottom-bg p_30">
                                            <div class="event-order-dt">
                                                <div class="event-thumbnail-img">
                                                    <img src="${event.getEventImg()}" alt="">
                                                </div>
                                                <div class="event-order-dt-content">
                                                    <h5>${event.getEventName()}</h5>
                                                    <span>${event.getTimeStart()}, ${event.getTimeEnd()} </span>
                                                    <!--xác nhận lại biến user-->
                                                    <div class="buyer-name">${user.username}</div>
                                                    <div class="booking-total-tickets">
                                                        <i class="fa-solid fa-ticket rotate-icon"></i>
                                                        <span class="booking-count-tickets mx-2">${quantity}</span>x Vé
                                                    </div>  
                                                    <div class="booking-total-grand">
                                                        Vị trí C : <span>${status}</span>
                                                    </div>
                                                    <div class="booking-total-grand">
                                                        Tổng Tiền : <span>$${amount}</span>
                                                    </div>

                                                </div>
                                            </div>
                                                     <c:if test="${quantity >= 5}">

                                                        <form action="vnpaytest" method="get">
                                                            <label for="discountCodeInput">Nhập mã giảm giá:</label>
                                                            <input type="text" id="discountCodeInput" name="discountCodeInput" value="${discountCode}">
                                                            <input type="hidden" name="amount" value="${amount}">
                                                            <input type="hidden" name="event_id" value="${event.getEventId()}">
                                                            <input type="hidden" name="status" value="${status}">
                                                            <input type="hidden" name="username" value="${user}">
                                                            <input type="hidden" name="quantity" value="${quantity}">
                                                            <p>${err}</p>
                                                            <!-- Nút áp dụng mã giảm giá -->
                                                            <button type="submit" class="main-btn btn-hover h_50 w-100 mt-5">Áp dụng mã giảm giá</button>
                                                            <div class="booking-total-grand">
                                                                Số tiền cần thanh toán sau khi giảm giá: <span>$${discountAmount}</span>
                                                            </div>
                                                           
                                                        </form>

                                                    </c:if>
                                            <form action="vnpaytest" method="post">
                                                <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" hidden="" name="amount" type="number"  value="${amount}" />
                                                <input hidden="" name="event_id" value="${event.getEventId()}">
                                                <input hidden="" name="status" value="${status}">
                                                <input hidden="" name="username" value="${user.username}">
                                                <button type="submit" class="main-btn btn-hover h_50 w-100 mt-5" href>Thanh toán</button>
                                            </form>

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