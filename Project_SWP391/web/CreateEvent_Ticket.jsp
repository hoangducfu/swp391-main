ư<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="./header_staff.jsp" %>

<!DOCTYPE html>
<html lang="en" class="h-100">


    <head>
        <style>
            .default-event-thumb img {
                width: 100%; /* Đảm bảo hình ảnh chiếm toàn bộ chiều rộng của phần tử chứa */
            }
            .form-group {
                padding-top: 30px;
                padding-bottom: 30px;
            }
            .default-event-thumb img {
                width: 100%;
                height: 200px;
            } /* Đảm bảo ảnh chiếm toàn bộ khung chứa */

            .form-label {
                font-size: 16px;
            }
            .thumb-change-btn input[type="file"] {
                display: none;
            }
            .thumb-change-btn label {
                background-color: #007bff;
                color: white;
                padding: 5px 10px;
                cursor: pointer;
            }
        </style>
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
        <jsp:include page="header_staff.jsp"/>

        <!-- Header End-->
        <!-- Body Start-->
        <form action="createevent" method="post" enctype="multipart/form-data">
            <div class="wrapper">

                <div class="event-dt-block p-80">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-12 col-md-12">
                                <div class="main-title text-center">
                                    <h3>Tạo sự kiện</h3>
                                    <h4 style="color: green">${pass}</h4>
                                    <h4 style="color: red">${err}</h4>
                                </div>

                            </div>
                            <div class="col-xl-8 col-lg-9 col-md-12">
                                <div class="wizard-steps-block">
                                    <div id="add-event-tab" class="step-app">
                                        <ul class="step-steps">
                                            <li class="active">
                                                <a href="#tab_step1">
                                                    <span class="number"></span>
                                                    <span class="step-name">Chi tiết sự kiện</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab_step2">
                                                    <span class="number"></span>
                                                    <span class="step-name">Chi tiết vé</span>
                                                </a>
                                            </li>

                                        </ul>

                                        <div class="step-content">
                                           <div class="step-tab-panel step-tab-info active" id="tab_step1"> 
                                                <div class="tab-from-content">
                                                    <div class="main-card">
                                                        <div class="bp-title">
                                                            <h4><i class="fa-solid fa-circle-info step_icon me-3"></i>Chi tiết sự kiện</h4>
                                                        </div>
                                                        <div class="p-4 bp-form main-form">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12">
                                                                    <div class="form-group border_bottom pb_30">
                                                                        <label class="form-label fs-16">Tên sự kiện*</label>
                                                                        <input class="form-control h_50" type="text" name="nameEvent" placeholder="Enter event name here" value="${nameEvent}">
                                                                    </div>
                                                                    <div class="form-group border_bottom pt_30 pb_30">
                                                                        <label class="form-label fs-16">Thể loại của sự kiện*</label>
                                                                        <select class="selectpicker" name="categoryId" data-selected-text-format="count > 4"  title="Select category" >
                                                                            <c:forEach items="${listcategory}" var="c" >
                                                                                <option value="${c.getId()}" ${(categoryId eq c.getId() )? 'selected' : ''}>${c.getName()}</option>                                                                            </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group border_bottom pt_30 pb_30">
                                                                            <label class="form-label fs-16">Sự kiện của bạn bắt đầu khi nào?*</label>
                                                                            <div class="row g-2">
                                                                                <div class="col-md-6">
                                                                                    <label class="form-label mt-3 fs-6">Ngày diễn ra sự kiện.*</label>																
                                                                                    <div class="loc-group position-relative">
                                                                                        <input class="form-control " id="timeStart" name="timeStart" data-language="en" type="datetime-local" placeholder="MM/DD/YYYY" value="${timeStart}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">																		
                                                                                <div class="row g-2">
                                                                                    <div class="col-md-6">
                                                                                        <label class="form-label mt-3 fs-6" >Trong khoảng bao lâu</label>	
                                                                                        <select class="form-control " data-size="5" data-live-search="true" name="period">
                                                                                            <option value="60" ${(period eq '60')? 'selected' :''}>1 tiếng</option>
                                                                                            <option value="90" ${(period eq '90')? 'selected' :''}>1 tiếng 30 phút</option>
                                                                                            <option value="120" ${(period eq '120')? 'selected' :''}>2 tiếng</option>
                                                                                            <option value="150" ${(period eq '150')? 'selected' :''}>2 tiếng 30 phút</option>
                                                                                            <option value="180" ${(period eq '180')? 'selected' :''}>3 giờ</option>
                                                                                            <option value="210" ${(period eq '210')? 'selected' :''}>3 tiếng 30 phút</option>
                                                                                            <option value="225" ${(period eq '225')? 'selected' :''}>3 tiếng 45 phút</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="form-label">Thêm một vài hình ảnh cho sự kiện của bạn</label>
                                                                        <div class="content-holder">
                                                                            <div class="default-event-thumb">
                                                                                <div class="default-event-thumb-btn">
                                                                                    <div class="thumb-change-btn">
                                                                                        <input type="file" id="thumb-img" name="photo" accept=".jpg, .jpeg, .png">
                                                                                        <label for="thumb-img">Thay đổi hình ảnh</label>
                                                                                    </div>
                                                                                </div>
                                                                                <img id="event-img" src="image/icon/banner.png" alt=""/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group border_bottom pb_30">
                                                                        <label class="form-label fs-16">Mô tả chi tiết về sự kiện của bạn</label>
                                                                        <div class="text-editor mt-4">
                                                                            <textarea id="comments" name="describeEvent" rows="4" cols="97">${describeEvent}</textarea>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group pt_30 pb-2">
                                                                        <label class="form-label fs-16">Sự kiện của bạn diễn ra ở đâu*</label>
                                                                        <div class="stepper-data-set">
                                                                            <div class="content-holder template-selector">
                                                                                <div class="row g-4">


                                                                                    <div class="col-md-12">
                                                                                        <div class="form-group main-form mt-1">
                                                                                            <label class="form-label">Địa chỉ*</label>
                                                                                            <select class="selectpicker" name="locationId" data-size="5" title="Chọn địa chỉ" data-live-search="true">
                                                                                                <c:forEach  items="${listlocation}" var="c">
                                                                                                    <option value="${c.getLocationId()}" ${(locationId eq c.getLocationId())? 'selected' : ''} data-icon="fa-solid fa-location-dot">${c.getLocationName()}</option>
                                                                                                </c:forEach>

                                                                                            </select>
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

                                            <div class="step-tab-panel step-tab-gallery" id="tab_step2">
                                                <div class="tab-from-content">
                                                    <div class="main-card">
                                                        <div class="bp-title">
                                                            <h4><i class="fa-solid fa-ticket step_icon me-3"></i>Chi tiết vé</h4>
                                                        </div>
                                                        <div class="bp-form main-form">
                                                            <div class="p-4 form-group border_bottom pb_30">
                                                                <div class="">
                                                                    <div class="d-flex align-items-center justify-content-between pt-4 pb-3 full-width">
                                                                        <h3 class="fs-18 mb-0"> tổng số loại vé (<span class="venue-event-ticket-counter">3</span>)</h3>

                                                                    </div>

                                                                    <div class="ticket-type-item-list mt-4 d-flex flex-wrap">
                                                                        <div class="price-ticket-card" style="flex: 1; margin-right: 10px;">
                                                                            <div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
                                                                                <div class="d-flex align-items-center top-name">
                                                                                    <div class="icon-box" style="display: flex; align-items: center; margin: 20px;">
                                                                                        <span class="icon-big rotate-icon icon icon-green" style="margin-right: 15px; display: flex; align-items: center; justify-content: center; width: 50px; height: 50px; background-color: green; border-radius: 50%;">
                                                                                            <i class="fa-solid fa-ticket" style="font-size: 24px; color: white;"></i>
                                                                                        </span>
                                                                                        <div class="text-container" style="display: flex; flex-direction: column;">
                                                                                            <h5 class="fs-16 mb-1 mt-1" style="margin: 0; padding-bottom: 10px;">Giá vé loại 1</h5>
                                                                                            <input type="text" name="ve1" value="${ve1}" style="margin-bottom: 10px; padding: 5px; width: 150px;" />
                                                                                            <span class="text-145" style="margin-bottom: 5px;">Tổng số vé</span>
                                                                                            <input class="coupon-status" style="width: 50px; padding: 5px;" type="text" name="seatType1" value="${seatType1}" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="price-ticket-card" style="flex: 1; margin-right: 10px;">
                                                                            <div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
                                                                                <div class="d-flex align-items-center top-name">
                                                                                    <div class="icon-box" style="display: flex; align-items: center; margin: 20px;">
                                                                                        <span class="icon-big rotate-icon icon icon-green" style="margin-right: 15px; display: flex; align-items: center; justify-content: center; width: 50px; height: 50px; background-color: green; border-radius: 50%;">
                                                                                            <i class="fa-solid fa-ticket" style="font-size: 24px; color: white;"></i>
                                                                                        </span>
                                                                                        <div class="text-container" style="display: flex; flex-direction: column;">
                                                                                            <h5 class="fs-16 mb-1 mt-1" style="margin: 0; padding-bottom: 10px;">Giá vé loại 2</h5>
                                                                                            <input type="text" name="ve2" value="${ve2}" style="margin-bottom: 10px; padding: 5px; width: 150px;" />
                                                                                            <span class="text-145" style="margin-bottom: 5px;">Tổng số vé</span>
                                                                                            <input class="coupon-status" style="width: 50px; padding: 5px;" type="text" name="seatType2" value="${seatType2}" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="price-ticket-card" style="flex: 1;">
                                                                            <div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
                                                                                <div class="d-flex align-items-center top-name">
                                                                                    <div class="icon-box" style="display: flex; align-items: center; margin: 20px;">
                                                                                        <span class="icon-big rotate-icon icon icon-green" style="margin-right: 15px; display: flex; align-items: center; justify-content: center; width: 50px; height: 50px; background-color: green; border-radius: 50%;">
                                                                                            <i class="fa-solid fa-ticket" style="font-size: 24px; color: white;"></i>
                                                                                        </span>
                                                                                        <div class="text-container" style="display: flex; flex-direction: column;">
                                                                                            <h5 class="fs-16 mb-1 mt-1" style="margin: 0; padding-bottom: 10px;">Giá vé loại 3</h5>
                                                                                            <input type="text" name="ve3" value="${ve3}" style="margin-bottom: 10px; padding: 5px; width: 150px;" />
                                                                                            <span class="text-145" style="margin-bottom: 5px;">Tổng số vé</span>
                                                                                            <input class="coupon-status" style="width: 50px; padding: 5px;" type="text" name="seatType3" value="${seatType3}" />
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
                                        <div class="row" style="display: flex; justify-content: space-around; align-items: center;">    

                                            <div class="step-footer step-tab-pager mt-4 col-6">
                                                <button data-direction="prev" class="btn btn-default btn-hover steps_btn">Trước</button>
                                                <button data-direction="next" class="btn btn-default btn-hover steps_btn">Tiếp theo</button>

                                            </div>
                                            <div class="mt-4 col-6" ><!-- comment -->
                                                <button  type="submit" class="btn btn-default btn-hover steps_btn" >Tạo </button>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </form>




        <script src="js/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
        <script src="vendor/ckeditor5/ckeditor.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/night-mode.js"></script>
        <script src="js/jquery-steps.min.js"></script>
        <script src="js/datepicker.min.js"></script>
        <script src="js/i18n/datepicker.en.js"></script>
        <script>
            $('#add-event-tab').steps({
                onFinish: function () {
                    alert('Wizard Completed');
                }
            });
        </script>
        <script>
            ClassicEditor
                    .create(document.querySelector('#pd_editor'), {
                        // toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]
                    })
                    .then(editor => {
                        window.editor = editor;
                    })
                    .catch(err => {
                        console.error(err.stack);
                    });
        </script>
        <script>
            document.getElementById('thumb-img').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('event-img').src = e.target.result;
                    }
                    reader.readAsDataURL(file);
                }
            });
        </script>
        <!--ngăn chặn ngày tạo sự kiện-->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var dateInput = document.getElementById('timeStart');
                var today = new Date();
                today.setDate(today.getDate() + 1); // Ngày mai

                // Chuyển đổi thành định dạng phù hợp yyyy-MM-ddThh:mm
                var year = today.getFullYear();
                var month = ('0' + (today.getMonth() + 1)).slice(-2);
                var day = ('0' + today.getDate()).slice(-2);
                var hours = ('0' + today.getHours()).slice(-2);
                var minutes = ('0' + today.getMinutes()).slice(-2);

                var minDateTime = `${year}-${month}-${day}T${hours}:${minutes}`;
                        console.log("Minimum date and time set to:", minDateTime); // Kiểm tra giá trị của minDateTime
                        dateInput.setAttribute('min', minDateTime);
                    });
        </script>
    </body>

</html>