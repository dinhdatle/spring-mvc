<!-- <html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</head>

<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-md-6 mx-auto">
                <h3>UPDATE ACCOUNT</h3>
                <hr />
                <form action="/admin/user/update" method="post">
                    <div class="mb-3 d-none">
                        <label class="form-label" for="">Id:</label>
                        <input type="hidden" class="form-control" name="id" value="${user.id}" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="">Email</label>
                        <input type="email" class="form-control" name="email" value="${user.email}" disabled />
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="">Phone Number</label>
                        <input type="text" class="form-control" name="phone" value="${user.phone}" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="">Full Name</label>
                        <input type="text" class="form-control" name="fullName" value="${user.fullName}" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="">Address</label>
                        <input type="text" class="form-control" name="address" value="${user.address}" />
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>

            </div>
        </div>
    </div>
</body>

</html> -->

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
            <title>Dashboard - Hỏi Dân IT</title>
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
                            <h1 class="mt-4">Manage User</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item "><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Users</li>

                            </ol>
                            <div class="container mt-5">
                                <div class="row">
                                    <div class="col-12 col-md-6 mx-auto">
                                        <h3>UPDATE ACCOUNT</h3>
                                        <hr />
                                        <form action="/admin/user/update" method="post">
                                            <div class="mb-3 d-none">
                                                <label class="form-label" for="">Id:</label>
                                                <input type="hidden" class="form-control" name="id"
                                                    value="${user.id}" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="">Email</label>
                                                <input type="email" class="form-control" name="email"
                                                    value="${user.email}" disabled />
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label" for="">Phone Number</label>
                                                <input type="text" class="form-control" name="phone"
                                                    value="${user.phone}" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="">Full Name</label>
                                                <input type="text" class="form-control" name="fullName"
                                                    value="${user.fullName}" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="">Address</label>
                                                <input type="text" class="form-control" name="address"
                                                    value="${user.address}" />
                                            </div>
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </form>

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