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

</head>
<c:if test="${(account.getType() eq 'customer')}">
    <jsp:include page="header_user.jsp"></jsp:include>
</c:if>

<body class="d-flex flex-column h-100">
	<!-- Header Start-->
	
	<!-- Header End-->
	<!-- Body Start-->
	<div class="wrapper">
		<div class="event-dt-block p-80">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-12 col-md-12">
						<div class="main-title checkout-title text-center">
							<h3>Liên hệ với chúng tôi</h3>
							<p class="mb-0">Bạn có thắc mắc gì không? Chúng tôi rất mong nhận được phản hồi từ bạn.</p>
						</div>
					</div>
					<div class="col-lg-10">
						<div class="main-card mt-5">
                                                    <form action="sendmessage" method="post">
							<div class="row">
								<div class="col-xl-7 col-lg-12 col-md-12 order-lg-2">
									<div class="contact-form bp-form p-lg-5 ps-lg-4 pt-lg-4 pb-5 p-4">
										<div class="row">
                                                                                    <p style="color: red">${err}</p>
                                                                                    <p style="color: green">${success}</p>
											<div class="col-md-12">
												<div class="form-group mt-4">
													<label class="form-label">Số điện thoại*</label>
                                                                                                        <input class="form-control h_50" type="text" name="phone"required value="${phone}">																								
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group mt-4">
													<label class="form-label">Nội dung*</label>
                                                                                                        <textarea class="form-textarea" name="mess" required value="${mess}"></textarea>																								
												</div>
											</div>
											<div class="col-md-12">
												<div class="text-center mt-4">
													<button class="main-btn btn-hover h_50 w-100" type="submit">Gửi</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-5 col-lg-12 col-md-12 order-lg-1 d-none d-xl-block">
									<div class="contact-banner-block">
										<div class="contact-hero-banner">
											<div class="contact-hero-banner-info">
												<h3>Thông tin liên lạc</h3>
												<p>Điền vào đầy đủ thông tin vào mẫu. Chúng tôi sẽ sớm phản hồi bạn.</p>
												<ul>
													<li>
														<div class="contact-info d-flex align-items-center">
															<div class="contact-icon">
																<i class="fa-solid fa-square-phone " style="--fa-beat-fade-opacity: 0.67; --fa-beat-fade-scale: 1.075;"></i>
															</div>
															<a href="#">(+84)379819195</a>
														</div>
													</li>
													<li>
														<div class="contact-info d-flex align-items-center">
															<div class="contact-icon">
																<i class="fa-solid fa-envelope" style="--fa-beat-fade-opacity: 0.67; --fa-beat-fade-scale: 1.075;"></i>
															</div>
															<a href="#">bookingticketticket@gmail.com</a>
														</div>
													</li>
													
												</ul>
											</div>
										</div>
									</div>
								</div>	
							</div>
                                                        </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Body End-->
	<!-- Footer Start-->
	
	<!-- Footer End-->
	
	
	<script src="js/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>	
	<script src="js/custom.js"></script>
	<script src="js/night-mode.js"></script>
</body>

<!-- Mirrored from www.gambolthemes.net/html-items/barren-html/disable-demo-link/contact_us.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 09 May 2024 08:09:03 GMT -->
</html>