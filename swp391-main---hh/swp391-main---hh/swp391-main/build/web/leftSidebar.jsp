<%-- 
    Document   : newjsp1
    Created on : Jun 26, 2024, 8:50:21 PM
    Author     : hoangduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="vertical_nav">
    <div class="left_section menu_left" id="js-menu">
        <div class="left_section">
            <ul>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/Dashboard.jsp') ? 'active' : ''}">
                    <a href="report" class="menu--link" title="Thống kê" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-solid fa-chart-pie menu--icon"></i>
                        <span class="menu--label">Thống kê</span>
                    </a>
                </li>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/AdminEvent.jsp') ? 'active' : ''}">
                    <a href="adminevent" class="menu--link" title="Sự kiện" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-solid fa-calendar-days menu--icon"></i>
                        <span class="menu--label">Sự kiện</span>
                    </a>
                </li>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/AdminManageDiscount.jsp') ? 'active' : ''}">
                    <a href="admindiscount" class="menu--link" title="Khuyến mãi" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-solid fa-rectangle-ad menu--icon"></i>
                        <span class="menu--label">Khuyến mãi</span>
                    </a>
                </li>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/list_dashboard.jsp') ? 'active' : ''}">
                    <a href="managerlist" class="menu--link" title="Quản lý người dùng" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-regular fa-address-card menu--icon"></i>
                        <span class="menu--label">Quản lý người dùng</span>
                    </a>
                </li>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/AdminManagePayment.jsp') ? 'active' : ''}">
                    <a href="adminpayment" class="menu--link" title="Quản lý đơn hàng" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-solid fa-credit-card menu--icon"></i>
                        <span class="menu--label">Quản lý đơn hàng</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


