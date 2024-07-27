<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <link href='${pageContext.request.contextPath}/vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/night-mode.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
        <!-- Vendor Stylesheets -->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">

        <style>
            /* Custom styles for the edit form and button */
            .modal-content form {
                border: 2px solid green;
                padding: 10px;
            }

            .modal-content .btn-primary {
                background-color: green;
                border-color: green;
            }

            .modal-content .btn-primary:hover {
                background-color: darkgreen;
                border-color: darkgreen;
            }

            .about-step h5, .about-step span {
                margin-left: 10px;
            }
        </style>
    </head>
    <c:if test="${(account.getType() eq 'customer')}">
        <jsp:include page="header_user.jsp"></jsp:include>
    </c:if>
    <!--nếu là staff-->
    <c:if test="${(account.getType() eq 'staff')}">
        <jsp:include page="header_staff.jsp" ></jsp:include>
    </c:if>

    <body class="d-flex flex-column h-100">
        <!-- Body Start-->
        <div class="wrapper">
            <div class="profile-banner">
                <div class="hero-cover-block">
                    <div class="hero-cover">
                        <div class="hero-cover-img"></div>
                    </div>
                </div>
                <div class="user-dt-block">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-4 col-lg-5 col-md-12">
                                <div class="main-card user-left-dt">
                                    <div class="user-avatar-img">
                                                        <img src="image/icon/hihi.jpg" alt="">
                                    </div>
                                    <div class="user-dts">
                                        <c:set var="atPosition" value="${fn:indexOf(account.getUsername(), '@')}" />
                                        <c:set var="shortUsername" value="${fn:substring(account.getUsername(), 0, atPosition)}" />
                                        <h4 class="user-name">
                                            ${shortUsername}
                                            <span class="verify-badge"><i class="fa-solid fa-circle-check"></i></span>
                                        </h4>
                                        <span class="user-email">
                                            <c:set var="accountUser" value="${account}" />
                                            <h5>${accountUser.username}</h5>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8 col-lg-7 col-md-12">
                                <div class="right-profile">
                                    <div class="profile-tabs">
                                        
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade active show" id="feed" role="tabpanel" aria-labelledby="feed-tab">
                                                <div class="tab-content">
                                                    <div class="tab-pane fade" id="organised" role="tabpanel">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="main-card mt-4">
                                                                    <div class="card-top p-4">
                                                                        <div class="card-event-img">
                                                                            <img src="images/event-imgs/img-6.jpg" alt="">
                                                                        </div>
                                                                        <div class="card-event-dt">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                                <div class="main-card mt-4">
                                                    <div class="bp-title position-relative">
                                                        <h4>Thông tin</h4>

                                                        <button class="main-btn btn-hover ms-auto edit-btn me-3 pe-4 ps-4 h_40" data-bs-toggle="modal" data-bs-target="#editModal">
                                                            <i class="fa-regular fa-pen-to-square me-2"></i>Chỉnh sửa
                                                        </button>
                                                    </div>
                                                    <div class="about-details">
                                                        <h5>Mật khẩu:
                                                            <c:if test="${(account.getType() eq 'customer')}">
                                                                <c:if test="${account.getStatusGoogle()== true}">
                                                                    <div class="about-step">
                                                                        <span>*************</span>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${account.getStatusGoogle() == false}">
                                                                    <div class="about-step">
                                                                        <span>*************</span>
                                                                        <button type="button" class="btn btn-link mt-2" id="changePasswordBtn">Đổi mật khẩu</button>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${(account.getType() eq 'staff')}">
                                                                <button type="button" class="btn btn-link mt-2" id="changePasswordBtn">Đổi mật khẩu</button>
                                                            </c:if>

                                                            <form id="changePasswordForm" style="display: none;" action="profile?edit=password" method="post">
                                                                <h5 style="color: red">${error2}</h5>
                                                                <input name="action" value="${account.getType()}" type="hidden"/>
                                                                <div class="mb-3">
                                                                    <label for="currentPassword" class="form-label">Mật khẩu cũ</label>
                                                                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                                                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                                                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary">Thay đổi</button>
                                                            </form>
                                                            <script>
                                                                document.addEventListener("DOMContentLoaded", function () {
                                                                    var changePasswordBtn = document.getElementById('changePasswordBtn');
                                                                    var changePasswordForm = document.getElementById('changePasswordForm');

                                                                    // Show form if error2 has data
                                                                    var error2 = "${error2}";
                                                                    if (error2.trim() !== "") {
                                                                        changePasswordForm.style.display = 'block';
                                                                    }

                                                                    changePasswordBtn.addEventListener('click', function () {
                                                                        changePasswordForm.style.display = 'block';
                                                                        // Hide the password stars
                                                                        document.querySelector('.about-details .about-step span').style.display = 'none';
                                                                    });
                                                                });
                                                            </script>
                                                            
                                                            <script>
                                                                document.addEventListener("DOMContentLoaded", function () {
                                                                    var changePasswordBtn = document.getElementById('changePasswordBtn');
                                                                    var changePasswordForm = document.getElementById('changePasswordForm');

                                                                    changePasswordBtn.addEventListener('click', function () {
                                                                        changePasswordForm.style.display = 'block';
                                                                        // You may need to adjust this selector based on your specific structure
                                                                        document.querySelector('.about-details .about-step span').style.display = 'none';
                                                                    });
                                                                });
                                                            </script>
                                                            <c:if test="${user.getStatusGoogle()== false}">
                                                                <div class="about-step">
                                                                    <span>*************</span>
                                                                </div>
                                                            </c:if>
                                                            <div class="about-step">
                                                                <h5>Email:</h5>
                                                                <span>${account.username}</span>
                                                            </div>
                                                            <div class="about-step">
                                                                <h5>Số điện thoại:</h5>
                                                                <span>${account.phone}</span>
                                                            </div>
                                                            <div class="about-step">
                                                                <h5>Ngày tháng năm sinh:</h5>
                                                                <span>${!(account.dob eq 'null')? account.dob :''}</span>
                                                            </div>
                                                    </div>
                                                </div>
                                            <!-- Edit Profile Modal -->


                                            <script>
                                                // Wait for the document to be fully loaded
                                                document.addEventListener("DOMContentLoaded", function () {
                                                    // Check if the error message is present
                                                    var errorMessage = "${error}"; // Assuming ${error} is a JSP variable

                                                    if (errorMessage.trim() !== "") {
                                                        // If there is an error message, show the modal
                                                        var editModal = new bootstrap.Modal(document.getElementById('editModal')); // Adjust 'editModal' to match your modal ID
                                                        editModal.show();
                                                    }
                                                });
                                            </script>


                                            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <form method="post" action="profile?edit=phoneanddob">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="aboutModalLabel">Chỉnh sửa thông tin</h5>
                                                                <h5 style="color:red; margin-left: 20px">${error}</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">

                                                                <div class="mb-3">
                                                                    <label for="editPhone" class="form-label">Số điện thoại</label>
                                                                    <input type="text" class="form-control" id="phone" name="phone" value="${account.phone}" >
                                                                    <input name="action" value="${account.getType()}" type="hidden"/>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="editDob" class="form-label">Ngày sinh</label>
                                                                    <input type="date" class="form-control" id="dob" name="dob" value="${account.dob}" >
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                <button type="submit" class="btn btn-primary" value="Update Profile">Lưu thay đổi</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of Edit Profile Modal -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/custom.js"></script>
            <script src="${pageContext.request.contextPath}/js/night-mode.js"></script>
            <script>
                                                var containerEl = document.querySelector('[data-ref~="event-filter-content"]');

                                                var mixer = mixitup(containerEl, {
                                                    selectors: {
                                                        target: '[data-ref~="mixitup-target"]'
                                                    }
                                                });
            </script>
    </body>
</html>
