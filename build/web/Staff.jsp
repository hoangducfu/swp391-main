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
	<!-- Create Single Ticket Model Start-->
	<div class="modal fade" id="groupTicketModal" tabindex="-1" aria-labelledby="groupTicketModalLabel" aria-hidden="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="groupTicketModalLabel">Tạo vé</h5>
					<button type="button" class="close-model-btn" data-bs-dismiss="modal" aria-label="Close"><i class="uil uil-multiply"></i></button>
				</div>
				<div class="modal-body">
					<div class="model-content main-form">
						<div class="row">
							<div class="col-lg-12 col-md-12">
								<div class="form-group mt-4">
									<label class="form-label">Tên vé*</label>
									<input class="form-control h_40" type="text" placeholder="Enter Ticket Type - Group Name (E.g Gold - Family Pass)" value="">																								
								</div>
							</div>
							<div class="col-lg-12 col-md-12">
								<div class="main-card p-4 mt-4">
									<div class="form-label mb-4 fs-16">Hạn chế vé</div>
									<div class="form-group border_bottom">
										<div class="d-flex align-items-center flex-wrap pb-4 flex-nowrap">
											<h4 class="fs-14 mb-0 me-auto">Tổng số vé</h4>
											<label class="btn-switch m-0 me-3">
												<input type="checkbox" id="is-restrict-total-ticket2" checked="">
												<span class="checkbox-slider"></span>
											</label>
											<div>
											   <label class="fs-12 m-0">Không giới hạn</label>
											</div>
										</div>
										<div class="p-0 mb-4 total_ticket_per_level2" style="display:none;">
											<div class="form-group">
												<div class="input-number">
													<input class="form-control h_40" type="number" min="0" max="30" placeholder="Enter Total Tickets">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="d-flex align-items-center flex-wrap pt-4 flex-nowrap">
											<h4 class="fs-14 mb-0 me-auto">Số vé tối đa một người có thể đặt</h4>
											<label class="btn-switch m-0 me-3">
												<input type="checkbox" id="is-restrict-ticket-per-user2" checked="">
												<span class="checkbox-slider"></span>
											</label>
											<div>
											   <label class="fs-12 m-0">Không giới hạn </label>
											</div>
										</div>
										<div class="p-0 mt-4 total_ticket_per_user2" style="display:none;">
											<div class="form-group">
												<div class="input-number">
													<input class="form-control h_40" type="number" min="0" max="30" placeholder="Enter Max. per order">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12">
								<div class="main-card p-4 mt-4">
									<div class="form-label mb-4 fs-16">Chi tiết vé</div>
									<div class="form-group">
										<label class="form-label mb-2 fs-14">Đặt vé*</label>
										<input class="form-control h_40" type="number" value="1" min="1" max="30" placeholder="Enter Sort Order">
									</div>
									<div class="form-group mt-4">
										<label class="form-label mb-2 fs-14">Thông tin vé*</label>
										<textarea class="form-textarea" placeholder="Description will go here"></textarea>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12">
								<div class="form-group mt-4">
									<label class="form-label mb-2 fs-14">Giá vé*</label>
									<input class="form-control h_40" type="number" value="10" placeholder="Enter Ticket Price">
								</div>
							</div>
							
							<div class="col-lg-12 col-md-12">
								<div class="main-card p-4 mt-4">
									<div class="form-group">
										
										<div class="online-event-discount-wrapper2" style="display: none;">
											<div class="row g-3">
												<div class="col-md-3">
													<label class="form-label mt-3 fs-6">Giảm giá*</label>
													<input class="form-control h_40" type="text" placeholder="0" value="">
												</div>
												<div class="col-md-3">
													<label class="form-label mt-3 fs-6">Giá*</label>
													<select class="selectpicker">
														<option value="Percentage" selected="">Phần trăm(%)</option>
														<option value="Fixed">Fixed($)</option>
													</select>
												</div>
												<div class="col-md-3">
													<label class="form-label mt-3 fs-6">Giảm giá kết thúc vào*</label>
													<div class="loc-group position-relative">
														<input class="form-control h_40 datepicker-here" data-language="en" data-position="top left" type="text" placeholder="MM/DD/YYYY" value="">
														<span class="absolute-icon top_0"><i class="fa-solid fa-calendar-days"></i></span>
													</div>
												</div>
												<div class="col-md-3">
													<div class="clock-icon">
														<label class="form-label mt-3 fs-6">Thời gian</label>	
														<select class="selectpicker" data-size="5" data-live-search="true">
															<option value="00:00">12:00 AM</option>
															<option value="00:15">12:15 AM</option>
															<option value="00:30">12:30 AM</option>
															<option value="00:45">12:45 AM</option>
															<option value="01:00">01:00 AM</option>
															<option value="01:15">01:15 AM</option>
															<option value="01:30">01:30 AM</option>
															<option value="01:45">01:45 AM</option>
															<option value="02:00">02:00 AM</option>
															<option value="02:15">02:15 AM</option>
															<option value="02:30">02:30 AM</option>
															<option value="02:45">02:45 AM</option>
															<option value="03:00">03:00 AM</option>
															<option value="03:15">03:15 AM</option>
															<option value="03:30">03:30 AM</option>
															<option value="03:45">03:45 AM</option>
															<option value="04:00">04:00 AM</option>
															<option value="04:15">04:15 AM</option>
															<option value="04:30">04:30 AM</option>
															<option value="04:45">04:45 AM</option>
															<option value="05:00">05:00 AM</option>
															<option value="05:15">05:15 AM</option>
															<option value="05:30">05:30 AM</option>
															<option value="05:45">05:45 AM</option>
															<option value="06:00">06:00 AM</option>
															<option value="06:15">06:15 AM</option>
															<option value="06:30">06:30 AM</option>
															<option value="06:45">06:45 AM</option>
															<option value="07:00">07:00 AM</option>
															<option value="07:15">07:15 AM</option>
															<option value="07:30">07:30 AM</option>
															<option value="07:45">07:45 AM</option>
															<option value="08:00">08:00 AM</option>
															<option value="08:15">08:15 AM</option>
															<option value="08:30">08:30 AM</option>
															<option value="08:45">08:45 AM</option>
															<option value="09:00">09:00 AM</option>
															<option value="09:15">09:15 AM</option>
															<option value="09:30">09:30 AM</option>
															<option value="09:45">09:45 AM</option>
															<option value="10:00" selected="selected">10:00 AM</option>
															<option value="10:15">10:15 AM</option>
															<option value="10:30">10:30 AM</option>
															<option value="10:45">10:45 AM</option>
															<option value="11:00">11:00 AM</option>
															<option value="11:15">11:15 AM</option>
															<option value="11:30">11:30 AM</option>
															<option value="11:45">11:45 AM</option>
															<option value="12:00">12:00 PM</option>
															<option value="12:15">12:15 PM</option>
															<option value="12:30">12:30 PM</option>
															<option value="12:45">12:45 PM</option>
															<option value="13:00">01:00 PM</option>
															<option value="13:15">01:15 PM</option>
															<option value="13:30">01:30 PM</option>
															<option value="13:45">01:45 PM</option>
															<option value="14:00">02:00 PM</option>
															<option value="14:15">02:15 PM</option>
															<option value="14:30">02:30 PM</option>
															<option value="14:45">02:45 PM</option>
															<option value="15:00">03:00 PM</option>
															<option value="15:15">03:15 PM</option>
															<option value="15:30">03:30 PM</option>
															<option value="15:45">03:45 PM</option>
															<option value="16:00">04:00 PM</option>
															<option value="16:15">04:15 PM</option>
															<option value="16:30">04:30 PM</option>
															<option value="16:45">04:45 PM</option>
															<option value="17:00">05:00 PM</option>
															<option value="17:15">05:15 PM</option>
															<option value="17:30">05:30 PM</option>
															<option value="17:45">05:45 PM</option>
															<option value="18:00">06:00 PM</option>
															<option value="18:15">06:15 PM</option>
															<option value="18:30">06:30 PM</option>
															<option value="18:45">06:45 PM</option>
															<option value="19:00">07:00 PM</option>
															<option value="19:15">07:15 PM</option>
															<option value="19:30">07:30 PM</option>
															<option value="19:45">07:45 PM</option>
															<option value="20:00">08:00 PM</option>
															<option value="20:15">08:15 PM</option>
															<option value="20:30">08:30 PM</option>
															<option value="20:45">08:45 PM</option>
															<option value="21:00">09:00 PM</option>
															<option value="21:15">09:15 PM</option>
															<option value="21:30">09:30 PM</option>
															<option value="21:45">09:45 PM</option>
															<option value="22:00">10:00 PM</option>
															<option value="22:15">10:15 PM</option>
															<option value="22:30">10:30 PM</option>
															<option value="22:45">10:45 PM</option>
															<option value="23:00">11:00 PM</option>
															<option value="23:15">11:15 PM</option>
															<option value="23:30">11:30 PM</option>
															<option value="23:45">11:45 PM</option>
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
				<div class="modal-footer">
					<button type="button" class="co-main-btn min-width btn-hover h_40" data-bs-target="#aboutModal" data-bs-toggle="modal" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="main-btn min-width btn-hover h_40">Lưu</button>
				</div>
			</div>
		</div>
	</div>
		</div>
	</div>
	<!-- Create Single Ticket Model End-->
	
	<!-- Header Start-->
		 <header class="header">
            <div class="header-inner">
                <nav class="navbar navbar-expand-lg bg-barren barren-head navbar fixed-top justify-content-sm-start pt-0 pb-0">
                    <div class="container">	
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                            <span class="navbar-toggler-icon">
                                <i class="fa-solid fa-bars"></i>
                            </span>
                        </button>
                       
                        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                            <div class="offcanvas-header">
                                <div class="offcanvas-logo" id="offcanvasNavbarLabel">
                                    <img src="images/logo-icon.svg" alt="">
                                </div>
                                <button type="button" class="close-btn" data-bs-dismiss="offcanvas" aria-label="Close">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                            </div>
                            <div class="offcanvas-body">
                                <ul class="navbar-nav justify-content-between" >
                                    <li class="nav-item"> 
                                    <img src="image/icon/logo (2).png" alt="" width="90px" href="Home.jsp" /></li>
                                <li class="nav-item">
                                </ul>
                               <ul class="navbar-nav">
                                    <a class="nav-link active" aria-current="page" href="#">
                                        Trang chủ
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Danh mục
                                    </a>
                                    <ul class="dropdown-menu dropdown-submenu">
                                        <li><a class="dropdown-item" href="explore_events.html">Ca Nhạc</a></li>
                                        <li><a class="dropdown-item" href="venue_event_detail_view.html">Talkshow</a></li>
                                        <li><a class="dropdown-item" href="online_event_detail_view.html">Workshop</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Giúp đỡ
                                    </a>
                                    <ul class="dropdown-menu dropdown-submenu">
                                        <li><a class="dropdown-item" href="help_center.html">Help Center</a></li>
                                        <li><a class="dropdown-item" href="contact_us.html">Liên hệ với chúng tôi</a></li>
                                    </ul>
                                </li>
                               
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Trang khác
                                    </a>
                                    <ul class="dropdown-menu dropdown-submenu">
                                        <li><a class="dropdown-item" href="help_center.html">Thông tin về chúng tôi </a></li>
                                        <li><a class="dropdown-item" href="contact_us.html">Điều khoản và điều kiện</a></li>
                                        <li><a class="dropdown-item" href="contact_us.html">Chính sách bảo mật</a></li>

                                    </ul>
                                </li>
                                <li>
								<a href="create.html" class="create-btn btn-hover">
									<i class="fa-solid fa-calendar-days"></i>
									<span>Tạo sự kiện</span>
								</a>
                                        
                            </ul>
                                <ul>
                                    <li class="dropdown account-dropdown">
								<a href="#" class="account-link" role="button" id="accountClick" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="images/profile-imgs/img-13.jpg" alt="">
									<i class="fas fa-caret-down arrow-icon"></i>
								</a>
								<ul class="dropdown-menu dropdown-menu-account dropdown-menu-end" aria-labelledby="accountClick">
									<li>
										<div class="dropdown-account-header">
											<div class="account-holder-avatar">
												<img src="images/profile-imgs/img-13.jpg" alt="">
											</div>
                                                                                        
											<h5>${account.username}</h5>
										</div>
									</li>
									<li class="profile-link">
										<a href="organiser_profile_view.html" class="link-item">Tài khoản của tôi</a>	
                                                                                <a href="#" class="link-item">Quên mật khẩu </a>
										<a href="logout" class="link-item">Đăng xuất</a>									
									</li>
								</ul>
							</li>
                                </ul>
                            </div>
                            
                        </div>
                        
                    </div>
                </nav>
                <div class="overlay"></div>
            </div>
        </header>
	<!-- Header End-->
	<!-- Body Start-->
	<div class="wrapper">
		
		<div class="event-dt-block p-80">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-12 col-md-12">
						<div class="main-title text-center">
							<h3>Tạo sự kiện</h3>
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
									<li>
										<a href="#tab_step3">
											<span class="number"></span>
											<span class="step-name">Cài đặt</span>
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
																<input class="form-control h_50" type="text" placeholder="Enter event name here" value="">
															</div>
															<div class="form-group border_bottom pt_30 pb_30">
																<label class="form-label fs-16">Thể loại của sự kiện*</label>
																<select class="selectpicker" multiple="" data-selected-text-format="count > 4" data-size="5" title="Select category" data-live-search="true">
																	<option value="01">Ca nhạc</option>
																	<option value="02">Talk show</option>
																	<option value="03">Workshop</option>
																	
																</select>
															</div>
															<div class="form-group border_bottom pt_30 pb_30">
																<label class="form-label fs-16">Sự kiện của bạn bắt đầu khi nào?*</label>
																<div class="row g-2">
																	<div class="col-md-6">
																		<label class="form-label mt-3 fs-6">Ngày diễn ra sự kiện.*</label>																
																		<div class="loc-group position-relative">
																			<input class="form-control h_50 datepicker-here" data-language="en" type="text" placeholder="MM/DD/YYYY" value="">
																			<span class="absolute-icon"><i class="fa-solid fa-calendar-days"></i></span>
																		</div>
																	</div>
																	<div class="col-md-6">																		
																		<div class="row g-2">
																			<div class="col-md-6">
																				<div class="clock-icon">
																					<label class="form-label mt-3 fs-6">Thời gian</label>	
																					<select class="selectpicker" data-size="5" data-live-search="true">
																						<option value="00:00">12:00 AM</option>
																						<option value="00:15">12:15 AM</option>
																						<option value="00:30">12:30 AM</option>
																						<option value="00:45">12:45 AM</option>
																						<option value="01:00">01:00 AM</option>
																						<option value="01:15">01:15 AM</option>
																						<option value="01:30">01:30 AM</option>
																						<option value="01:45">01:45 AM</option>
																						<option value="02:00">02:00 AM</option>
																						<option value="02:15">02:15 AM</option>
																						<option value="02:30">02:30 AM</option>
																						<option value="02:45">02:45 AM</option>
																						<option value="03:00">03:00 AM</option>
																						<option value="03:15">03:15 AM</option>
																						<option value="03:30">03:30 AM</option>
																						<option value="03:45">03:45 AM</option>
																						<option value="04:00">04:00 AM</option>
																						<option value="04:15">04:15 AM</option>
																						<option value="04:30">04:30 AM</option>
																						<option value="04:45">04:45 AM</option>
																						<option value="05:00">05:00 AM</option>
																						<option value="05:15">05:15 AM</option>
																						<option value="05:30">05:30 AM</option>
																						<option value="05:45">05:45 AM</option>
																						<option value="06:00">06:00 AM</option>
																						<option value="06:15">06:15 AM</option>
																						<option value="06:30">06:30 AM</option>
																						<option value="06:45">06:45 AM</option>
																						<option value="07:00">07:00 AM</option>
																						<option value="07:15">07:15 AM</option>
																						<option value="07:30">07:30 AM</option>
																						<option value="07:45">07:45 AM</option>
																						<option value="08:00">08:00 AM</option>
																						<option value="08:15">08:15 AM</option>
																						<option value="08:30">08:30 AM</option>
																						<option value="08:45">08:45 AM</option>
																						<option value="09:00">09:00 AM</option>
																						<option value="09:15">09:15 AM</option>
																						<option value="09:30">09:30 AM</option>
																						<option value="09:45">09:45 AM</option>
																						<option value="10:00" selected="selected">10:00 AM</option>
																						<option value="10:15">10:15 AM</option>
																						<option value="10:30">10:30 AM</option>
																						<option value="10:45">10:45 AM</option>
																						<option value="11:00">11:00 AM</option>
																						<option value="11:15">11:15 AM</option>
																						<option value="11:30">11:30 AM</option>
																						<option value="11:45">11:45 AM</option>
																						<option value="12:00">12:00 PM</option>
																						<option value="12:15">12:15 PM</option>
																						<option value="12:30">12:30 PM</option>
																						<option value="12:45">12:45 PM</option>
																						<option value="13:00">01:00 PM</option>
																						<option value="13:15">01:15 PM</option>
																						<option value="13:30">01:30 PM</option>
																						<option value="13:45">01:45 PM</option>
																						<option value="14:00">02:00 PM</option>
																						<option value="14:15">02:15 PM</option>
																						<option value="14:30">02:30 PM</option>
																						<option value="14:45">02:45 PM</option>
																						<option value="15:00">03:00 PM</option>
																						<option value="15:15">03:15 PM</option>
																						<option value="15:30">03:30 PM</option>
																						<option value="15:45">03:45 PM</option>
																						<option value="16:00">04:00 PM</option>
																						<option value="16:15">04:15 PM</option>
																						<option value="16:30">04:30 PM</option>
																						<option value="16:45">04:45 PM</option>
																						<option value="17:00">05:00 PM</option>
																						<option value="17:15">05:15 PM</option>
																						<option value="17:30">05:30 PM</option>
																						<option value="17:45">05:45 PM</option>
																						<option value="18:00">06:00 PM</option>
																						<option value="18:15">06:15 PM</option>
																						<option value="18:30">06:30 PM</option>
																						<option value="18:45">06:45 PM</option>
																						<option value="19:00">07:00 PM</option>
																						<option value="19:15">07:15 PM</option>
																						<option value="19:30">07:30 PM</option>
																						<option value="19:45">07:45 PM</option>
																						<option value="20:00">08:00 PM</option>
																						<option value="20:15">08:15 PM</option>
																						<option value="20:30">08:30 PM</option>
																						<option value="20:45">08:45 PM</option>
																						<option value="21:00">09:00 PM</option>
																						<option value="21:15">09:15 PM</option>
																						<option value="21:30">09:30 PM</option>
																						<option value="21:45">09:45 PM</option>
																						<option value="22:00">10:00 PM</option>
																						<option value="22:15">10:15 PM</option>
																						<option value="22:30">10:30 PM</option>
																						<option value="22:45">10:45 PM</option>
																						<option value="23:00">11:00 PM</option>
																						<option value="23:15">11:15 PM</option>
																						<option value="23:30">11:30 PM</option>
																						<option value="23:45">11:45 PM</option>
																					</select>
																				</div>
																			</div>
																			<div class="col-md-6">
																				<label class="form-label mt-3 fs-6">Trong khoảng bao lâu</label>	
																				<select class="selectpicker" data-size="5" data-live-search="true">
																					<option value="30">30 phút</option>
																					<option value="45">45 phút</option>
																					<option value="60" selected="selected">1 tiếng</option>
                                                                                                                                                                        
																					<option value="90">1 tiếng 30 phút</option>
																					<option value="120">2 tiếng</option>
																					<option value="150">2 tiếng 30 phút</option>
																					<option value="180">3 giờ</option>
																					<option value="210">3 tiếng 30 phút</option>
																					<option value="225">3 tiếng 45 phút</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="form-group pt_30 pb_30">
																<label class="form-label fs-16">Thêm một vài hình ảnh cho sự kiện của bạn</label>
																<div class="content-holder mt-4">
																	<div class="default-event-thumb">   
																		<div class="default-event-thumb-btn">
																			<div class="thumb-change-btn">
																				<input type="file" id="thumb-img">
																				<label for="thumb-img">Change Image</label>
																			</div>
																		</div>
                                                                                                                                            <img src="image/icon/banner.png" alt=""/>
                                                                                                                                            
																	</div>
																</div>
															</div>
															<div class="form-group border_bottom pb_30">
																<label class="form-label fs-16">Mô tả chi tiết về sự kiện của bạn</label>
																<div class="text-editor mt-4">
																	<div id="pd_editor"></div>
																</div>
															</div>
															<div class="form-group pt_30 pb-2">
																<label class="form-label fs-16">Sự kiện của bạn diễn ra ở đâu*</label>
																<div class="stepper-data-set">
																	<div class="content-holder template-selector">
																		<div class="row g-4">
																			
																			<div class="col-md-12">
																				<div class="form-group mt-1">
																					<label class="form-label fs-6">Địa điểm*</label>
																					<input class="form-control h_50" type="text" placeholder="" value="">
																				</div>
																			</div>
																			<div class="col-md-6">
																				<div class="form-group mt-1">
																					<label class="form-label fs-6">Đường số*</label>
																					<input class="form-control h_50" type="text" placeholder="" value="">
																				</div>
																			</div>
																			<div class="col-md-6">
																				<div class="form-group mt-1">
																					<label class="form-label">Khu vực *</label>
																					<input class="form-control h_50" type="text" placeholder="" value="Victoria">																								
																				</div>
																			</div>
																			<div class="col-md-12">
																				<div class="form-group main-form mt-1">
																					<label class="form-label">Thành phố*</label>
																					<select class="selectpicker" data-size="5" title="Nothing selected" data-live-search="true">
																						<option value="Algeria">Hà Nội</option>
																						<option value="Argentina">Đà Nẵng</option>
                                                                                                                                                                                <option value="Australia" selected="">Huế</option>
																						<option value="Austria">TP. Hồ Chí Minh</option>
																						<option value="Belgium">Đà Lạt</option>
																																											
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
															<div class="ticket-section">
																<label class="form-label fs-16">Hãy tạo vé cho sự kiện của mình nào!</label>
															</div>
															<div class="d-flex align-items-center justify-content-between pt-4 pb-3 full-width">
																<h3 class="fs-18 mb-0">Vé (<span class="venue-event-ticket-counter">3</span>)</h3>
																<div class="dropdown dropdown-default dropdown-normal btn-ticket-type-top">
																	<button class="dropdown-toggle main-btn btn-hover h_40 pe-4 ps-4" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton" style="">
																		<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#singleTicketModal">
																			<i class="fa-solid fa-ticket me-2"></i>
																			Thêm vé
																		</a>
																		
																	</div>
																	</button>
                                                                                                                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton" style="">
																		
																		<a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#groupTicketModal">
																			<i class="fa-solid fa-ticket me-2"></i>
																			Tạo vé
																		</a>
																	</div>
																	
																</div>
															</div>
															<div class="ticket-type-item-empty d-none text-center p_30">
																<div class="ticket-list-icon d-inline-block">
																	<img src="images/ticket.png" alt="">
																</div>
																<h4 class="color-black mt-4 mb-3 fs-18">You have no tickets yet.</h4>
																<p class="mb-0">You have not created a ticket yet. Please click the button above to create your event ticket.</p>
															</div>
															<div class="ticket-type-item-list mt-4">
																<div class="price-ticket-card mt-4">
																	<div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
																		<div class="d-flex align-items-center top-name">
																			<div class="icon-box">
																				<span class="icon-big rotate-icon icon icon-purple">
																					<i class="fa-solid fa-ticket"></i>
																				</span>
																				<h5 class="fs-16 mb-1 mt-1">Vé 1 - 150.000</h5>
																				<p class="text-gray-50 m-0"><span class="visitor-date-time">06/05/2024</span></p>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<div class="price-badge">
																				<img src="images/discount.png" alt="">
																			</div>
																			<label class="btn-switch tfs-8 mb-0 me-4 mt-1">
																				<input type="checkbox" value="" checked>
																				<span class="checkbox-slider"></span>
																			</label>
																			<div class="dropdown dropdown-default dropdown-text dropdown-icon-item">
																				<button class="option-btn-1" type="button" data-bs-toggle="dropdown" aria-expanded="false">
																					<i class="fa-solid fa-ellipsis-vertical"></i>
																				</button>
																				<div class="dropdown-menu dropdown-menu-end">
																					<a href="#" class="dropdown-item"><i class="fa-solid fa-pen me-3"></i>Sửa</a>
																					<a href="#" class="dropdown-item"><i class="fa-solid fa-trash-can me-3"></i>Xóa</a>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="price-ticket-card-body border_top p-4">
																		<div class="full-width d-flex flex-wrap justify-content-between align-items-center">
																			<div class="icon-box">
																				<div class="icon me-3">
																					<i class="fa-solid fa-ticket"></i>
																				</div>
																				<span class="text-145">Tổng số vé</span>
																				<h6 class="coupon-status">20</h6>
																			</div>
																			<div class="icon-box">
																				<div class="icon me-3">
																					<i class="fa-solid fa-users"></i>
																				</div>
																				<span class="text-145">Giới hạn vé cho mỗi người </span>
																				<h6 class="coupon-status">2</h6>
																			</div>
																			<div class="icon-box">
																				<div class="icon me-3">
																					<i class="fa-solid fa-cart-shopping"></i>
																				</div>
																				<span class="text-145">Giảm giá</span>
																				<h6 class="coupon-status">5%</h6>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="price-ticket-card mt-4">
																	<div class="price-ticket-card-head d-md-flex flex-wrap align-items-start justify-content-between position-relative p-4">
																		<div class="d-flex align-items-center top-name">
																			<div class="icon-box">
																				<span class="icon-big rotate-icon icon icon-yellow">
																					<i class="fa-solid fa-ticket"></i>
																				</span>
																				<h5 class="fs-16 mb-1 mt-1">Vé 2 - 200.000</h5>
																				<p class="text-gray-50 m-0"><span class="visitor-date-time">06/05/2024</span></p>
																			</div>
																		</div>
																		<div class="d-flex align-items-center">
																			<div class="price-badge">
																				<img src="images/discount.png" alt="">
																			</div>
																			<label class="btn-switch tfs-8 mb-0 me-4 mt-1">
																				<input type="checkbox" value="" checked>
																				<span class="checkbox-slider"></span>
																			</label>
																			<div class="dropdown dropdown-default dropdown-text dropdown-icon-item">
																				<button class="option-btn-1" type="button" data-bs-toggle="dropdown" aria-expanded="false">
																					<i class="fa-solid fa-ellipsis-vertical"></i>
																				</button>
																				<div class="dropdown-menu dropdown-menu-end">
																					<a href="#" class="dropdown-item"><i class="fa-solid fa-pen me-3"></i>Sửa</a>
																					<a href="#" class="dropdown-item"><i class="fa-solid fa-trash-can me-3"></i>Xóa</a>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="price-ticket-card-body border_top p-4">
																		<div class="full-width d-flex flex-wrap justify-content-between align-items-center">
																			<div class="icon-box">
																				<div class="icon me-3">
																					<i class="fa-solid fa-ticket"></i>
																				</div>
																				<span class="text-145">Tổng số vé</span>
																				<h6 class="coupon-status">Không giới hạn</h6>
																			</div>
																			<div class="icon-box">
																				<div class="icon me-3">
																					<i class="fa-solid fa-users"></i>
																				</div>
																				<span class="text-145">Số vé tối đa cho mọi người</span>
																				<h6 class="coupon-status">Không giới hạn</h6>
																			</div>
																			<div class="icon-box">
																				<div class="icon me-3">
																					<i class="fa-solid fa-cart-shopping"></i>
																				</div>
																				<span class="text-145">Giảm giá</span>
																				<h6 class="coupon-status">2%</h6>
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
									 <div class="step-tab-panel step-tab-location" id="tab_step3">
										<div class="tab-from-content">											
											<div class="main-card">
												<div class="bp-title">
													<h4><i class="fa-solid fa-gear step_icon me-3"></i>Cài đặt </h4>
												</div>
												<div class="p_30 bp-form main-form">
													<div class="form-group">
														<div class="ticket-section">
															<label class="form-label fs-16">Let's configure a few additional options for your event!</label>
															<p class="mt-2 fs-14 d-block mb-3 pe_right">Change the following settings based on your preferences to customise your event accordingly.</p>
															<div class="content-holder">
																<div class="setting-item border_bottom pb_30 pt-4">
																	
																	<div class="booking-start-time-holder" style="display:none;">
																		<div class="form-group pt_30">
																			<label class="form-label fs-16">Booking starts on</label>
																			<p class="mt-2 fs-14 d-block mb-0">Specify the date and time when you want the booking to start.</p>
																			<div class="row g-3">
																				<div class="col-md-6">
																					<label class="form-label mt-3 fs-6">Event Date.*</label>																
																					<div class="loc-group position-relative">
																						<input class="form-control h_50 datepicker-here" data-language="en" type="text" placeholder="MM/DD/YYYY" value="">
																						<span class="absolute-icon"><i class="fa-solid fa-calendar-days"></i></span>
																					</div>
																				</div>
																				<div class="col-md-6">																		
																					<div class="clock-icon">
																						<label class="form-label mt-3 fs-6">Time</label>	
																						<select class="selectpicker" data-size="5" data-live-search="true">
																							<option value="00:00">12:00 AM</option>
																							<option value="00:15">12:15 AM</option>
																							<option value="00:30">12:30 AM</option>
																							<option value="00:45">12:45 AM</option>
																							<option value="01:00">01:00 AM</option>
																							<option value="01:15">01:15 AM</option>
																							<option value="01:30">01:30 AM</option>
																							<option value="01:45">01:45 AM</option>
																							<option value="02:00">02:00 AM</option>
																							<option value="02:15">02:15 AM</option>
																							<option value="02:30">02:30 AM</option>
																							<option value="02:45">02:45 AM</option>
																							<option value="03:00">03:00 AM</option>
																							<option value="03:15">03:15 AM</option>
																							<option value="03:30">03:30 AM</option>
																							<option value="03:45">03:45 AM</option>
																							<option value="04:00">04:00 AM</option>
																							<option value="04:15">04:15 AM</option>
																							<option value="04:30">04:30 AM</option>
																							<option value="04:45">04:45 AM</option>
																							<option value="05:00">05:00 AM</option>
																							<option value="05:15">05:15 AM</option>
																							<option value="05:30">05:30 AM</option>
																							<option value="05:45">05:45 AM</option>
																							<option value="06:00">06:00 AM</option>
																							<option value="06:15">06:15 AM</option>
																							<option value="06:30">06:30 AM</option>
																							<option value="06:45">06:45 AM</option>
																							<option value="07:00">07:00 AM</option>
																							<option value="07:15">07:15 AM</option>
																							<option value="07:30">07:30 AM</option>
																							<option value="07:45">07:45 AM</option>
																							<option value="08:00">08:00 AM</option>
																							<option value="08:15">08:15 AM</option>
																							<option value="08:30">08:30 AM</option>
																							<option value="08:45">08:45 AM</option>
																							<option value="09:00">09:00 AM</option>
																							<option value="09:15">09:15 AM</option>
																							<option value="09:30">09:30 AM</option>
																							<option value="09:45">09:45 AM</option>
																							<option value="10:00" selected="selected">10:00 AM</option>
																							<option value="10:15">10:15 AM</option>
																							<option value="10:30">10:30 AM</option>
																							<option value="10:45">10:45 AM</option>
																							<option value="11:00">11:00 AM</option>
																							<option value="11:15">11:15 AM</option>
																							<option value="11:30">11:30 AM</option>
																							<option value="11:45">11:45 AM</option>
																							<option value="12:00">12:00 PM</option>
																							<option value="12:15">12:15 PM</option>
																							<option value="12:30">12:30 PM</option>
																							<option value="12:45">12:45 PM</option>
																							<option value="13:00">01:00 PM</option>
																							<option value="13:15">01:15 PM</option>
																							<option value="13:30">01:30 PM</option>
																							<option value="13:45">01:45 PM</option>
																							<option value="14:00">02:00 PM</option>
																							<option value="14:15">02:15 PM</option>
																							<option value="14:30">02:30 PM</option>
																							<option value="14:45">02:45 PM</option>
																							<option value="15:00">03:00 PM</option>
																							<option value="15:15">03:15 PM</option>
																							<option value="15:30">03:30 PM</option>
																							<option value="15:45">03:45 PM</option>
																							<option value="16:00">04:00 PM</option>
																							<option value="16:15">04:15 PM</option>
																							<option value="16:30">04:30 PM</option>
																							<option value="16:45">04:45 PM</option>
																							<option value="17:00">05:00 PM</option>
																							<option value="17:15">05:15 PM</option>
																							<option value="17:30">05:30 PM</option>
																							<option value="17:45">05:45 PM</option>
																							<option value="18:00">06:00 PM</option>
																							<option value="18:15">06:15 PM</option>
																							<option value="18:30">06:30 PM</option>
																							<option value="18:45">06:45 PM</option>
																							<option value="19:00">07:00 PM</option>
																							<option value="19:15">07:15 PM</option>
																							<option value="19:30">07:30 PM</option>
																							<option value="19:45">07:45 PM</option>
																							<option value="20:00">08:00 PM</option>
																							<option value="20:15">08:15 PM</option>
																							<option value="20:30">08:30 PM</option>
																							<option value="20:45">08:45 PM</option>
																							<option value="21:00">09:00 PM</option>
																							<option value="21:15">09:15 PM</option>
																							<option value="21:30">09:30 PM</option>
																							<option value="21:45">09:45 PM</option>
																							<option value="22:00">10:00 PM</option>
																							<option value="22:15">10:15 PM</option>
																							<option value="22:30">10:30 PM</option>
																							<option value="22:45">10:45 PM</option>
																							<option value="23:00">11:00 PM</option>
																							<option value="23:15">11:15 PM</option>
																							<option value="23:30">11:30 PM</option>
																							<option value="23:45">11:45 PM</option>
																						</select>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="setting-item border_bottom pb_30 pt_30">
																	
																	<div class="booking-end-time-holder" style="display:none;">
																		<div class="form-group pt_30">
																			<label class="form-label fs-16">Booking ends on</label>
																			<p class="mt-2 fs-14 d-block mb-0">Specify the date and time when you want the booking to start.</p>
																			<div class="row g-3">
																				<div class="col-md-6">
																					<label class="form-label mt-3 fs-6">Event Date.*</label>																
																					<div class="loc-group position-relative">
																						<input class="form-control h_50 datepicker-here" data-language="en" type="text" placeholder="MM/DD/YYYY" value="">
																						<span class="absolute-icon"><i class="fa-solid fa-calendar-days"></i></span>
																					</div>
																				</div>
																				<div class="col-md-6">																		
																					<div class="clock-icon">
																						<label class="form-label mt-3 fs-6">Time</label>	
																						<select class="selectpicker" data-size="5" data-live-search="true">
																							<option value="00:00">12:00 AM</option>
																							<option value="00:15">12:15 AM</option>
																							<option value="00:30">12:30 AM</option>
																							<option value="00:45">12:45 AM</option>
																							<option value="01:00">01:00 AM</option>
																							<option value="01:15">01:15 AM</option>
																							<option value="01:30">01:30 AM</option>
																							<option value="01:45">01:45 AM</option>
																							<option value="02:00">02:00 AM</option>
																							<option value="02:15">02:15 AM</option>
																							<option value="02:30">02:30 AM</option>
																							<option value="02:45">02:45 AM</option>
																							<option value="03:00">03:00 AM</option>
																							<option value="03:15">03:15 AM</option>
																							<option value="03:30">03:30 AM</option>
																							<option value="03:45">03:45 AM</option>
																							<option value="04:00">04:00 AM</option>
																							<option value="04:15">04:15 AM</option>
																							<option value="04:30">04:30 AM</option>
																							<option value="04:45">04:45 AM</option>
																							<option value="05:00">05:00 AM</option>
																							<option value="05:15">05:15 AM</option>
																							<option value="05:30">05:30 AM</option>
																							<option value="05:45">05:45 AM</option>
																							<option value="06:00">06:00 AM</option>
																							<option value="06:15">06:15 AM</option>
																							<option value="06:30">06:30 AM</option>
																							<option value="06:45">06:45 AM</option>
																							<option value="07:00">07:00 AM</option>
																							<option value="07:15">07:15 AM</option>
																							<option value="07:30">07:30 AM</option>
																							<option value="07:45">07:45 AM</option>
																							<option value="08:00">08:00 AM</option>
																							<option value="08:15">08:15 AM</option>
																							<option value="08:30">08:30 AM</option>
																							<option value="08:45">08:45 AM</option>
																							<option value="09:00">09:00 AM</option>
																							<option value="09:15">09:15 AM</option>
																							<option value="09:30">09:30 AM</option>
																							<option value="09:45">09:45 AM</option>
																							<option value="10:00" selected="selected">10:00 AM</option>
																							<option value="10:15">10:15 AM</option>
																							<option value="10:30">10:30 AM</option>
																							<option value="10:45">10:45 AM</option>
																							<option value="11:00">11:00 AM</option>
																							<option value="11:15">11:15 AM</option>
																							<option value="11:30">11:30 AM</option>
																							<option value="11:45">11:45 AM</option>
																							<option value="12:00">12:00 PM</option>
																							<option value="12:15">12:15 PM</option>
																							<option value="12:30">12:30 PM</option>
																							<option value="12:45">12:45 PM</option>
																							<option value="13:00">01:00 PM</option>
																							<option value="13:15">01:15 PM</option>
																							<option value="13:30">01:30 PM</option>
																							<option value="13:45">01:45 PM</option>
																							<option value="14:00">02:00 PM</option>
																							<option value="14:15">02:15 PM</option>
																							<option value="14:30">02:30 PM</option>
																							<option value="14:45">02:45 PM</option>
																							<option value="15:00">03:00 PM</option>
																							<option value="15:15">03:15 PM</option>
																							<option value="15:30">03:30 PM</option>
																							<option value="15:45">03:45 PM</option>
																							<option value="16:00">04:00 PM</option>
																							<option value="16:15">04:15 PM</option>
																							<option value="16:30">04:30 PM</option>
																							<option value="16:45">04:45 PM</option>
																							<option value="17:00">05:00 PM</option>
																							<option value="17:15">05:15 PM</option>
																							<option value="17:30">05:30 PM</option>
																							<option value="17:45">05:45 PM</option>
																							<option value="18:00">06:00 PM</option>
																							<option value="18:15">06:15 PM</option>
																							<option value="18:30">06:30 PM</option>
																							<option value="18:45">06:45 PM</option>
																							<option value="19:00">07:00 PM</option>
																							<option value="19:15">07:15 PM</option>
																							<option value="19:30">07:30 PM</option>
																							<option value="19:45">07:45 PM</option>
																							<option value="20:00">08:00 PM</option>
																							<option value="20:15">08:15 PM</option>
																							<option value="20:30">08:30 PM</option>
																							<option value="20:45">08:45 PM</option>
																							<option value="21:00">09:00 PM</option>
																							<option value="21:15">09:15 PM</option>
																							<option value="21:30">09:30 PM</option>
																							<option value="21:45">09:45 PM</option>
																							<option value="22:00">10:00 PM</option>
																							<option value="22:15">10:15 PM</option>
																							<option value="22:30">10:30 PM</option>
																							<option value="22:45">10:45 PM</option>
																							<option value="23:00">11:00 PM</option>
																							<option value="23:15">11:15 PM</option>
																							<option value="23:30">11:30 PM</option>
																							<option value="23:45">11:45 PM</option>
																						</select>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="setting-item border_bottom pb_30 pt_30">
																	<div class="d-flex align-items-start">
																		<label class="btn-switch m-0 me-3">
																			<input type="checkbox" class="" id="passing-service-charge-btn" value="" checked>
																			<span class="checkbox-slider"></span>
																		</label>
																		<div class="d-flex flex-column">
																			<label class="color-black fw-bold mb-1">I want my customers to pay the applicable service fees at the time when they make the bookings.</label>
																			<p class="mt-2 fs-14 d-block mb-0 pe_right">Passing your service charge means your attendees will pay your service charge in addition to the ticket price. <a href="#" class="a-link">Learn more</a></p>
																		</div>
																	</div>
																</div>
																<div class="setting-item border_bottom pb_30 pt_30">
																	<div class="d-flex align-items-start">
																		<label class="btn-switch m-0 me-3">
																			<input type="checkbox" class="" id="refund-policies-btn" value="" checked>
																			<span class="checkbox-slider"></span>
																		</label>
																		<div class="d-flex flex-column">
																			<label class="color-black fw-bold mb-1">I do not wish to offer my customers with option to cancel their orders and receive refund.</label>
																			<p class="mt-2 fs-14 d-block mb-0">Disable this slider if you want to let your customers cancel their order and select a refund policy.</p>
																		</div>
																	</div>
																	<div class="refund-policies-holder" style="display:none;">
																		<div class="refund-policies-content border_top mt-4">
																			<div class="row grid-padding-8">
																				<div class="col-md-12 mb-6">
																					<div class="refund-method">
																						<div class="form-group mb-0">
																							<label class="brn-checkbox-radio mb-0 mt-4">
																								<input type="radio" required="" name="refund_policy_id" value="refund-id-1" class="form-check-input br-checkbox refund-policy1">
																								<span class="fs-14 fw-bold ms-xl-2">I wish to offer my customers with option to cancel their orders. However, I will handle refund manually.</span>
																								<span class="ms-xl-4 d-block sub-label mt-2 mb-4">Select this option if you want to refund your customer manually.</span>
																							</label>
																							<div class="refund-input-content" data-method="refund-id-1">
																								<div class="input-content mb-3">
																									<label class="color-black mb-2 fs-14 fw-bold">Cancellation must be made<span class="red">*</span></label>
																									<div class="d-block d-md-flex align-items-center flex-wrap flex-lg-wrap-reverse">
																										<div class="col-md-4 pl-0">
																											<div class="input-group mr-3 mx-width-135 input-number">
																												<input type="number" min="0" max="30" class="form-control" placeholder="">
																											</div>
																										</div>
																										<div class="input-sign ms-md-3 mt-3 mb-3">days before the event</div>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																					<div class="refund-method">
																						<label class="brn-checkbox-radio mb-0 mt-4">
																							<input type="radio" name="refund_policy_id" value="refund-id-2" class="form-check-input br-checkbox refund-polic-2">
																							<span class="fs-14 fw-bold ms-xl-2">I wish to offer my customers with option to cancel their orders and receive refund automatically.</span>
																							<span class="ms-xl-4 d-block sub-label mt-2 mb-4">Select this option if you want to refund your customer automatically.</span>
																						</label>
																						<div class="refund-input-content" data-method="refund-id-2">
																							<div class="input-content mb-3">
																								<label class="color-black mb-2 fs-14 fw-bold">Cancellation must be made <span class="red">*</span></label>
																								<div class="d-block d-md-flex align-items-center flex-wrap flex-lg-wrap-reverse">
																									<div class="col-md-4">
																										<div class="input-group input-number">
																											<input type="number" min="0" max="30" class="form-control" placeholder="">
																										</div>
																									</div>
																									<div class="input-sign ms-md-3 mt-3 mb-3">days before the event</div>
																								</div>
																							</div>
																							<div class="input-content mb-3">
																								<label class="color-black mb-2 fs-14 fw-bold">Refund amount <span class="red">*</span></label>
																								<div class="d-block d-md-flex align-items-center flex-wrap flex-lg-wrap-reverse">
																									<div class="col-md-4">
																										<div class="input-group loc-group position-relative">
																											<input type="text" value="" class="form-control" placeholder="">
																											<span class="percentage-icon"><i class="fa-solid fa-percent"></i></span>
																										</div>
																									</div>
																									<div class="input-sign ms-md-3 mt-3 mb-3">days before the event</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>																	
																		</div>
																	</div>
																</div>
																<div class="setting-item border_bottom pb_30 pt_30">
																	<div class="d-flex align-items-start">
																		<label class="btn-switch m-0 me-3">
																			<input type="checkbox" class="" id="ticket-instructions-btn" value="" checked>
																			<span class="checkbox-slider"></span>
																		</label>
																		<div class="d-flex flex-column">
																			<label class="color-black fw-bold mb-1">I do not require adding any special instructions on the tickets.</label>
																			<p class="mt-2 fs-14 d-block mb-0">Use this space to provide any last minute checklists your attendees must know in order to attend your event. Anything you provide here will be printed on your ticket.</p>
																		</div>
																	</div>		
																	<div class="ticket-instructions-holder" style="display:none;">
																		<div class="ticket-instructions-content mt-4">
																			<textarea class="form-textarea" placeholder="About"></textarea>
																		</div>
																	</div>
																</div>
																<div class="setting-item pb-0 pt_30">
																	<div class="d-flex align-items-start">
																		<label class="btn-switch m-0 me-3">
																			<input type="checkbox" class="" id="tags-btn" value="" checked>
																			<span class="checkbox-slider"></span>
																		</label>
																		<div class="d-flex flex-column">
																			<label class="color-black fw-bold mb-1">I do not want to add tags in my event</label>
																			<p class="mt-2 fs-14 d-block mb-0">Use relevant words as your tags to improve the discoverability of your event. <a href="#" class="a-link">Learn more</a></p>
																		</div>
																	</div>
																	<div class="tags-holder" style="display:none;">
																		<div class="ticket-instructions-content tags-container mt-4">
																			<input class="form-control tags-input" type="text" placeholder="Type your tags and press enter">
																			<div class="tags-list">
																				<!-- keywords go here -->									
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
								<div class="step-footer step-tab-pager mt-4">
									<button data-direction="prev" class="btn btn-default btn-hover steps_btn">Trước</button>
									<button data-direction="next" class="btn btn-default btn-hover steps_btn">Tiếp theo</button>
									<button data-direction="finish" class="btn btn-default btn-hover steps_btn">Tạo </button>
								</div>
							</div>
						</div> 
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- Body End-->
	<!-- Footer Start-->
	<footer class="footer mt-auto">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="footer-content">
							<h4>Công ty</h4>
							<ul class="footer-link-list">
								<li><a href="help_center.html" class="footer-link">Giúp đỡ</a></li>
								<li><a href="contact_us.html" class="footer-link">Liên hệ với chúng tôi </a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="footer-content">
							<h4>Các LINKS hữu ích</h4>
							<ul class="footer-link-list">
								<li><a href="create.html" class="footer-link">Tạo sự kiện</a></li>
								<li><a href="privacy_policy.html" class="footer-link">Chính sách bảo mật </a></li>
								<li><a href="term_and_conditions.html" class="footer-link">Điều khoản & Điều kiện </a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="footer-content">
							<h4>Nguồn</h4>
							<ul class="footer-link-list">
								<li><a href="our_blog.html" class="footer-link">Trang chủ</a></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="footer-copyright-text">
							<p class="mb-0">© 2024, <strong>TicketTicket</strong>.Mang đến sự trải nghiệm tốt tới với mọi người </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer End-->
	
	
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
		.create( document.querySelector( '#pd_editor' ), {
			// toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]
		} )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( err => {
			console.error( err.stack );
		} );
	</script>
</body>

</html>