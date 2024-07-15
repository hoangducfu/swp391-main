<%-- 
    Document   : ManagerDiscount
    Created on : Jul 15, 2024, 3:02:07 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    </head>

    <body class="d-flex flex-column h-100">
        <!-- Header Start-->
        <!--nếu là user-->
         <c:if test="${(account.getType() == 'staff')}">
            <jsp:include page="header_staff.jsp" ></jsp:include>
        </c:if>

        <div class="wrapper">
            <div class="hero-banner">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-8 col-md-10">
                            <div class="hero-banner-content">
                                <h2>Khám phá những sự kiện bạn yêu thích</h2>
                                <form action="exploreshow" method="post">
                                    <div class="search-form main-form">
                                        <div class="row g-3">
                                            <div class="col-lg-4 col-md-12">
                                                <div class="form-group search-category">
                                                    <select class="selectpicker" data-width="100%" data-size="7" name="lid">
                                                        <option value="0" data-icon="fa-solid fa-location-dot" ${(lid eq '0')? 'selected' : ''}>Địa điểm</option>
                                                        <c:forEach items="${listlocation}" var="c">
                                                            <option value="${c.getLocationId()}" ${(lid eq c.getLocationId())? 'selected' : ''} data-icon="fa-solid fa-location-dot">${c.getLocationName()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-12">
                                                <div >
                                                    <select class="selectpicker" data-width="100%" data-size="7"  name="cid">
                                                        <option value="0" ${(cid eq '0')? 'selected' : ''}>Danh mục</option>
                                                        <c:forEach items="${listcategory}" var="c" >
                                                            <option value="${c.getId()}" ${(cid eq c.getId() )? 'selected' : ''}>${c.getName()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-12">
                                                <button type="submit" class="main-btn btn-hover w-100">Tìm kiếm</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>    
                <div class="main-card mt-5">
                    <div class="dashboard-wrap-content p-4">
                        <div class="nav custom2-tabs btn-group" role="tablist">
                            <button class="tab-link ms-0 active" data-bs-toggle="tab" data-bs-target="#staffs-tab" type="button" role="tab" aria-controls="orders-tab" aria-selected="true">Mã giảm giá (<span class="total_event_counter">${dataDiscount.size()}</span>)</button>
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
                                                        <th scope="col">Mã giảm giá</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">% giảm giá</th>
                                                        <th scope="col">ID sự kiện </th>

                                                        <th scope="col">Trang thái</th>


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="c" items="${dataDiscount}">
                                                        <tr>										
                                                            <td>${c.getId()}</td>	
                                                            <td>${c.getCode()}</td>	
                                                            <td>${c.getQuantity()}</td>	
                                                            <td>${c.getDiscountPercent()}%</td>
                                                            <td>${c.getEventID()}</td>
                                                            <td>
                                                                <div class="card-actions">
                                                                    <form action="managerDiscount?action=delete&id=${c.id}" method="post">
                                                                        <button type="submit" class="action-link">
                                                                            <i class="fa-solid fa-trash-can"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>

                                                            </td>


                                                        </tr>
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
