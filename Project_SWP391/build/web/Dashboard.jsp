<%-- 
    Document   : staff_dashboard
    Created on : Jun 4, 2024, 1:03:15 AM
    Author     : hoangduc
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        </style>
    </head>

    <body class="d-flex flex-column h-100">

        <!-- Header Start-->
        <jsp:include page="header_admin.jsp"></jsp:include>
            <!-- Header End-->
            <!-- Left Sidebar Start -->
        <jsp:include page="leftSidebar.jsp"></jsp:include>
            <!-- Left Sidebar End -->
            <!-- Body Start -->
            <div class="wrapper wrapper-body">
                <div class="dashboard-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="d-main-title">
                                    <h3><i class="fa-solid fa-gauge me-3"></i>Quản lí doanh thu</h3>
                                </div>
                            </div>
                            <div class="col-md-12">

                                <div class="main-card mt-4">
                                    <div class="dashboard-wrap-content">
                                        <div class="d-flex flex-wrap justify-content-between align-items-center p-4">
                                            <div class="dashboard-date-wrap d-flex flex-wrap justify-content-between align-items-center">
                                                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                                                <style>
                                                    h4 {
                                                        margin-bottom: 80px;
                                                        font-size: 18px;
                                                        color: #333;
                                                    }
                                                    #reportForm {
                                                        background-color: #fff;
                                                        padding: 20px;
                                                        border-radius: 10px;
                                                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                                                        display: flex;
                                                        align-items: center;
                                                    }
                                                    label {
                                                        font-weight: bold;
                                                        margin-right: 10px;
                                                    }
                                                    select {
                                                        padding: 10px;
                                                        border: 1px solid #ccc;
                                                        border-radius: 5px;
                                                        font-size: 16px;
                                                        margin-right: 20px;
                                                    }
                                                    button {
                                                        height: 45px;
                                                        width: 120px;
                                                        border: none;
                                                        border-radius: 5px;
                                                        background-color: #007bff;
                                                        color: #fff;
                                                        font-size: 16px;
                                                        cursor: pointer;
                                                        transition: background-color 0.3s;
                                                        margin-left: auto;
                                                    }
                                                    button:hover {
                                                        background-color: #0056b3;
                                                    }
                                                </style>

                                                <form id="reportForm" action="report" method="get">
                                                    <h4>Chọn mốc thời gian:</h4>
                                                    <label for="month">Tháng: </label>
                                                    <select id="month" name="month">
                                                        <option value="01">1</option>
                                                        <option value="02">2</option>
                                                        <option value="03">3</option>
                                                        <option value="04">4</option>
                                                        <option value="05">5</option>
                                                        <option value="06">6</option>
                                                        <option value="07">7</option>
                                                        <option value="08">8</option>
                                                        <option value="09">9</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                    <label for="year" style="margin-left: 40px">Năm: </label>
                                                    <select id="year" name="year">
                                                        <option value="2021">2021</option>
                                                        <option value="2022">2022</option>
                                                        <option value="2023">2023</option>
                                                        <option value="2024">2024</option>
                                                        <option value="2025">2025</option>
                                                        <option value="2026">2026</option>
                                                        <option value="2027">2027</option>
                                                    </select>
                                                    <button type="submit" style="height: 50px; width: 100px; border-radius: 10px; margin-left: 290px">Xem </button>
                                                </form>
                                                <script>
                                                    // Function to get the value of a URL parameter
                                                    function getUrlParameter(name) {
                                                        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                                                        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                                                        var results = regex.exec(location.search);
                                                        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
                                                    }

                                                    // Set the selected value of the month dropdown
                                                    var selectedMonth = getUrlParameter('month');
                                                    if (selectedMonth) {
                                                        document.getElementById('month').value = selectedMonth;
                                                    }

                                                    // Set the selected value of the year dropdown
                                                    var selectedYear = getUrlParameter('year');
                                                    if (selectedYear) {
                                                        document.getElementById('year').value = selectedYear;
                                                    }
                                                </script>

                                                <div class="dashboard-report-content">
                                                    <div class="row">
                                                        <div class="col-xl-3 col-lg-6 col-md-6">
                                                            <div class="dashboard-report-card purple">
                                                                <div class="card-content">
                                                                    <div class="card-content">
                                                                        <span class="card-title fs-6">Tổng số doanh thu:</span>
                                                                        <span class="card-sub-title fs-3" id="totalAmount">
                                                                        <fmt:formatNumber value="${monthlyReportData.totalAmount}" pattern="#,##0"/>
                                                                    </span>
                                                                </div>
                                                                <div class="card-media">
                                                                    <i class="fa-solid fa-money-bill"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-3 col-lg-6 col-md-6">
                                                        <div class="dashboard-report-card red">
                                                            <div class="card-content">
                                                                <div class="card-content">
                                                                    <span class="card-title fs-6">Số lượng đơn hàng:</span>
                                                                    <span class="card-sub-title fs-3">${monthlyReportData.totalOrders}</span>
                                                                    <div class="d-flex align-items-center"></div>
                                                                </div>
                                                                <div class="card-media">
                                                                    <i class="fa-solid fa-box"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-3 col-lg-6 col-md-6">
                                                        <div class="dashboard-report-card info">
                                                            <div class="card-content">
                                                                <div class="card-content">
                                                                    <span class="card-title fs-6">Số lượng đơn hàng bị hủy:</span>
                                                                    <span class="card-sub-title fs-3">${monthlyReportData.totalCanceledOrders}</span>
                                                                    <div class="d-flex align-items-center"></div>
                                                                </div>
                                                                <div class="card-media">
                                                                    <i class="fa-solid fa-box"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-3 col-lg-6 col-md-6">
                                                        <div class="dashboard-report-card success">
                                                            <div class="card-content">
                                                                <div class="card-content">
                                                                    <span class="card-title fs-6">Số lượng đơn hàng lỗi:</span>
                                                                    <span class="card-sub-title fs-3">${monthlyReportData.totalFailedOrders}</span>
                                                                    <div class="d-flex align-items-center"></div>
                                                                </div>
                                                                <div class="card-media">
                                                                    <i class="fa-solid fa-box"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-3 col-lg-6 col-md-6">
                                                        <div class="dashboard-report-card info">
                                                            <div class="card-content">
                                                                <div class="card-content">
                                                                    <span class="card-title fs-6">Số lượng đơn hàng đang xử lý:</span>
                                                                    <span class="card-sub-title fs-3">${monthlyReportData.totalProcessingOrders}</span>
                                                                    <div class="d-flex align-items-center"></div>
                                                                </div>
                                                                <div class="card-media">
                                                                    <i class="fa-solid fa-box"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <canvas id="myChart" width="400" height="200"></canvas>
                                                <c:if test="${not empty reportData}">
                                                <script>
                                                    var reportData = <%= new com.google.gson.Gson().toJson(request.getAttribute("reportData")) %>;

                                                    var labels = reportData.map(data => data.paymentDate);
                                                    var totalAmounts = reportData.map(data => data.totalAmount);
                                                    var totalOrders = reportData.map(data => data.totalOrders);
                                                    var totalCanceledOrders = reportData.map(data => data.totalCanceledOrders);
                                                    var totalFailedOrders = reportData.map(data => data.totalFailedOrders);
                                                    var totalProcessingOrders = reportData.map(data => data.totalProcessingOrders);

                                                    var ctx = document.getElementById('myChart').getContext('2d');
                                                    var myChart = new Chart(ctx, {
                                                        type: 'bar',
                                                        data: {
                                                            labels: labels,
                                                            datasets: [
                                                                {
                                                                    label: 'Tổng doanh thu',
                                                                    data: totalAmounts,
                                                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                                                    borderColor: 'rgba(75, 192, 192, 1)',
                                                                    borderWidth: 1
                                                                },
                                                                {
                                                                    label: 'Tổng đơn hàng',
                                                                    data: totalOrders,
                                                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                                                    borderColor: 'rgba(54, 162, 235, 1)',
                                                                    borderWidth: 1
                                                                },
                                                                {
                                                                    label: 'Đơn hàng đã hủy',
                                                                    data: totalCanceledOrders,
                                                                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                                                    borderColor: 'rgba(255, 99, 132, 1)',
                                                                    borderWidth: 1
                                                                },
                                                                {
                                                                    label: 'Đơn hàng lỗi',
                                                                    data: totalFailedOrders,
                                                                    backgroundColor: 'rgba(255, 206, 86, 0.2)',
                                                                    borderColor: 'rgba(255, 206, 86, 1)',
                                                                    borderWidth: 1
                                                                },
                                                                {
                                                                    label: 'Đơn hàng đang xử lý',
                                                                    data: totalProcessingOrders,
                                                                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                                                                    borderColor: 'rgba(153, 102, 255, 1)',
                                                                    borderWidth: 1
                                                                }
                                                            ]
                                                        },
                                                        options: {
                                                            responsive: true,
                                                            interaction: {
                                                                mode: 'index',
                                                                intersect: false,
                                                            },
                                                            scales: {
                                                                y: {
                                                                    beginAtZero: true
                                                                }
                                                            }
                                                        }
                                                    });
                                                </script>
                                            </c:if>
                                            <c:if test="${empty reportData}">
                                                <p>Không có dữ liệu báo cáo hàng ngày cho tháng và năm đã chọn.</p>
                                            </c:if>

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
                    <script>
                        // Function to get the value of a URL parameter
                        function getUrlParameter(name) {
                            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                            var results = regex.exec(location.search);
                            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
                        }

                        // Set the selected value of the month dropdown
                        var selectedMonth = getUrlParameter('month');
                        if (selectedMonth) {
                            document.getElementById('month').value = selectedMonth;
                        }

                        // Set the selected value of the year dropdown
                        var selectedYear = getUrlParameter('year');
                        if (selectedYear) {
                            document.getElementById('year').value = selectedYear;
                        }

                        // Get current month and year
                        var today = new Date();
                        var currentMonth = ("0" + (today.getMonth() + 1)).slice(-2); // Adding 1 since getMonth() returns month from 0-11
                        var currentYear = today.getFullYear();

                        // Set the current month and year as default values if they are not already set
                        if (!selectedMonth) {
                            document.getElementById('month').value = currentMonth;
                        }
                        if (!selectedYear) {
                            document.getElementById('year').value = currentYear;
                        }
                    </script>

                    </body>

                    </html>
