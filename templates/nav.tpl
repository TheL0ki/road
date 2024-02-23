<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<img src="img/calendar.svg" class="filter_white">
		<a class="navbar-brand" href="index.php">R.O.A.D</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="index.php">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="selfManager.php">Settings</a>
				</li>
				{if $smarty.session.user.admin == 1}
					<li class="nav-item">
						<a class="nav-link" href="setShift.php">Batch assign</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="userManager.php">User management</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="shiftManager.php">Shift management</a>
					</li>
				{/if}
				<li class="nav-item">
					<a class="nav-link" href="logout.php">Logout</a>
				</li>
			</ul>
		</div>
	</div>
</nav>