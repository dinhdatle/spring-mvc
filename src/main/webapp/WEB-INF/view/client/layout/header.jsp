<%@ page pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <h1 class="text-primary display-6">LaptopShop</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white d-flex justify-content-between mx-5"
                        id="navbarCollapse">
                        <div class="navbar-nav">
                            <a href="" class="nav-item nav-link active">Trang chủ</a>
                            <a href="shop.html" class="nav-item nav-link">Sản phẩm</a>

                        </div>
                        <div class="d-flex m-3 me-0  ">
                            <button
                                class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                                data-bs-toggle="modal" data-bs-target="#searchModal"><i
                                    class="fas fa-search text-primary"></i></button>
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <div class="d-flex">
                                    <a href="/cart" class="position-relative me-4 my-auto">
                                        <i class="fa fa-shopping-bag fa-2x"></i>
                                        <span
                                            class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                            style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.sumProductInCart}</span>
                                    </a>
                                    <div class="dropdown my-auto">

                                        <a class="dropdown" type="button" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                            <i class="fas fa-user fa-2x"></i>
                                        </a>

                                        <ul class="dropdown-menu dropdown-menu-end m-3 ">
                                            <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                                <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                    src="/images/avatar/${sessionScope.avatar}" />
                                                <div class="text-center my-3">
                                                    <c:out value="${sessionScope.fullName}" />
                                                </div>
                                            </li>
                                            <li><a class="dropdown-item active" href="#">Account management</a></li>
                                            <li><a class="dropdown-item" href="#">Another action</a></li>
                                            <li><a class="dropdown-item" href="#">History</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li>
                                                <form action="/logout" method="POST">
                                                    <button class="dropdown-item">Logout</button>
                                                </form>
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" class="btn position-relative me-4 my-auto">Login
                                </a>
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>