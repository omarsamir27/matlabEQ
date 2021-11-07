<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
    <section class="vh-100 bg-image" style="background-image: url('https://mdbootstrap.com/img/Photos/new-templates/search-box/img4.jpg');">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-5">
                                <h2 class="text-uppercase text-center mb-5">Login To Your Account</h2>

                                <form action="welcome.php"  method="post">

                                    <div class="form-outline mb-4">
                                        <input type="email" id="form3Example3cg" placeholder="xxx@example.com" class="form-control form-control-lg" name="email" required>
                                        <label class="form-label" for="form3Example3cg">Your Email</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="form3Example4cg" placeholder="********" class="form-control form-control-lg" name="pass" required>
                                        <label class="form-label" for="form3Example4cg">Password</label>
                                    </div>


                                    <div class="form-check d-flex justify-content-center mb-5">
                                        <input
                                                class="form-check-input me-2"
                                                type="checkbox"
                                                value=""
                                                id="form2Example3cg"
                                        />
                                        <label class="form-check-label" for="form2Example3g">
                                            I agree all statements in Terms of service</a>
                                        </label>
                                    </div>

                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" name="login">Login</button>
                                    </div>

                                    <p class="text-center text-muted mt-5 mb-0">Do not have an account? <a href="index.php" class="fw-bold text-body"><u>Register here</u></a></p>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </body>
</html>