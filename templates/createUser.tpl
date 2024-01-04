<!doctype html>
<html lang="en">

<head>
  <title>R.O.A.D - create user</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="css/darkStyle.css">
	<style>
		.form-control::placeholder {
			color: white;
		}
	</style>
</head>
<body>
	<header>
		{include file='nav.tpl'}
	</header>
  <main>
	<div class="container-fluid mt-3">
		{if $smarty.server.HTTP_HOST == "localhost"}
			<div class="row justify-content-center mb-3">
				<div class="col border border-danger text-center">
					<h2 class="text-danger">DEV ENVIRONMENT</h2>
				</div>
			</div>
		{/if}
		<div class="row justify-content-center align-items-center g-2">
			<div class="col">
				<div class="container">
					{nocache}
					<form action="createUser.php" method="post">
						<div class="mb-3 row">
							<label for="inputName" class="col-4 col-form-label dark-text">Firstname</label>
							<div class="col-8">
								<input type="text" class="form-control bg-dark text-white" name="inputFirstname" id="inputFirstname" placeholder="Firstname">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputName" class="col-4 col-form-label dark-text">Lastname</label>
							<div class="col-8">
								<input type="text" class="form-control bg-dark text-white" name="inputLastname" id="inputLastname" placeholder="Lastname">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputName" class="col-4 col-form-label dark-text">E-Mail</label>
							<div class="col-8">
								<input type="text" class="form-control bg-dark text-white" name="inputEmail" id="inputEmail" placeholder="E-Mail">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputName" class="col-4 col-form-label dark-text">Password</label>
							<div class="col-8">
								<input type="password" class="form-control bg-dark text-white" name="inputPwd" id="inputPwd" placeholder="">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputName" class="col-4 col-form-label dark-text">Team</label>
							<div class="col-8">
								<select class="form-select bg-dark text-white" name="inputTeam" id="inputTeam">
									<option selected></option>
									{foreach from=$teams item=team}
									<option value="{$team.id}">{$team.display}</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputName" class="col-4 col-form-label dark-text">Time Model</label>
							<div class="col-8">
								<select class="form-select bg-dark text-white" name="model" id="model">
									<option selected></option>
									<option value="VZ">VZ</option>
									<option value="VZ">TZ</option>
								</select>
							</div>
						</div>
						<fieldset class="mb-3 row">
							<legend class="col-form-legend col-4"></legend>
							<div class="col-8">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="1" name="inputAdmin" id="inputAdmin">
									<label class="form-check-label dark-text" for="inputAdmin">
										Admin
									</label>
								</div>
							</div>
						</fieldset>
						<div class="mb-3 row">
							<div class="offset-sm-4 col-sm-4">
								<button type="submit" class="btn btn-success">Save</button> <a name="" id="" class="btn btn-danger" href="userManager.php" role="button">Cancel</a>
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
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>