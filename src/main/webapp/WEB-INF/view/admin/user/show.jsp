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
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item ">Users</li>
                            </ol>
                            <div class=" mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex  d-flex justify-content-between ">
                                            <h3>Table Users</h3>
                                            <a href="/admin/user/create" class="btn btn-primary">CREATE</a>
                                        </div>
                                        <hr />
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Email</th>
                                                    <th>Full Name</th>
                                                    <th>Role</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${users}">
                                                    <tr>
                                                        <td>${user.id}</td>
                                                        <td>${user.email}</td>
                                                        <td>${user.fullName}</td>
                                                        <td>${user.role.name}</td>
                                                        <td>
                                                            <a href="/admin/user/${user.id}"><button
                                                                    class="btn btn-success">View</button></a>
                                                            <a href="/admin/user/update/${user.id}"><button
                                                                    class="btn btn-warning">Edit</button></a>
                                                            <form action="/admin/user/delete/${user.id}" method="POST"
                                                                style="display:inline;">
                                                                <button class="btn btn-danger"
                                                                    onclick="return confirm('Are you sure?')">Delete</button>
                                                            </form>

                                                        </td>
                                                </c:forEach>
                                                </tr>
                                            </tbody>
                                        </table>
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