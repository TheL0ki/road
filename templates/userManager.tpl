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
    <style>
      td {
        color: rgb(200, 200, 200);
      }
    </style>
</head>

<body>
  <header>
    {include file='nav.tpl'}
  </header>
  <main>
  <div
    class="container-fluid mt-3">
    <div
      class="row justify-content-center align-items-center g-2">
      <div class="col">
        <a
          name=""
          id=""
          class="btn btn-primary"
          href="createUser.php"
          role="button"
          >Create new User</a
        >        
      </div>
    </div>    
  </div>  
	<div class="container-fluid mt-3">
		<div class="table-responsive">
		<table class="table table-dark table-striped table-bordered">
			<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Team</th>
				<th scope="col">E-Mail</th>
				<th scope="col">Model</th>
				<th scope="col">Admin</th>
			</tr>
			</thead>
			<tbody>
				{foreach from=$users item=user}
				<tr>
					<td><a href="changeUser.php?id={$user.id}" class="link-light">{$user.firstname} {$user.lastname}</a></td>
					<td>{$teams.{$user.team}.display}</td>
					<td>{$user.email}</td>
					<td>{$user.model}</td>
					<td><input type="checkbox" {if $user.admin == 1}checked{/if}></td>
				</tr>
				{/foreach}
			</tbody>
		</table>
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