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
                <title> Cart</title>
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


                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb ">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Cart Details</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="container py-5">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Products</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <tr>
                                            <td scope="row">
                                                <div class="d-flex align-items-center">
                                                    <img src="/images/product/${cartDetail.product.image}"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="">
                                                </div>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <a
                                                        href="/product/${cartDetail.product.id}">${cartDetail.product.name}</a>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4">
                                                    <fmt:formatNumber value="${cartDetail.product.price}"
                                                        type="currency" currencySymbol="₫" />
                                                </p>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4" style="width: 100px;">
                                                    <div class="input-group-btn">
                                                        <button
                                                            class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input type="text"
                                                        class="form-control form-control-sm text-center border-0"
                                                        value="${cartDetail.quantity}"
                                                        data-cart-detail-id="${cartDetail.id}"
                                                        data-cart-detail-price="${cartDetail.product.price}" readonly>
                                                    <div class="input-group-btn">
                                                        <button
                                                            class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                            <i class="fa fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                    <fmt:formatNumber
                                                        value="${cartDetail.product.price * cartDetail.quantity}"
                                                        type="currency" currencySymbol="₫" />
                                                </p>
                                            </td>
                                            <td>
                                                <form action="/delete-cart-product/${cartDetail.id}" method="POST">
                                                    <button class="btn btn-md rounded-circle bg-light border mt-4">
                                                        <i class="fa fa-times text-danger"></i>
                                                    </button>
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>


                    </div>
                    <div class="row g-4 justify-content-end">
                        <!-- <div class="col-8"></div> -->
                        <div class="col-8 col-md-4">
                            <div class="bg-light rounded">
                                <div class="p-4">
                                    <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                                    <div class="d-flex justify-content-between mb-4">
                                        <h5 class="mb-0 me-4">Subtotal:</h5>
                                        <p class="mb-0" data-cart-total-price="${totalPrice}">
                                            <fmt:formatNumber value="${totalPrice}" type="currency"
                                                currencySymbol="₫" />
                                        </p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <h5 class="mb-0 me-4">Shipping</h5>
                                        <div class="">
                                            <p class="mb-0">Flat rate: $3.00</p>
                                        </div>
                                    </div>
                                    <p class="mb-0 text-end">Shipping to Ukraine.</p>
                                </div>
                                <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                    <h5 class="mb-0 ps-4 me-4">Total</h5>
                                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                        <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₫" />
                                    </p>
                                </div>
                                <button
                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                    type="button">Proceed Checkout</button>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <!-- Footer Start -->
                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />

                <!-- Footer End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
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