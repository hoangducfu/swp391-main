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
        <style>
            .table, .table th, .table td {
                border: 1px solid black;
                border-collapse: collapse;
            }

            .table th, .table td {
                padding: 8px;
                text-align: left;
            }

            .table th {
                background-color: #f2f2f2;
            }

            .actions {
                display: flex;
                gap: 10px;
                justify-content: center; /* Center the actions horizontally */
            }

            .actions a {
                min-width: 75px; /* Minimum width for buttons to ensure they are more noticeable */
                text-align: center;
            }
        </style>
        <style>
            .custom-btn-group .btn {
                border-radius: 20px;
                padding: 10px 20px;
                margin: 5px;
            }

            .custom-btn-group .btn.active {
                background-color: #28a745; /* Green color for active button */
                color: white;
                border: none;
            }

            .custom-btn-group .btn-secondary {
                background-color: #555555; /* Darker color for inactive buttons */
                color: white;
                border: none;
            }

            .custom-btn-group .btn-secondary:hover {
                background-color: #444444; /* Slightly lighter on hover */
            }

        </style>
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
                            <div class="back-button mt-3" style="padding-bottom: 20px   ">
                                <a href="exploreshow" class="main-btn btn-hover">
                                    <i class="fas fa-arrow-left me-2"></i> Quay Lại
                                </a>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="main-title checkout-title mb-5">
                                    <h3>Lịch sử mua vé</h3>
                                    <form action="payment_history" method="get">
                                        <div class="btn-group ml-3 custom-btn-group">
                                            <button type="submit" class="btn btn-secondary ${(payStatus eq '0') ? 'active' :'' }" name="payStatus" value="0">Tất cả</button>
                                        <button type="submit" class="btn btn-secondary ${(payStatus eq '00') ? 'active' :'' }" name="payStatus" value="00">Thành công</button>
                                        <button type="submit" class="btn btn-secondary ${(payStatus eq '03') ? 'active' :'' }" name="payStatus" value="03">Đang xử lý</button>
                                        <button type="submit" class="btn btn-secondary ${(payStatus eq '01') ? 'active' :'' }" name="payStatus" value="01">Đã hủy</button>
                                        <button type="submit" class="btn btn-secondary ${(payStatus eq '04') ? 'active' :'' }" name="payStatus" value="04">Đơn có vấn đề</button>
                                        <button type="submit" class="btn btn-secondary ${(payStatus eq '02') ? 'active' :'' }" name="payStatus" value="02">Không thành công</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <h4 style="color: red">${err}</h4>

                        <div class="col-xl-12 col-lg-12 col-md-12">
                            <div class="">
                                <div class="main-card">

                                    <div class="bp-content ">
                                        <div class="row">
                                            <style>
                                                .table, .table th, .table td {
                                                    border: 1px solid black;
                                                    border-collapse: collapse;
                                                }

                                                .table th, .table td {
                                                    padding: 8px;
                                                    text-align: left;
                                                }

                                                .table th {
                                                    background-color: #f2f2f2;
                                                }

                                                .actions {
                                                    display: flex;
                                                    gap: 10px;
                                                    justify-content: center; /* Center the actions horizontally */
                                                }

                                                .actions a {
                                                    min-width: 75px; /* Minimum width for buttons to ensure they are more noticeable */
                                                    text-align: center;
                                                }

                                                .table .action-col {
                                                    text-align: center;
                                                    border: 1px solid black; /* Ensure the action column has a border */
                                                }
                                            </style>

                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">STT</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Tên sự kiện </th>
                                                        <th scope="col">Thời gian thanh toán</th>
                                                        <th scope="col">Số tiền </th>
                                                        <th scope="col">Mã giao dịch</th>
                                                        <th scope="col">Nội dung</th>
                                                        <th scope="col">Phương thức</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col" style="text-align: center">Chi tiết</th>
                                                        <th scope="col" style="text-align: center">Hủy vé</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="count" value="1"/>
                                                    <c:forEach var="pay" items="${requestScope.pay_history}">
                                                        <tr>
                                                            <td>${count}</td>
                                                            <td>
                                                                <c:set var="eventName" value=""> </c:set>
                                                                <c:forEach var="e" items="${listevent}">
                                                                    <c:if test="${pay.getEvent_id() == e.getEventId()}">
                                                                        <c:set var="eventName" value="${e.getEventName()}" />
                                                                    </c:if>
                                                                </c:forEach>
                                                                ${eventName}
                                                            </td>
                                                            <td>
                                                                <c:set var="eventName" value=""/>
                                                                <c:forEach var="e" items="${listevent}">
                                                                    <c:if test="${pay.getEvent_id() == e.getEventId()}">
                                                                        <c:set var="eventName" value="${e.getEventName()}"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                ${eventName}
                                                            </td>
                                                            <td>${pay.getPayment_date()}</td>
                                                            <td>${pay.getAmount()}</td>
                                                            <td>${pay.getTrasaction_id()}</td>
                                                            <td>${pay.getTransaction_description()}</td>
                                                            <td>${pay.getPayment_method()}</td>
                                                            <td>
                                                                ${pay.status == '00' ? 'Thành công' : 
                                                                  (pay.status == '01' ? 'Vé đã hủy' : 
                                                                  (pay.status == '02' ? 'Không thành công' : 
                                                                  (pay.status == '03' ? 'Đang xử lý' : 
                                                                  (pay.status == '04' ? 'Cần xử lý' : 
                                                                  (pay.status == '05' ? 'Đang chờ xác nhận' : '')))))}
                                                            </td>
                                                            <td>
                                                                <a href="bookingdetail?payment_id=${pay.payment_id}&event_id=${pay.event_id}" type="button" class="btn btn-success">Chi tiết</a>
                                                            </td>
                                                            <td class="action-col">
                                                                <div class="actions">
                                                                    <c:if test="${pay.status =='04'}">
                                                                        <a href="payment_cancel?payment_id=${pay.payment_id}&event_id=${pay.event_id}&id_seat=${pay.id_seat}&mode=refund" type="button" class="btn btn-success">Hoàn Tiền</a>
                                                                    </c:if>
                                                                    <c:if test="${pay.status =='00'}">
                                                                        <a href="payment_cancel?payment_id=${pay.payment_id}&event_id=${pay.event_id}&id_seat=${pay.id_seat}&mode=cancel" type="button" class="btn btn-success">Hủy</a>
                                                                    </c:if>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <c:set var="count" value="${count +1}"/>
                                                    </c:forEach>
                                                <p style="color: red">${mess}</p>
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