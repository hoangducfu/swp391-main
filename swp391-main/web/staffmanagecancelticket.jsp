<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="./header_staff.jsp" %>
﻿<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
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
        <link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/datepicker.min.css" rel="stylesheet">
        <link href="css/jquery-steps.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/night-mode.css" rel="stylesheet">

        <!-- Vendor Stylesheets -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">		
        <link href="vendor/ckeditor5/sample/css/sample.css" rel="stylesheet">
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

            .details-col, .actions-col {
                min-width: 150px; /* Adjust the minimum width as needed */
                text-align: center;
            }

            .actions {
                display: flex;
                flex-direction: column;
                gap: 5px;
                align-items: center;
            }
        </style>

    </style>

</head>

<body class="d-flex flex-column h-100">

    <!-- Header Start-->
    <!--nếu là user-->



    <!-- Header End-->
    <!-- Body Start-->
    <div class="wrapper">
        <div class="event-dt-block p-80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="main-title checkout-title">
                            <h3>Quản lý đơn hàng</h3>
                        </div>
                    </div>
                    <div class="col-xl-12 col-lg-12 col-md-12">
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
                                                        <form action="staffmanagecancelticket" method="get">
                                                            <div class="btn-group ml-3 custom-btn-group">
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '0') ? 'active' :'' }" name="payStatus" value="0">Tất cả</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '00') ? 'active' :'' }" name="payStatus" value="00">Thành công</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '03') ? 'active' :'' }" name="payStatus" value="03">Đang xử lý</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '01') ? 'active' :'' }" name="payStatus" value="01">Đã hủy</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '04') ? 'active' :'' }" name="payStatus" value="04">Đơn cần xử lý</button>
                                                                <button type="submit" class="btn btn-secondary ${(payStatus eq '02') ? 'active' :'' }" name="payStatus" value="02">Không thành công</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="relative-input position-relative">
                                                        <form action="staffmanagecancelticket" method="get"> 
                                                            <div class="btn-group ml-3 custom-btn-group">
                                                                <input type="hidden" name="payStatus" value="${payStatus}">
                                                                <input class="form-control h_50 w-600" type="text" placeholder="Tìm kiếm bằng mã thanh toán , mã giao dịch, tên sự kiện" title="Tìm kiếm bằng mã thanh toán , mã giao dịch , tên sự kiện" name="keyword" value="${keyword}">
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
                                                                            <th scope="col">Mã giao dịch</th>
                                                                            <th scope="col">Nội Dung</th>
                                                                            <th scope="col">Phương thức</th>
                                                                            <th scope="col">Trạng thái</th>
                                                                            <th scope="col" class="details-col" >Chi Tiết</th>
                                                                                <c:if test="${(payStatus eq '03' || payStatus eq '0' || payStatus eq '04')}">
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
                                                                                    <c:set var="accountName" value=""/> 
                                                                                    <c:forEach var="c" items="${listcustomer}">
                                                                                        <c:if test="${pay.getAccountId() == c.getId()}">
                                                                                            <c:set var="accountName" value="${c.getUsername()}"/>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                    ${accountName}
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
                                                                                <td class="details-col">
                                                                                    <a href="bookingdetail?payment_id=${pay.payment_id}&event_id=${pay.event_id}" type="button" class="btn btn-success" style="display: flex; justify-content: center" >Chi tiết</a>
                                                                                </td>
                                                                                <c:if test="${(payStatus eq '03' || payStatus eq '0' ||payStatus eq '04')}">
                                                                                    <td class="actions-col">
                                                                                        <c:if test="${pay.status=='03' || pay.status=='04' }">
                                                                                            <form method="post" action="staffmanagecancelticket?payid=${pay.payment_id}&keyword=${keyword}&payStatus=${payStatus}">
                                                                                                <div class="actions">
                                                                                                    <button type="button" class="btn btn-success" onclick="openModal('${pay.payment_id}', '${keyword}', '${payStatus}')">Xem</button>
                                                                                                    <c:if test="${pay.status=='03'}">
                                                                                                          <button type="submit" name="action" value="reject" class="btn btn-success">Từ chối</button>
                                                                                                    </c:if>
                                                                                                </div>
                                                                                            </form>
                                                                                        </c:if> 
                                                                                    </td>
                                                                                </c:if>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal();">&times;</span>
                <div id="modalContent">
                    <!-- Nội dung chi tiết đơn hàng sẽ được tải vào đây -->
                </div>
            </div>
        </div>
    </div>
    <!-- Body End-->
</body>

<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="./vendor/OwlCarousel/owl.carousel.js" type="text/javascript"></script>
<script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="./vendor/mixitup/dist/mixitup.min.js" type="text/javascript"></script>
<!--	<script src="js/custom.js"></script>-->
<script src="./js/night-mode.js" type="text/javascript"></script>
<script>
                    var containerEl = document.querySelector('[data-ref~="event-filter-content"]');

                    var mixer = mixitup(containerEl, {
                        selectors: {
                            target: '[data-ref~="mixitup-target"]'
                        }
                    });
</script>
<script>
    //Mở modal                
    function openModal(payid, keyword, payStatus) {
        const params = new URLSearchParams({
            payid: payid,
            keyword: keyword,
            payStatus: payStatus
        });

        fetch('staffmanagecancelticket', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: params.toString()
        })
                .then(response => response.text())
                .then(html => {
                    document.getElementById('modalContent').innerHTML = html;
                    var modal = document.getElementById("myModal");
                    modal.style.display = "block";
                })
                .catch(error => console.error('Error:', error));
    }
    // Hàm đóng modal
    function closeModal() {
        const modal = document.getElementById("myModal");
        modal.style.display = "none";
    }
</script>

<!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/explore_events.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:08:54 GMT -->
</html>
