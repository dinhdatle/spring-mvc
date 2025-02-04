<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                <h3>CREATE ACCOUNT</h3>
                <hr />
                <form action="/admin/user/create" method="post" >
                    <div class="mb-3">
                        <label class="form-label" for="">Email</label>
                        <input type="email" class="form-control" name="email" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="">Password</label>
                        <input type="password" class="form-control"  name="password"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="">Phone Number</label>
                        <input type="text" class="form-control" name="phone" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="">Full Name</label>
                        <input type="text" class="form-control" name="fullName" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="">Address</label>
                        <input type="text" class="form-control" name="address" />
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>

            </div>
        </div>
    </div>
</body>

</html>