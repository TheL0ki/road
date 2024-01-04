<!doctype html>
<html lang="en">

<head>
	<title>R.O.A.D - Change Schedule</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS v5.3.2 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="css/darkStyle.css">
	<style>
		.day {
			width: 2.7%;
			text-align: center;
		}

		.name {
			width: 15%;
			white-space: nowrap;
		}

		table.table th.today, table.table td.today {
			background-color: lightskyblue;
		}
	</style>
</head>

<body>
  <header>
	{nocache}
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
	<div class="row justify-content-center align-items-center g-2">
		<div class="col">
			
			<form action="saveSchedule.php" method="post">
				<table class="table">
					<thead>
						<tr>
							<th class="name dark-text">Name</th>
							{assign var="loopDay" value=$date}
							{for $i=1 to {$date|date_format:"t"}}
								{if {$loopDay|date_format:'N'} == 6 OR {$loopDay|date_format:'N'} == 7}
									<th class="day bg-secondary">
								{elseif {$loopDay|date_format:'Y-m-d'} == {$smarty.now|date_format:'Y-m-d'}}
									<th class="day today">
								{else}
									<th class="day dark-text">
								{/if}
									{$loopDay|date_format:"d"}
								</th>
								{assign var="loopDay" value={{$loopDay|date_format:'U'}+{24*60*60}}}
								{if $i >= 15}
									{break}
								{/if}
							{/for}
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3" class="name dark-text">{$user.firstname} {$user.lastname}</td>
							{for $i=1 to {$date|date_format:"t"}}
								{if {$dateTable.{$i}.N} == 6 OR {$dateTable.{$i}.N} == 7}
									<td class="day bg-secondary">
								{elseif {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}
									<td class="day today">
								{else}
									<td class="day">
								{/if}
								<select name="{$i}" id="{$i}">
									{if array_key_exists($i, $schedule)}
										<option value="{$schedule.$i.shift.shift}">{$schedule.$i.name}</option>
									{else}
										<option></option>
									{/if}
									<option>---</option>
									{foreach from=$shift item=$option}
										<option value="{$option.id}">{$option.name}</option>
									{/foreach}
								</select>

							</td>
							{if $i >= 15}
								{break}
							{/if}
							{/for}
						</tr>
						<tr>
							{for $i=16 to {$date|date_format:"t"}}
								{if {$dateTable.{$i}.N} == 6 OR {$dateTable.{$i}.N} == 7}
									<th class="day bg-secondary">
								{elseif {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}
									<th class="day today">
								{else}
									<th class="day dark-text">
								{/if}
									{$dateTable.{$i}.d}
								</th>
							{/for}
						</tr>
						<tr>
							{for $i=16 to {$date|date_format:"t"}}
								{if {$dateTable.{$i}.N} == 6 OR {$dateTable.{$i}.N} == 7}
									<td class="day bg-secondary">
								{elseif {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}
									<td class="day today">
								{else}
									<td class="day">
								{/if}
								<select name="{$i}" id="{$i}">
									{if array_key_exists($i, $schedule)}
										<option value="{$schedule.$i.shift.shift}">{$schedule.$i.name}</option>
									{else}
										<option></option>
									{/if}
									<option value="">---</option>
									{foreach from=$shift item=$option}
										<option value="{$option.id}">{$option.name}</option>
									{/foreach}
								</select>
								</td>
							{/for}
						</tr>
					</tbody>
				</table>
				<input type="hidden" value="{$date|date_format:'Y'}" name="y">
				<input type="hidden" value="{$date|date_format:'n'}" name="m">
				<input type="hidden" value="{$user.id}" name="userId">
				<input type="submit" value="Save" class="btn btn-success"> <a name="" id="" class="btn btn-danger" href="index.php?y={$date|date_format:'Y'}&m={$date|date_format:'n'}" role="button">Cancel</a>
			</form>
			{/nocache}
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