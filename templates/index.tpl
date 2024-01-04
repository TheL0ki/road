<!doctype html>
<html lang="en">
	<head>
			<title>R.O.A.D - Overview</title>
			<!-- Required meta tags -->
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

			<!-- Bootstrap CSS v5.2.1 -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
			<link rel="stylesheet" href="css/darkStyle.css">
	</head>
	<body>
		{nocache}
		<header>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container-fluid">
					<img src="img/calendar.svg" class="filter_white">
					<a class="navbar-brand" href="#">R.O.A.D</a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item">
									<a class="nav-link" href="index.php">Home</a>
								</li>
							</ul>
						</div>
				</div>
			</nav>
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
			<div class="row justify-content-center">
				<div class="col-3">
					<form action="index.php" method="post">
						<div class="mb-3 row">
							<label for="email" class="form-label dark-text">E-Mail</label>
							<div class="col-sm-10">
								<input type="text" id="username" name="email" class="form-control bg-dark text-white">
							</div>                    
						</div>
						<div class="mb-3 row">
							<label for="pwd" class="form-label dark-text">Password</label>
							<div class="col-sm-10">
								<input type="password" id="pwd" name="pwd" class="form-control bg-dark text-white">
							</div>                    
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
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
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
	</body>
</html>