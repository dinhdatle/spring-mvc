<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
            <meta name="author" content="Hỏi Dân IT" />
            <title>Detail Product</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <main>
                            <h1 class="mt-4">Manage Product</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item "><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Products</li>

                            </ol>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-center">
                                            <h3>PRODUCT DETAIL WITH ID ${product.id}</h3>
                                        </div>
                                        <hr />
                                        <div class="card" style="width: 60%;">
                                            <div class="card-header">
                                                Product infomation
                                            </div>
                                            <img src="/images/product/${product.image}" class="card-img-top w-60"
                                                alt="">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">${product.id}</li>
                                                <li class="list-group-item">${product.name}</li>
                                                <li class="list-group-item">${product.price}</li>
                                            </ul>
                                        </div>
                                        <a href="/admin/product" class="btn btn-primary mt-3">Back></a>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                    <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>
        </body>

        </html>