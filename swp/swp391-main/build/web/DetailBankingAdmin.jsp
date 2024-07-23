<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="css/style_ship.css">
        <style>
            /* Reset some default styles */
            body, h2, p {
                margin: 0;
                padding: 0;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                color: #333;
            }

            .container1{
                max-width: 600px;
                margin: 50px auto;
                background: #fff;
                padding: 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                border-radius: 8px;
            }

            h2 {
                text-align: center;
                color: #444;
                margin-bottom: 20px;
                font-size: 24px;
            }

            .info-container {
                padding: 10px;
            }

            .order-info p {
                margin-bottom: 10px;
                font-size: 16px;
            }

            .order-info strong {
                color: #555;
            }

            .order-info p + p {
                border-top: 1px solid #ddd;
                padding-top: 10px;
            }

            .order-info p:last-child {
                margin-bottom: 0;
            }

            @media (max-width: 600px) {
                .container {
                    padding: 15px;
                }

                h2 {
                    font-size: 20px;
                }

                .order-info p {
                    font-size: 14px;
                }
            }
            .button-container {
                text-align: center;
                margin-top: 20px;
            }

        </style>
    </head>

    <body>
        <div class="container1">
            <h2>Thông tin hoàn tiền</h2>
            <div class="info-container">
                <div class="order-info">
<!--                    <p><strong>Code:</strong> ${paymentCancel.getCancelTicketId()} ${keyword} ${payStatus} </p>-->
                    <p><strong>Lý do:</strong> ${paymentCancel.getReason()}</p>
                    <p><strong>Số tài khoản:</strong> ${paymentCancel.getBankNumber()}</p>
                    <p><strong>Tên ngân hàng:</strong> ${paymentCancel.getBankName()}</p>
                    <c:if test="${(empty paymentCancel)}">
                        <h3 style="color: blue">Đang chờ khách hàng gửi thông tin</h3>
                    </c:if>

                </div>
            </div>
            <c:if test="${!empty paymentCancel}">
                <form action="adminpayment?action=accept&payid=${payid}&keyword=${keyword}&payStatus=${payStatus}" method="post" class="button-container">
                    <button type="submit" class="btn btn-success" >Xác nhận</button>
                </form>
            </c:if>
        </div>
    </body>
</html>