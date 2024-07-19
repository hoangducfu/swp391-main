<%-- 
    Document   : header_staff
    Created on : Jun 20, 2024, 11:41:35 PM
    Author     : hoangduc
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
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
                        <div class="act">
                            <ul class="navbar-nav justify-content-between" >
                                <li class="nav-item"> 
                                    <img src="image/icon/logo (2).png" alt="" width="90px" href="exploreshow" /></li>
                                <li class="nav-item">
                            </ul>
                            <!--                            <ul class="navbar-nav">
                                                            <a class="nav-link active" aria-current="page" href="exploreshow">
                                                                Trang chủ
                                                            </a>
                                                        </ul> comment -->
                            <ul class="navbar-nav " style="margin-top: 5px">
                                <a class="nav-link active" aria-current="page" href="staffmanagecancelticket">
                                    Quản lý đơn hàng
                                </a>
                            </ul><!-- comment -->
                           
                            <ul class="navbar-nav" style="margin-top: 5px">
                                <a class="nav-link active" aria-current="page" href="staffevent">
                                    Sự kiện của tôi
                                </a>
                            </ul>
                            <ul class="navbar-nav" style="margin-top: 5px">
                                <a class="nav-link active" aria-current="page" href="managerDiscount">
                                    Mã giảm giá
                                </a>
                            </ul>
                             <ul>
                                <div class="create-bg">
                                    <a href="createevent" class="offcanvas-create-btn">
                                        <i class="fa-solid fa-calendar-days"></i>
                                        <span>Tạo sự kiện</span>
                                    </a>
                                </div>
                            </ul>
                            <ul>
                                <li class="dropdown account-dropdown">
                                    <a href="#" class="account-link" role="button" id="accountClick" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="image/icon/hihi.jpg" alt="">
                                        <i class="fas fa-caret-down arrow-icon"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-account dropdown-menu-end" aria-labelledby="accountClick">
                                        <li>
                                            <div class="dropdown-account-header">
                                                <div class="account-holder-avatar">
                                            <img src="image/icon/hihi.jpg" alt="">
                                                </div>

                                                <c:set var="user" value="${account}" />
                                                <h5>${user.username}</h5>
                                            </div>
                                        </li>
                                        <li class="profile-link">
                                            <a href="profile" class="link-item">Tài khoản của tôi</a>	
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
    <style>
        .act{
            margin-top: 5px;
            display: flex;
            justify-content: space-evenly;
        }
    </style>
</html>
