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
                                <h1 class="mt-4">Manage User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item "><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users</li>

                                </ol>
                                <div class=" mt-5">
                                    <div class="col-12 col-md-6 mx-auto">
                                        <h3>CREATE ACCOUNT</h3>
                                        <hr />
                                        <form:form action="/admin/user/create" modelAttribute="user" method="post"
                                            enctype="multipart/form-data" class="row">
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label" for="email">Email</label>

                                                <!-- Gán class 'is-invalid' khi có lỗi -->
                                                <form:input path="email"
                                                    cssClass="form-control ${errors.hasFieldErrors('email') ? 'is-invalid' : ''}"
                                                    type="email" />

                                                <!-- Hiển thị lỗi -->
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label" for="password">Password</label>
                                                <form:password path="password"
                                                    class="form-control ${errors.hasFieldErrors('password') ? 'is-invalid' : ''} " />
                                                <form:errors path="password" cssClass="text-danger" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label" for="phone">Phone Number</label>
                                                <form:input path="phone"
                                                    class="form-control ${errors.hasFieldErrors('phone') ? 'is-invalid' : ''}" />
                                                <form:errors path="phone" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label" for="fullName">Full Name</label>
                                                <form:input path="fullName"
                                                    class="form-control  ${errors.hasFieldErrors('fullName') ? 'is-invalid' : ''}" />
                                                <form:errors path="fullName" cssClass="text-danger" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <label class="form-label" for="address">Address</label>
                                                <form:input path="address" class="form-control" />
                                                <form:errors path="address" cssClass="text-danger" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label" for="role">Role</label>
                                                <form:select path="role.name" class="form-select">
                                                    <form:option value="ADMIN" label="Admin" />
                                                    <form:option value="USER" label="User" />
                                                </form:select>
                                                <form:errors path="role.name" cssClass="text-danger" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label" for="avatarFile">Avatar</label>
                                                <input type="file" class="form-control" id="avatarFile"
                                                    accept=".jpg, .jpeg, .png" name="avatar1" />
                                            </div>

                                            <div class="mb-3 col-12">
                                                <img style="max-height: 250px; display: none;" id="avatarPreview"
                                                    alt="avatar preview" />
                                            </div>

                                            <button type="submit" class="btn btn-primary">Submit</button>

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