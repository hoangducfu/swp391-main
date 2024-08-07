<%-- 
    Document   : sign_up
    Created on : May 15, 2024, 7:31:42 AM
    Author     : mactu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/sign_up.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:04 GMT -->
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
                                            <img src="${pageContext.request.contextPath}/images/logo.svg" alt="">
                                            <img class="logo-inverse" src="images/dark-logo.svg" alt="">
                                        </div>
                                    </a>                          
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-6 col-md-7">
                                <div class="registration">
                                    <form action="signup" method="post">
                                        <h2 class="registration-title">Đăng kí tài khoản TicketTicket</h2>
                                        <div class="row mt-3">
                                            <p style="color: red">${err}</p>
                                            <div class="col-lg-12 col-md-12">
                                                <div class="form-group mt-4">
                                                    <label class="form-label">Email*</label>
                                                    <input class="form-control h_50" type="email" name="username" required placeholder="" value="${username}">																								
                                                </div>
                                            </div>

                                            <div class="col-lg-12 col-md-12">	
                                                <div class="form-group mt-4">
                                                    <div class="field-password">
                                                        <label class="form-label">Mật khẩu*</label>
                                                    </div>
                                                    <div class="loc-group position-relative">
                                                        <input class="form-control h_50" type="password" name="password" placeholder="" required>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-lg-12 col-md-12">	
                                                <div class="form-group mt-4">
                                                    <div class="field-password">
                                                        <label class="form-label">Xác nhận mật khẩu*</label>
                                                    </div>
                                                    <div class="loc-group position-relative">
                                                        <input class="form-control h_50" type="password" name="repassword" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
                                                <label for="agreeTerms">Tôi đã đọc và đồng ý với <a href="terms.html">chính sách bảo mật</a> và <a href="terms.html"> điều khoản .</a></label>
                                            </div>

                                            <div class="col-lg-12 col-md-12">		
                                                <button class="main-btn btn-hover w-100 mt-4" type="submit">Tiếp Tục</button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="agree-text">
                                        Đã có tài khoản? <a href="loginGoogleHandler">Đăng Nhập</a>.
                                    </div>								
                                    <div class="divider">
                                        <span>Hoặc</span>
                                    </div>
                                    <div class="social-btns-list mb-lg-5">

                                        <button class="social-login-btn">
                                            <svg class="me-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 26.488 27.029"><g transform="translate(-0.126)"><path d="M1258.806,1021.475a11.578,11.578,0,0,0-.285-2.763h-12.688v5.015h7.448a6.605,6.605,0,0,1-2.763,4.384l-.025.168,4.012,3.108.278.028a13.214,13.214,0,0,0,4.024-9.941" transform="translate(-1232.192 -1007.66)" fill="#4285f4"></path><path d="M145.071,1502.921a12.881,12.881,0,0,0,8.949-3.273l-4.265-3.3a8,8,0,0,1-4.685,1.352,8.136,8.136,0,0,1-7.688-5.616l-.158.013-4.172,3.229-.055.152a13.5,13.5,0,0,0,12.073,7.448" transform="translate(-131.431 -1475.893)" fill="#34a853"></path><path d="M5.952,689.263a8.32,8.32,0,0,1-.45-2.673,8.744,8.744,0,0,1,.435-2.673l-.008-.179-4.224-3.28-.138.066a13.486,13.486,0,0,0,0,12.133l4.385-3.393" transform="translate(0 -673.076)" fill="#fbbc05"></path><path d="M145.071,5.225A7.49,7.49,0,0,1,150.3,7.238l3.814-3.724A12.984,12.984,0,0,0,145.071,0,13.5,13.5,0,0,0,133,7.448l4.37,3.394a8.169,8.169,0,0,1,7.7-5.616" transform="translate(-131.431)" fill="#eb4335"></path></g></svg>

                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Project_SWP391/loginGoogleHandler&response_type=code&client_id=260351764288-fighfnvm17mondoe94g4g7cpntuc7jlt.apps.googleusercontent.com&approval_prompt=force">Đăng nhập với Google</a>
                                        </button>

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

    </body>

    <!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/sign_up.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:04 GMT -->
</html>