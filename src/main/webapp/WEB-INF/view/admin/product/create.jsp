<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page pageEncoding="UTF-8" %>\
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <div class="container-fluid px-4">
                            <main>
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item "><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Products</li>

                                </ol>
                                <div class=" mt-5">
                                    <div class="col-12 col-md-6 mx-auto">
                                        <h3>CREATE PRODUCTS</h3>
                                        <hr />
                                        <form:form action="/admin/product/create" method="post"
                                            enctype="multipart/form-data" modelAttribute="product">
                                            <div class="row">
                                                <div class="mb-3 col-12 col-md-6 ">
                                                    <label class="form-label" for="name">Name</label>
                                                    <form:input type="text" class="form-control" path="name"
                                                        cssClass="form-control ${errors.hasFieldErrors('name') ? 'is-invalid' : ''}" />
                                                    <form:errors path="name" cssClass="invalid-feedback" />

                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label" for="">Price</label>
                                                    <form:input type="text" class="form-control" path="price"
                                                        cssClass="form-control ${errors.hasFieldErrors('price') ? 'is-invalid' : ''}" />
                                                    <form:errors path="price" cssClass="invalid-feedback" />

                                                </div>
                                                <div class="mb-3 col-12">
                                                    <label class="form-label" for="">Detail description
                                                    </label>
                                                    <form:input type="text" class="form-control" path="detailDesc"
                                                        cssClass="form-control ${errors.hasFieldErrors('detailDesc') ? 'is-invalid' : ''}" />
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />

                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label" for="">Short description</label>
                                                    <form:input type="text" class="form-control" path="shortDesc"
                                                        cssClass="form-control ${errors.hasFieldErrors('shortDesc') ? 'is-invalid' : ''}" />
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />

                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label" for="">Quantity</label>
                                                    <form:input type="number" step="1" class="form-control"
                                                        path="quantity"
                                                        cssClass="form-control ${errors.hasFieldErrors('quantity') ? 'is-invalid' : ''}" />
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label" for="">Factory</label>
                                                    <select class="form-select" name="factory">
                                                        <option value="APPLE" selected>Apple</option>
                                                        <option value="ASUS">Asus</option>
                                                        <option value="LENOVO">Lenovo</option>
                                                        <option value="DELL">Dell</option>
                                                        <option value="LG">LG</option>
                                                        <option value="ACER">Acer</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label" for="">Target</label>
                                                    <select class="form-select" name="target">
                                                        <option value="GAMING" selected>Gaming</option>
                                                        <option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng</option>
                                                        <option value="THIETKEDOHOA">Thiết kế đồ họa</option>
                                                        <option value="MONG-NHE">Mỏng nhẹ</option>

                                                    </select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label" for="avatarFile">Image</label>
                                                    <input type="file" class="form-control" id="avatarFile"
                                                        accept=".jpg, .jpeg, .png" name="avatar1">
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <img style="max-height: 250px; display: none;" id="avatarPreview"
                                                        alt="avatar preview">
                                                </div>
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </form:form>

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