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
                                    <h3><i class="fa-regular fa-address-card me-3"></i>Quản lý người dùng</h3>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="main-card mt-5">
                                    <div class="dashboard-wrap-content p-4">
                                        <div class="nav custom2-tabs btn-group" role="tablist">
                                            <button class="tab-link ms-0 active" data-bs-toggle="tab" data-bs-target="#staffs-tab" type="button" role="tab" aria-controls="orders-tab" aria-selected="true">Nhân viên (<span class="total_event_counter">${dataStaff.size()}</span>)</button>
                                        <button class="tab-link" data-bs-toggle="tab" data-bs-target="#customers-tab" type="button" role="tab" aria-controls="customers-tab" aria-selected="false">Khách hàng (<span class="total_event_counter">${dataCustomer.size()}</span>)</button>
                                    </div>
                                    <div class="d-md-flex flex-wrap align-items-center">
                                        <div class="dashboard-date-wrap mt-4">
                                            <div class="form-group">
                                                <div class="relative-input position-relative">
                                                    <form action="managerlist?action=search" method="post">
                                                        <input class="form-control h_40" type="text" placeholder="Tìm kiếm bằng tên" name="name" value="${name}">
                                                        <button type="submit"><i class="uil uil-search"></i></button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="rs ms-auto mt-4 mt_r4">
                                            <a href="#addEmployeeModal" class="pe-4 w-100 ps-4 text-center co-main-btn h_40 d-inline-block" data-bs-toggle="modal"><i class="fa-solid fa-plus me-3" ></i>Thêm tài khoản</a>
                                        </div>

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
                                                                <th scope="col">Tài khoản</th>
                                                                <th scope="col">Số điện thoại</th>
                                                                <th scope="col">Ngày sinh</th>
                                                                <th scope="col">Trạng thái</th>
                                                                <th scope="col">Hành Động</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="c" items="${dataStaff}">
                                                                <tr>										
                                                                    <td>${c.id}</td>	
                                                                    <td>${c.username}</td>	
                                                                    <td>${c.phone}</td>	
                                                                    <td>${(c.dob eq 'null') ?  '' : c.dob}</td>
                                                                    <td>
                                                                        ${(c.getBanStatus() eq 'false') ? 'Hoạt động' : 'Khóa'}
                                                                    </td>
                                                                    <td>
                                                                        <c:if test="${c.getBanStatus() eq 'false'}">
                                                                            <div class="card-actions">
                                                                                <form action="managerlist?action=delete&id=${c.id}&type=staff" method="post">
                                                                                    <button type="submit" class="action-link lock-button" title="Khóa Tài Khoản">
                                                                                        <i class="fa-solid fa-times-square" ></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${c.getBanStatus() eq 'true'}">
                                                                            <div class="card-actions">
                                                                                <form action="managerlist?action=unban&id=${c.id}&type=staff" method="post">
                                                                                    <button type="submit" class="action-link unlock-button" title="Mở Khóa Tài Khoản">
                                                                                        <i class="fa-solid fa-check-square" ></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </c:if>

                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>									
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="customers-tab" role="tabpanel">
                                        <div class="table-card mt-4">
                                            <div class="main-table">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th scope="col">ID</th>
                                                                <th scope="col">Tài khoản</th>
                                                                <th scope="col">Số điện thoại</th>
                                                                <th scope="col">Ngày sinh</th>
                                                                <th scope="col">Trạng thái</th>
                                                                <th scope="col">Hành Động</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:set var="count" value="1"></c:set>
                                                            <c:forEach var="c" items="${dataCustomer}">
                                                                <tr>										
                                                                    <td>${count}</td>	
                                                                    <td>${c.username}</td>	
                                                                    <td>${c.phone}</td>	
                                                                    <td>${(c.dob eq 'null') ?  '' : c.dob}</td>
                                                                    <td>
                                                                        ${(c.getBanStatus() )}
                                                                    </td>
                                                                    <td>
                                                                        <c:if test="${c.getBanStatus() eq 'false'}">

                                                                            <div class="card-actions">
                                                                                <form action="managerlist?action=delete&id=${c.id}&type=customer" method="post">
                                                                                    <button type="submit" class="action-link lock-button" title="Khóa tài khoản">
                                                                                        <i class="fa-solid fa-times-square" ></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${c.getBanStatus() eq 'true'}">

                                                                            <div class="card-actions">
                                                                                <form action="managerlist?action=unban&id=${c.id}&type=customer" method="post">
                                                                                    <button type="submit" class="action-link  unlock-button" title="Mở khóa">
                                                                                        <i class="fa-solid fa-check-square" ></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </c:if>
                                                                    </td>
                                                                </tr>
                                                                <c:set var="count" value="${count+1}"></c:set>
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
                    </div>
                </div>
            </div>
        </div>
        <!-- Body End -->
        <div id="addEmployeeModal" class="modal fade" tabindex="-1" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="managerlist?action=add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title" id="addEmployeeModalLabel">Thêm tài khoản</h4>
                        </div>
                        <div class="row mt-3">
                            <p style="color: red">${err}</p>
                            <p style="color: green">${status}</p>
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group mt-4">
                                    <label class="form-label">Email*</label>
                                    <input class="form-control h_50" type="email" name="username" required placeholder="" value="${username}">																								
                                </div>
                            </div>


                            <div class="col-lg-12 col-md-12">
                                <div class="form-group mt-4">
                                    <label class="form-label">Số điện thoại</label>
                                    <input class="form-control h_50" type="text" name="phone"  placeholder="" value="${phone}">																								
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group mt-4">
                                    <label class="form-label">Ngày Sinh</label>
                                    <input class="form-control h_50" type="date" name="dob"  placeholder="" value="${dob}">																								
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group mt-4">
                                    <label class="form-label">Vị trí*</label>
                                    <div class="d-flex">
                                        <div class="form-check me-3">
                                            <input class="form-check-input" type="radio" name="position" id="genderMale" value="1"  ${(position eq '1')? 'checked':''} required>
                                            <label class="form-check-label" for="genderMale">Nhân viên</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="position" id="genderFemale" value="2"  ${(position eq '2')? 'checked':''} required>
                                            <label class="form-check-label" for="genderFemale">Khách hàng</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6">		
                                <button class="btn btn-secondary w-100 mt-4" type="reset">Reset</button>
                            </div>
                            <!-- Nút Cancel -->
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
