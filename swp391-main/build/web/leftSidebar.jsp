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
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/report') ? '' : 'active'}">
                    <a href="report" class="menu--link" title="Dashboard" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-solid fa-credit-card menu--icon"></i>
                        <span class="menu--label">Bảng điều khiển</span>
                    </a>
                </li>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/events') ? 'active' : ''}">
                    <a href="#" class="menu--link" title="Events" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-solid fa-calendar-days menu--icon"></i>
                        <span class="menu--label">Sự kiện</span>
                    </a>
                </li>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/promotion') ? 'active' : ''}">
                    <a href="#" class="menu--link" title="Promotion" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-solid fa-rectangle-ad menu--icon"></i>
                        <span class="menu--label">Khuyến mãi</span>
                    </a>
                </li>
                <li class="menu--item ${pageContext.request.requestURI.endsWith('/managerlist') ? 'active' : ''}">
                    <a href="managerlist" class="menu--link" title="Contact List" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="fa-regular fa-address-card menu--icon"></i>
                        <span class="menu--label">Quản lý người dùng</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


    