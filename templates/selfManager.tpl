<!doctype html>
<html lang="en">

<head>
    <title>R.O.A.D - Overview</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="css/darkStyle.css">
</head>

<body>
    {nocache}
  <header>    
    {include file='nav.tpl'}
  </header>
  <main>
    <div class="container-fluid mt-3">
        <div class="row justify-content-center">
            <div class="col-6">
                <form action="selfManager.php" method="post">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="mb-3 row">
                                    <label for="email" class="col-sm-2 col-form-label dark-text">Email</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control bg-dark text-white" id="email" name="email" value="{$session.email}">
                                        <input type="hidden" id="userID" name="userID" value="{$session.id}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-success">Save</button>
                                </div>                                
                            </div>
                            <div class="col">
                                <div class="d-grid gap-2">
                                    <a href="changePassword.php" class="btn btn-dark">Change Password</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  </main>
  {/nocache}
  <footer>
    <!-- place footer here -->
  </footer>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>

</html>