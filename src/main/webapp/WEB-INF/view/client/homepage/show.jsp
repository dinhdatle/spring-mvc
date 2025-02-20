<%@ page pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content=" Dự án laptopshop" />
                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->


                <!-- Navbar start -->
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                <!-- Navbar End -->


                <!-- Modal Search Start -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content rounded-0">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body d-flex align-items-center">
                                <div class="input-group w-75 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords"
                                        aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i
                                            class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Search End -->


                <!-- Hero Start -->
                <jsp:include page="/WEB-INF/view/client/layout/banner.jsp" />
                <!-- Hero End -->





                <!--  Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4">
                                    <h1>Sản phẩm nổi bật</h1>
                                </div>
                                <div class="col-lg-8 text-end">
                                    <a class="nav-link active d-inline-block bg-light rounded-pill py-2 px-3"
                                        data-bs-toggle="pill" href="#tab-1">
                                        All Products
                                    </a>
                                </div>
                            </div>

                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <!-- Sản phẩm -->
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-md-6 col-lg-4 col-xl-3 col-sm-12 d-flex">
                                                <div
                                                    class="rounded position-relative fruite-item border h-100 d-flex flex-column">
                                                    <div class="fruite-img">
                                                        <img src="/images/product/${product.image}"
                                                            class="img-fluid w-100 rounded-top product-img" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                        style="top: 10px; left: 10px;">Bán chạy</div>
                                                    <div
                                                        class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-column justify-content-between flex-grow-1">
                                                        <div>
                                                            <h4 class="product-title">
                                                                <a href="/product/${product.id}">${product.name}</a>
                                                            </h4>
                                                            <p class="product-desc">
                                                                ${product.shortDesc}
                                                            </p>
                                                        </div>
                                                        <div
                                                            class="d-flex flex-lg-wrap  justify-content-center align-items-center gap-2 ">
                                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                                <fmt:formatNumber value="${product.price}" type="number"
                                                                    groupingUsed="true" /> đ
                                                            </p>
                                                            <form action="/add-product-to-cart/${product.id}"
                                                                method="post">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button
                                                                    class="rounded border-secondary border mx-auto btn"><i
                                                                        class="fa fa-shopping-bag text-primary me-3"></i>
                                                                    Add
                                                                    to
                                                                    cart</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--  Shop End-->

                <!-- Featurs Section Start -->
                <jsp:include page="/WEB-INF/view/client/layout/feature.jsp" />

                <!-- Featurs Section End -->

                <!-- Footer Start -->
                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />

                <!-- Footer End -->




                <!-- Back to Top -->
                <a href="" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>