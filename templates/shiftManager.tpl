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
			{include file='nav.tpl'}
		</header>
		<main>
			<div class="container-fluid mt-3">
				{if $smarty.server.HTTP_HOST == "localhost"}
					<div class="row justify-content-center mb-3">
						<div class="col">
							<div class="border border-danger text-center">
								<h2 class="text-danger">DEV ENVIRONMENT</h2>
							</div>
						</div>
					</div>
				{/if}
				<div class="row justify-content-center mb-3">
					<div class="col">
						<a href="#" class="btn btn-primary">Add Shift</a>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col">
						<div class="table-responsive">
							<table class="table table-dark table-striped table-bordered">
								<tr>
									<th>Name</th>
									<th>Display</th>
									<th>Hours</th>
									<th>Color Coding</th>
									<th>Options</th>
								</tr>
								{foreach from=$shifts item=shift}
									<tr>
										<td>{$shift.name}</td>
										<td>{$shift.display}</td>
										<td>{$shift.hours}</td>
										<td></td>
										<td class="text-center">
											<a href="#" class="btn btn-success">&#x270E; Edit</a>
											<a href="#" class="btn btn-danger">&#128465; Delete</a>
										</td>
									</tr>
								{/foreach}
							</table>
						</div>
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