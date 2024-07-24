<%-- 
    Document   : CreateDiscount
    Created on : Jul 15, 2024, 2:38:50 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="h-100">
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
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="css/night-mode.css" rel="stylesheet">
    <!-- Vendor Stylesheets -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .discount-form-frame {
            background-color: #f0f0f0; /* Màu nền xám trắng */
            padding: 20px;
            border: 1px solid #ccc; /* Viền xám nhạt */
            border-radius: 5px; /* Đường viền cong */
        }

        .discount-form-frame form div {
            margin-bottom: 10px;
        }

        .discount-form-frame label {
            display: inline-block;
            width: 180px; /* Chiều rộng của nhãn */
            text-align: left;
            margin-right: 10px;
            color: #333; /* Màu chữ */
        }

        .discount-form-frame input[type="text"],
        .discount-form-frame input[type="number"] {
            width: 200px; /* Chiều rộng của input */
            padding: 5px;
            box-sizing: border-box; /* Đảm bảo padding và border không làm thay đổi kích thước input */
            background-color: white; /* Màu nền của ô input là trắng */
            border: 1px solid #ccc; /* Viền */
            color: #333; /* Màu chữ */
        }

        .discount-form-frame button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50; /* Màu nền nút */
            color: white; /* Màu chữ nút */
            border: none;
            cursor: pointer;
        }

        /* Hover effect for button */
        .discount-form-frame button:hover {
            background-color: #45a049;
        }

        .back-button {
            background-color: #4CAF50; /* Màu nền nút quay lại */
            color: white; /* Màu chữ nút quay lại */
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .back-button:hover {
            background-color: #45a049;
        }

        .back-button i {
            margin-right: 5px; /* Khoảng cách giữa biểu tượng và chữ */
        }
    </style>
</head>

<body class="d-flex flex-column h-100">
    <c:if test="${account != null && account.getType() == 'staff'}">
        <c:if test="${account.getRoleId() == '1'}"> 
            <jsp:include page="header_admin.jsp"></jsp:include>
        </c:if>
        <c:if test="${account.getRoleId() == '2'}"> 
            <jsp:include page="header_staff.jsp"></jsp:include>
        </c:if>
    </c:if>

    <div class="wrapper">
        <div class="explore-events p-80">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <div class="event-filter-items">
                            <div class="featured-controls">
                                <div class="row" data-ref="event-filter-content">
                                    <div class="discount-form-frame">
                                        <div style="padding-bottom: 20px;">
                                            <button class="back-button" onclick="window.location.href = 'eventdetail?eid=${eventId}'">
                                                <i class="fas fa-arrow-left"></i> Quay lại
                                            </button>
                                        </div>
                                        <h2>Tạo mã giảm giá cho sự kiện ${eventName}</h2>
                                        <form action="discount" method="get">
                                            <input type="hidden" name="mode" value="create">
                                            <div>
                                                <label for="code">Mã giảm giá:</label>
                                                <input type="text" id="code" name="code" value="${code}" required>
                                            </div>
                                            <div>
                                                <label for="quantity">Số lượng mã:</label>
                                                <input type="number" id="quantity" name="quantity" value="${quantity}">
                                            </div>
                                            <div>
                                                <label for="discountPercent">Phần trăm giảm giá (%):</label>
                                                <input type="number" id="discountPercent" name="discountPercent" value="${discountPercent}" required>
                                            </div>
                                            <input type="hidden" id="eventId" name="eventId" value="${param.eventId}">
                                            <div>
                                                <button type="submit">Tạo mã giảm giá</button>
                                            </div>
                                        </form>

                                        <%-- Hiển thị thông báo lỗi nếu có --%>
                                        <c:if test="${not empty err}">
                                            <p style="color: red;">${err}</p>
                                        </c:if>

                                        <%-- Hiển thị thông báo thành công nếu có --%>
                                        <c:if test="${not empty message}">
                                            <p style="color: green;">${message}</p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<!-- Body End-->

<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="./vendor/OwlCarousel/owl.carousel.js" type="text/javascript"></script>
<script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="./vendor/mixitup/dist/mixitup.min.js" type="text/javascript"></script>
<script src="./js/night-mode.js" type="text/javascript"></script>
<script>
    var containerEl = document.querySelector('[data-ref~="event-filter-content"]');
    var mixer = mixitup(containerEl, {
        selectors: {
            target: '[data-ref~="mixitup-target"]'
        }
    });
</script>
</html>