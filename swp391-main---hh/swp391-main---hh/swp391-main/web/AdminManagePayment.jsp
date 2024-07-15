<%-- 
    Document   : staff_dashboard
    Created on : Jun 4, 2024, 1:03:15 AM
    Author     : hoangduc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/my_organisation_dashboard_reports.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:27 GMT -->
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
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/vertical-responsive-menu.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/night-mode.css" rel="stylesheet">

        <!-- Vendor Stylesheets -->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">	
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
        <jsp:include page="header_admin.jsp"></jsp:include>

            <!-- Header End-->
            <!-- Left Sidebar Start -->
        <jsp:include page="leftSidebar.jsp" ></jsp:include>

            <!-- Left Sidebar End -->
            <!-- Body Start -->
            <div class="wrapper wrapper-body">
                <div class="dashboard-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="d-main-title">
                                    <h3><i class="fa-regular fa-address-card me-3"></i>Quản lý đơn hàng</h3>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="main-card mt-5">
                                    <div class="dashboard-wrap-content p-4">
                                        <div class="nav custom2-tabs btn-group" role="tablist">
                                        </div>
                                        <div class="d-md-flex flex-wrap align-items-center">
                                            <div class="dashboard-date-wrap mt-4">
                                                <div class="form-group">
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="main-title checkout-title mb-5">
                                                            <form action="adminpayment" method="get">
                                                                <div class="btn-group ml-3 custom-btn-group">
                                                                    <button type="submit" class="btn btn-secondary ${(payStatus eq '0') ? 'active' :'' }" name="payStatus" value="0">Tất cả</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '00') ? 'active' :'' }" name="payStatus" value="00">Thành công</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '03') ? 'active' :'' }" name="payStatus" value="03">Đang xử lý</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '01') ? 'active' :'' }" name="payStatus" value="01">Đã hủy</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '02') ? 'active' :'' }" name="payStatus" value="02">Không thành công</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="relative-input position-relative">
                                                        <form action="adminpayment" method="get"> 
                                                            <div class="btn-group ml-3 custom-btn-group">
                                                                <input class="form-control h_40" type="text" placeholder="Tìm kiếm bằng mã thanh toán , mã giao dịch" name="keyword" value="${keyword}">
                                                                <button type="submit"><i class="uil uil-search"></i></button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="event-list">
                                        <div class="tab-content">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="">
                                                    <div class="main-card">

                                                        <div class="bp-content ">
                                                            <div class="row">
                                                                <table class="table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th scope="col">STT</th>
                                                                            <th scope="col">Email</th>
                                                                            <th scope="col">Tên sự kiện </th>
                                                                            <th scope="col">Thời gian thanh toán</th>
                                                                            <th scope="col">Số tiền </th>
                                                                            <th scope="col">Mã đơn</th>
                                                                            <th scope="col">Nội Dung</th>
                                                                            <th scope="col">Phương thức</th>
                                                                            <th scope="col">Trạng thái</th>
                                                                            <th scope="col">Chi Tiết</th>
                                                                                <c:if test="${(payStatus eq '03')}">
                                                                                <th scope="col" style="text-align: center">Hành động</th>
                                                                                </c:if>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:set var="count" value="1"/>
                                                                        <c:forEach var="pay" items="${listpay}">

                                                                            <tr>
                                                                                <td>${count}</td>
                                                                                <td>
                                                                                    <c:set var="accountName" value=""> </c:set>
                                                                                    <c:forEach var="c" items="${listcustomer}">
                                                                                        <c:if test="${pay.getAccountId() == c.getId()}">
                                                                                            <c:set var="accountName" value="${c.getUsername()}" />
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                    ${accountName}
                                                                                </td>
                                                                                <td>
                                                                                    <c:set var="eventName" value=""> </c:set>
                                                                                    <c:forEach var="e" items="${listevent}">
                                                                                        <c:if test="${pay.getEvent_id() == e.getEventId()}">
                                                                                            <c:set var="eventName" value="${e.getEventName()}" />
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
                                                                                      (pay.status == '03' ? 'Đang xử lý' : '')))}
                                                                                </td>                                                            <td style="text-align: center">
                                                                                    <a href="bookingdetail?payment_id=${pay.payment_id}&event_id=${pay.event_id}" type="button" class="btn btn-success">Chi tiết</a>
                                                                                    <c:if test="${pay.status=='00'}">
                                                                                        <!--<a href="payment_cancel?payment_id=${pay.payment_id}&event_id=${pay.event_id}&id_seat=${pay.id_seat}" type="button" class="btn btn-success">Hủy</a>-->
                                                                                    </c:if>
                                                                                </td>
                                                                                <c:if test="${(payStatus eq '03')}">
                                                                                    <td>
                                                                                        
                                                                                    </td>
                                                                                </c:if>
                                                                                </tr>
                                                                                <c:set var="count" value="${count +1}"/>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Body End -->

        <script src="${pageContext.request.contextPath}/js/vertical-responsive-menu.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
        <script src="${pageContext.request.contextPath}/js/custom.js"></script>
        <script src="js/night-mode.js"></script>

    </body>

</html>
