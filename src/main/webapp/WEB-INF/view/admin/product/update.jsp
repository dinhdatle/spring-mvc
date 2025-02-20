<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update Product</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main class="container-fluid px-4">
                            <h1 class="mt-4">Update Product</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Update Product</li>
                            </ol>
                            <div class="mt-5">
                                <div class="col-12 col-md-6 mx-auto">
                                    <h3>Update Product Information</h3>
                                    <hr />
                                    <form:form action="/admin/product/update" method="post"
                                        enctype="multipart/form-data" modelAttribute="product">
                                        <div class="row">
                                            <form:hidden path="id" />
                                            <div class="mb-3 col-12">
                                                <label for="name" class="form-label">Name</label>
                                                <form:input path="name"
                                                    cssClass="form-control ${errors.hasFieldErrors('name') ? 'is-invalid' : ''}" />
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label for="price" class="form-label">Price</label>
                                                <form:input path="price" type="number" step="0.01"
                                                    cssClass="form-control ${errors.hasFieldErrors('price') ? 'is-invalid' : ''}" />
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label for="detailDesc" class="form-label">Detail Description</label>
                                                <form:textarea path="detailDesc"
                                                    cssClass="form-control ${errors.hasFieldErrors('detailDesc') ? 'is-invalid' : ''}" />
                                                <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label for="shortDesc" class="form-label">Short Description</label>
                                                <form:input path="shortDesc"
                                                    cssClass="form-control ${errors.hasFieldErrors('shortDesc') ? 'is-invalid' : ''}" />
                                                <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label for="quantity" class="form-label">Quantity</label>
                                                <form:input path="quantity" type="number" step="1"
                                                    cssClass="form-control ${errors.hasFieldErrors('quantity') ? 'is-invalid' : ''}" />
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label for="factory" class="form-label">Factory</label>
                                                <form:input path="factory" cssClass="form-control" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label for="target" class="form-label">Target</label>
                                                <form:input path="target" cssClass="form-control" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label for="image" class="form-label">Image</label>
                                                <input type="file" name="imageFile" class="form-control"
                                                    accept=".jpg,.jpeg,.png" />
                                                <c:if test="${not empty product.image}">
                                                    <img src="/images/product/${product.image}" alt="Current Image"
                                                        style="max-height: 200px; margin-top: 10px;" />
                                                </c:if>
                                            </div>

                                            <div class="mb-3 col-12 text-center">
                                                <button type="submit" class="btn btn-primary">Update Product</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>