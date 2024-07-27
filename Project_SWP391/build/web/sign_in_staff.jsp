<%-- 
    Document   : sign_in
    Created on : May 15, 2024, 2:48:56 AM
    Author     : mactu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/sign_in.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:03 GMT -->
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
        <!--		<link rel="preconnect" href="https://fonts.googleapis.com/">
                        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>-->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
        <link href='${pageContext.request.contextPath}/vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/night-mode.css" rel="stylesheet">

        <!-- Vendor Stylesheets -->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">		

    </head>

    <body>				
        <div class="form-wrapper">
            <div class="app-form">
                <div>
                    <img style="height: 100%; width:  80vh;" src="${pageContext.request.contextPath}/image/icon/ve.jpg" alt="">
                </div>

                <div class="app-form-content">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-10 col-md-10">
                                <div class="app-top-items">
                                    <a href="exploreshow">
                                        <div class="sign-logo" id="logo">
                                            <img src="images/logo.svg" alt="">
                                            <img class="logo-inverse" src="images/dark-logo.svg" alt="">
                                        </div>
                                    </a>

                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-6 col-md-7">
                                <div class="registration">
                                    <form action="stafflogin" method="post">
                                        <h2 class="registration-title">Nhân viên đăng nhập</h2>
                                        <input type="hidden" name="type" value="form">
                                        <div class="form-group mt-5">
                                            <p style="color: red">${err}</p>
                                            <label class="form-label">Email của bạn*</label>
                                            <input class="form-control h_50" type="email" name="email" placeholder="Nhập email của bạn tại đây" value="${email}" required>																								
                                        </div>
                                        <div class="form-group mt-4">
                                            <div class="field-password">
                                                <label class="form-label">Mật khẩu*</label>
                                                <a class="forgot-pass-link" href="forgot?action=staff">Quên mật khẩu?</a>
                                            </div>
                                            <div class="loc-group position-relative">
                                                <input class="form-control h_50" type="password" name="password" required placeholder="Nhập mật khẩu của bạn tại đây">
                                            </div>
                                        </div>
                                        <button class="main-btn btn-hover w-100 mt-4" type="submit">Đăng nhập <i class="fas fa-sign-in-alt ms-2"></i></button>

                                    </form>
                                        </div>
                                          <div class="agree-text">
                                          <a href="loginGoogleHandler" > Khách hàng đăng nhập?</a>
                                    </div>
                               						
                            </div>
                        </div>
                    </div>
                    <div class="copyright-footer">

                    </div>
                </div>			
            </div>
        </div>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script>
            function onSignIn(googleUser) {
                var id_token = googleUser.getAuthResponse().id_token;
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'login');
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        window.location.href = 'welcome.jsp';
                    } else {
                        alert('Login failed: ' + xhr.responseText);
                    }
                };
                xhr.send('idtoken=' + id_token  + '&type=google');
            }
        </script>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
        <script src="${pageContext.request.contextPath}/js/night-mode.js"></script>

    </body>

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/sign_in.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:04 GMT -->
</html>
