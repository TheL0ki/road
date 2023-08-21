<!doctype html>
<html lang="en">

<head>
  <title>R.O.A.D - create user</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>

<body>
  <header>
    <!-- place navbar here -->
  </header>
  <main>
    <div class="container-fluid">
        <div class="row justify-content-center align-items-center g-2">
            <div class="col">
                <div class="container">
                    {nocache}
                    <form action="createUser.php" method="post">
                        <div class="mb-3 row">
                            <label for="inputName" class="col-4 col-form-label">Firstname</label>
                            <div class="col-8">
                                <input type="text" class="form-control" name="inputFirstname" id="inputFirstname" placeholder="Firstname">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-4 col-form-label">Lastname</label>
                            <div class="col-8">
                                <input type="text" class="form-control" name="inputLastname" id="inputLastname" placeholder="Lastname">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-4 col-form-label">E-Mail</label>
                            <div class="col-8">
                                <input type="text" class="form-control" name="inputEmail" id="inputEmail" placeholder="E-Mail">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-4 col-form-label">Password</label>
                            <div class="col-8">
                                <input type="password" class="form-control" name="inputPwd" id="inputPwd" placeholder="">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-4 col-form-label">Team</label>
                            <div class="col-8">
                                <select class="form-select" name="inputTeam" id="inputTeam">
                                    <option selected></option>
                                    {foreach from=$teams item=team}
                                    <option value="{$team.id}">{$team.display}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <fieldset class="mb-3 row">
                            <legend class="col-form-legend col-4"></legend>
                            <div class="col-8">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="1" name="inputAdmin" id="inputAdmin">
                                    <label class="form-check-label" for="inputAdmin">
                                        Admin
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                        <div class="mb-3 row">
                            <div class="offset-sm-4 col-sm-4">
                                <button type="submit" class="btn btn-success">Save</button> <a name="" id="" class="btn btn-danger" href="index.php" role="button">Cancel</a>
                            </div>
                        </div>
                    </form>
                    {/nocache}
                </div>
            </div>
        </div>
    </div>
  </main>
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