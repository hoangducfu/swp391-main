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
                        <a class="navbar-brand order-1 order-lg-0 ml-lg-0 ml-2 me-auto" href="Home.jsp">
                            <div class="main-logo" id="logo">
                                <img src="image/icon/logo (2).png" alt=""/>
                            </div>
                        </a>
                    </div>
                     <div class="offcanvas-body">
                                <div class="offcanvas-top-area">
                                    <div class="create-bg">
                                        <a href="create.html" class="offcanvas-create-btn">
                                            <i class="fa-solid fa-calendar-days"></i>
                                            <span>Tạo sự kiện </span>
                                        </a>
                                    </div>
                                </div>
                                <ul class="navbar-nav justify-content-end flex-grow-1 pe_5">
                                    <li class="nav-item">
                                        <a class="nav-link" href="logout">
                                            <i class="fa-solid fa-right-left me-2"></i>Đăng xuất
                                        </a>
                                    </li>

                                </ul>
                            </div>
                </nav>
                <div class="overlay"></div>
            </div>
        </header>
