<!doctype html>
<html lang="en">

<head>
    <title>R.O.A.D - Overview - Test</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="css/darkStyle.css">
</head>

<body>
  <header>
    {include file='nav.tpl'}
  </header>
  <main>
    {nocache}
    <form>
        <div class="container-fluid mt-3">
            <div class="row">
                <div class="input-group mb-3">
                    <label class="col-form-label col-sm-1" id="basic-addon1">Firstname</label>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Firstname" aria-label="Firstname" aria-describedby="basic-addon1" value="{$user.firstname}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-group mb-3">
                    <label class="col-form-label col-sm-1" id="basic-addon1">Lastname</label>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Lastname" aria-label="Lastname" aria-describedby="basic-addon1" value="{$user.lastname}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-group mb-3">
                    <label class="col-form-label col-sm-1" id="basic-addon1">E-Mail</label>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="E-Mail" aria-label="E-Mail" aria-describedby="basic-addon1" value="{$user.email}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-group mb-3">
                    <label class="col-form-label col-sm-1" id="basic-addon1">Team</label>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Team" aria-label="Team" aria-describedby="basic-addon1" value="{$user.team}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-group mb-3">
                    <label class="col-form-label col-sm-1" id="basic-addon1">Model</label>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Model" aria-label="Model" aria-describedby="basic-addon1" value="{$user.model}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-group mb-3">
                    <label class="col-form-label col-sm-1" for="flexSwitchCheckDefault">Admin</label>
                    <div class="form-check form-switch col">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" {if $user.admin == 1}checked{/if}>            
                    </div>
                </div>
            </div>
        </div>
    </form>
    {/nocache}
  </main>
  <footer>
    <!-- place footer here -->
  </footer>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>