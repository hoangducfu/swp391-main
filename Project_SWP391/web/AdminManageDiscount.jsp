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
            .lock-button {
                background-color: red;
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .unlock-button {
                background-color: green;
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 5px;
            }


        </style>
        <style>
            .d-main-title {
                display: flex;
                align-items: center;
            }

            .d-main-title h3 {
                margin: 0;
                display: flex;
                align-items: center;
            }

            .menu--icon {
                margin-right: 10px; /* Adjust the spacing as needed */
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
                                    <h3><i class="fa-solid fa-rectangle-ad menu--icon"></i>Quản lý khuyến mãi</h3>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="main-card mt-5">
                                    <div class="dashboard-wrap-content p-4">

                                        <div class="d-md-flex flex-wrap align-items-center">
                                            <div class="dashboard-date-wrap mt-4">
                                                <div class="form-group">
                                                    <div class="relative-input position-relative">
                                                        <form action="admindiscount?action=search" method="post">
                                                            <input class="form-control h_40" type="text" placeholder="Tìm kiếm bằng tên mã giảm giá,sự kiện" name="keyword" value="${keyword}">
                                                        <button type="submit"><i class="uil uil-search"></i></button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                            </div>
                            <div class="event-list">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="staffs-tab" role="tabpanel">
                                        <div class="table-card mt-4">
                                            <div class="main-table">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th scope="col">Stt</th>
                                                                <th scope="col">Mã giảm giá</th>
                                                                <th scope="col">Số lượng</th>
                                                                <th scope="col">%giảm giá</th>
                                                                <th scope="col">Tên sự kiện</th>
                                                                <th scope="col">Trạng thái</th>
                                                                <th scope="col">Hành Động</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:set var="count" value="1"></c:set>
                                                            <c:forEach var="c" items="${dataDiscount}">
                                                                <tr>										
                                                                    <td>${count}</td>	
                                                                    <td>${c.getCode()}</td>	
                                                                    <td>${c.getQuantity()}</td>	
                                                                    <td>${c.getDiscountPercent()}%</td>
                                                                    <td>
                                                                        <c:set var="eventName" value=""> </c:set>
                                                                        <c:forEach var="e" items="${dataEvent}">
                                                                            <c:if test="${c.getEventID() == e.getEventId()}">
                                                                                <c:set var="eventName" value="${e.getEventName()}" />
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        ${eventName}

                                                                    </td>
                                                                    <td>${c.getStatus() eq '0'? 'Đang bật' : 'Đã tắt'}</td>
                                                                    <td>
                                                                        <div class="card-actions">
                                                                            <form action="admindiscount?id=${c.getId()}&action=update&status=${c.getStatus()}" method="post">
                                                                                <button type="submit" class="action-link  ${c.getStatus() eq '0' ? 'lock' :'unlock'}-button" title="${c.getStatus() eq '0' ? 'Đóng' : 'Mở khóa'}">
                                                                                    <i class="fa-solid fa-${c.getStatus() eq '0' ? 'times':'check'}-square" ></i>
                                                                                </button>
                                                                            </form>
                                                                        </div>
                                                                    </td>
                                                                    <c:set var="count" value="${count+1}"></c:set>
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
        <script>
            $(document).ready(function () {
                // Kiểm tra xem có lỗi không và hiển thị modal nếu có
                var err = "${err}";
                if (err && err.length > 0) {
                    $('#addEmployeeModal').modal('show');
                }
                var status = "${status}";
                if (status && status.length > 0) {
                    $('#addEmployeeModal').modal('show');
                }
            });
        </script>
    </body>

</html>
