<%-- 
    Document   : header_admin
    Created on : Jun 26, 2024, 10:01:51 PM
    Author     : hoangduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header">
    <div class="header-inner">		
        <nav class="navbar navbar-expand-lg bg-barren barren-head navbar fixed-top justify-content-sm-start pt-0 pb-0 ps-lg-0 pe-2">
            <div class="container-fluid ps-0">
                <button type="button" id="toggleMenu" class="toggle_menu">
                    <i class="fa-solid fa-bars-staggered"></i>
                </button>
                <button id="collapse_menu" class="collapse_menu me-4">
                    <i class="fa-solid fa-bars collapse_menu--icon "></i>
                    <span class="collapse_menu--label"></span>
                </button>
                <button class="navbar-toggler order-3 ms-2 pe-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon">
                        <i class="fa-solid fa-bars"></i>
                    </span>
                </button>
                <a class="navbar-brand order-1 order-lg-0 ml-lg-0 ml-2 me-auto" href="report">
                    <div class="main-logo  justify-content-between" id="logo">
                        <img src="image/icon/logo (2).png" alt="" height="60px" width="70px" href="report" /></li>
                    </div>
                </a>
            </div>
            <ul>
                <li class="dropdown account-dropdown" style="margin-right: 150px ">
                    <a href="#" class="account-link" role="button" id="accountClick" data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="image/icon/hihi.jpg" alt="">
                        
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
                           
                            <a href="logout" class="link-item">Đăng xuất</a>									
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="overlay"></div>
    </div>
</header>
