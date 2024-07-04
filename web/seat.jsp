<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" class="h-100">


    <head>
        <meta charset="utf-8" />
        <title>TicketTicket - Hệ thống mua vé một cách dễ dàng</title>
        <link rel="icon" type="image/png" href="images/fav.png">
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta name="description" content="Movie Pro" />
        <meta name="keywords" content="Movie Pro" />
        <meta name="author" content="" />
        <meta name="MobileOptimized" content="320" />
        <!--Template style -->
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/animate.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/font-awesome.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/fonts.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/flaticon.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/owl.carousel.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/owl.theme.default.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/dl-menu.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/nice-select.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/magnific-popup.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/venobox.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/layers.css" />
        <link rel="stylesheet" type="text/css" href="jvendor/fontawesome-free/seatcss/navigation.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/settings.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/seat.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/style.css" />
        <link rel="stylesheet" type="text/css" href="vendor/fontawesome-free/seatcss/responsive.css" />
        <link rel="stylesheet" id="theme-color" type="text/css" href="#"/>
        <!-- favicon links -->
        <link rel="shortcut icon" type="image/png" href="images/header/favicon.ico" />
    </head>

    <body>
        <!-- preloader Start -->
        <div id="preloader">
            <div id="status">
                <img src="images/fav.png" id="preloader_image" alt="loader">
            </div>
        </div>
        <!-- color picker start -->
        <!-- st top header Start -->
        <form action="ControlerSeat" method="post">
            <div class="st_bt_top_header_wrapper float_left">
                <div class="container container_seat">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="st_bt_top_back_btn st_bt_top_back_btn_seatl float_left">	<a href="search"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Back</a>
                            </div>
                            <div class="cc_ps_quantily_info cc_ps_quantily_info_tecket">

                                <input type="hidden" name="product_id" />
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="st_bt_top_center_heading st_bt_top_center_heading_seat_book_page float_left">
                                <h2 style="color: white">Chọn vị trí ghế</h2>

                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="st_bt_top_close_btn st_bt_top_close_btn2 float_left">	
                            </div>

                            <div 
                                class="st_seatlay_btn float_left">	<button type="submit">Tiếp </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- st top header Start -->
            <!-- st seat Layout Start -->
            <div class="st_seatlayout_main_wrapper float_left">
                <div class="container container_seat">
                    <div class="st_seat_lay_heading float_left" ">
                        <div style="color: red" >  <h2 style="text-align:center " >Sân khâu chính</h2></div>
                    </div>





                    <div class="st_seat_full_container">
                        <div class="st_seat_lay_economy_wrapper float_left">

                            <div class="st_seat_lay_economy_heading float_left">
                                <h3>Ghế Loại 1</h3>
                            </div>
                            <div class="st_seat_lay_row float_left">
                                <ul>
                                    <li class="st_seat_heading_row">A</li>                              

                                    <c:set var="counter" value="1" /><!--                         Ghế chưa có người chọn       ////-->
                                    <c:forEach items="${datalist}" var="o">


                                        <c:if test="${counter <= 20}">

                                            <li class = "${(o.status eq '1' ) ? 'seat_disable':''  }">           <span> ${o.price}</span>

                                                <input type="checkbox" id="c${o.areaID}" name="cb">
                                                <label for="c${o.areaID}"></label>
                                            </li>
                                        </c:if>
                                        <c:set var="counter" value="${counter + 1}" />
                                    </c:forEach>



                                </ul>

                            </div>
                        </div>
                        <div class="st_seat_lay_economy_wrapper st_seat_lay_economy_wrapperexicutive float_left">
                            <div class="st_seat_lay_economy_heading float_left">
                                <h3>Ghế  Loại 2</h3>
                            </div>
                            <div class="st_seat_lay_row float_left">
                                <ul>
                                    <li class="st_seat_heading_row">B</li>

                                    <!--                                <li class="seat_disable">
                                                                        <input type="checkbox" id="c28" name="cb">
                                                                        <label for="c28"></label>
                                                                    </li>-->
                                    <c:set var="counter" value="1" /><!--                         Ghế chưa có người chọn       ////-->
                                    <c:forEach items="${datalist}" var="o">


                                        <c:if test="${   counter >= 21 && counter <= 40}">

                                            <li class = "${(o.status eq '1' ) ? 'seat_disable':''  }" }>           <span> ${o.price}</span>
                                                <input type="checkbox" id="c${o.areaID}" name="cb">
                                                <label for="c${o.areaID}"></label>
                                            </li>
                                        </c:if>
                                        <c:set var="counter" value="${counter + 1}" />
                                    </c:forEach>
                                </ul>


                            </div>
                            <div class="st_seat_lay_economy_heading float_left">
                                <h3>Ghế Loại 3</h3>
                            </div>
                            <div class="st_seat_lay_row float_left">
                                <ul>
                                    <li class="st_seat_heading_row">C</li>





                                    <c:set var="counter" value="1" /><!--                         Ghế chưa có người chọn       ////-->
                                    <c:forEach items="${datalist}" var="o">


                                        <c:if test="${counter <= 60 && counter >= 41}">

                                            <li class = "${(o.status eq '1' ) ? 'seat_disable':''  }">           <span> ${o.price}</span>
                                                <input type="checkbox" id="c${o.areaID}" name="cb">
                                                <label for="c${o.areaID}"></label>
                                            </li>
                                        </c:if>
                                        <c:set var="counter" value="${counter + 1}" />
                                    </c:forEach>
                                </ul>

                            </div>
                        </div>
                    </div>



                </div>





            </div>
        </form>
        <!-- st seat Layout End -->
        <!--main js file start-->
        <script src="vendor/fontawesome-free/seatcss/jquery_min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/modernizr.js"></script>
        <script src="vendor/fontawesome-free/seatcss/bootstrap.js"></script>
        <script src="vendor/fontawesome-free/seatcss/owl.carousel.js"></script>
        <script src="vendor/fontawesome-free/seatcss/jquery.dlmenu.js"></script>
        <script src="vendor/fontawesome-free/seatcss/jquery.sticky.js"></script>
        <script src="vendor/fontawesome-free/seatcss/jquery.nice-select.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/jquery.magnific-popup.js"></script>
        <script src="vendor/fontawesome-free/seatcss/jquery.bxslider.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/venobox.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/smothscroll_part1.js"></script>
        <script src="vendor/fontawesome-free/seatcss/smothscroll_part2.js"></script>
        <script src="vendor/fontawesome-free/seatcss/jquery.themepunch.revolution.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/jquery.themepunch.tools.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.addon.snow.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.actions.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.carousel.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.kenburn.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.layeranimation.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.migration.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.navigation.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.parallax.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.slideanims.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/revolution.extension.video.min.js"></script>
        <script src="vendor/fontawesome-free/seatcss/custom.js"></script>
        <!--main js file end-->
        <script>
            //* Isotope js
            function protfolioIsotope() {
                if ($('.st_fb_filter_left_box_wrapper').length) {
                    // Activate isotope in container
                    $(".protfoli_inner, .portfoli_inner").imagesLoaded(function () {
                        $(".protfoli_inner, .portfoli_inner").isotope({
                            layoutMode: 'masonry',
                        });
                    });

                    // Add isotope click function 
                    $(".protfoli_filter li").on('click', function () {
                        $(".protfoli_filter li").removeClass("active");
                        $(this).addClass("active");
                        var selector = $(this).attr("data-filter");
                        $(".protfoli_inner, .portfoli_inner").isotope({
                            filter: selector,
                            animationOptions: {
                                duration: 450,
                                easing: "linear",
                                queue: false,
                            }
                        });
                        return false;
                    });
                }
                ;
            }
            ;
            protfolioIsotope();

            function changeQty(increase) {
                var qty = parseInt($('.select_number').find("input").val());
                if (!isNaN(qty)) {
                    qty = increase ? qty + 1 : (qty > 1 ? qty - 1 : 1);
                    $('.select_number').find("input").val(qty);
                } else {
                    $('.select_number').find("input").val(1);
                }
            }
        </script>
    </body>


    <!-- Mirrored from www.webstrot.com/html/moviepro/html/seat_booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 May 2024 16:21:33 GMT -->
</html>