<!doctype html>
<html lang="en">
	<head>
	<title>R.O.A.D - Overview</title>
	<!-- Test Change-->
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS v5.2.1 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/darkStyle.css">
	<link rel="stylesheet" type="text/css" href="css/shiftStyles.css">
	<style>
		table {
			table-layout:fixed;
		}
		td {
			overflow: hidden;
			text-overflow: ellipsis;
			word-wrap: break-word;
			hyphens: manual;
		}
		.day {
			width: 30px;
			height: 1px;
			text-align: center;
			position: relative;
		}

		.name {
			width: 10%;
			white-space: nowrap;
		}

		.schedule {
			font-size: x-small;
		}
	</style>
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
				<div class="row justify-content-start align-items-center">
					<div class="col">
						<div class="container-fluid p-0">
							<div class="row">
								<div class="mb-3">
									<label for="team" class="form-label dark-text">Team</label>
									<select class="form-select bg-dark text-white" name="team" id="team" aria-activedescendant="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
										<option {if $team == 'all'} selected="selected"{/if} value="main.php?y={$setYear}&m={$setMonth}">All</option>
										<option {if $team == 'me'} selected="selected"{/if} value="main.php?y={$setYear}&m={$setMonth}&t=me">Only me</option>
										{foreach from=$listTeams item=listTeam}
											<option {if $team == $listTeam.id} selected="selected"{/if} value="main.php?y={$setYear}&m={$setMonth}&t={$listTeam.id}">{$listTeam.display}</option>
										{/foreach}
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-start align-items-center">
					<div class="col">
						<div class="container-fluid p-0">
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label for="month" class="form-label dark-text">Month</label>
										<select class="form-select bg-dark text-white" name="month" id="month" aria-describedby="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
											{for $i=1 to 12}
												{if $i=={$setMonth}}
													{if isset($team)}
														<option selected="selected" value="main.php?y={$setYear}&m={$i}$t={$team}">{$months.$i}</option>
													{else}														
														<option selected="selected" value="main.php?y={$setYear}&m={$i}">{$months.$i}</option>
													{/if}
												{else}
													{if isset($team)}
														<option value="main.php?y={$setYear}&m={$i}&t={$team}">{$months.$i}</option>
													{else}
														<option value="main.php?y={$setYear}&m={$i}">{$months.$i}</option>
													{/if}
												{/if}
											{/for}
										</select>
									</div>
								</div>
								<div class="col">
									<div class="mb-3">
										<label for="year" class="form-label dark-text">Year</label>
										<select class="form-select bg-dark text-white" name="year" id="year" aria-describedby="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
											{for $i={$setYear}-2 to {$setYear}+2}
												{if $i == {$setYear}}
													{if isset($team)}
														<option selected="selected" value="main.php?y={$i}&m={$setMonth}&t={$team}">{$i}</option>
													{else}
														<option selected="selected" value="main.php?y={$i}&m={$setMonth}">{$i}</option>
													{/if}
												{else}
													{if isset($team)}
														<option value="main.php?y={$i}&m={$setMonth}&t={$team}">{$i}</option>
													{else}
														<option value="main.php?y={$i}&m={$setMonth}">{$i}</option>
													{/if}
												{/if}
											{/for}
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						{if {$date|date_format:"m"}==1}
							{$prevMonth=12}
							{$prevYear={$setYear}-1}
						{else}
							{$prevMonth={$date|date_format:"m"}-1}
							{$prevYear={$setYear}}
						{/if}
						<div class="d-grid gap-2">
							{if isset($team)}
								<a name="" id="" class="btn btn-dark" href="main.php?m={$prevMonth}&y={$prevYear}&t={$team}" role="button">← {$months.$prevMonth} {$prevYear}</a>
							{else}
								<a name="" id="" class="btn btn-dark" href="main.php?m={$prevMonth}&y={$prevYear}" role="button">← {$months.$prevMonth} {$prevYear}</a>
							{/if}
						</div>
					</div>
					<div class="col">
						{if {$date|date_format:"m"}==12}
							{$nextMonth=1}
							{$nextYear={$setYear}+1}
						{else}
							{$nextMonth={$date|date_format:"m"}+1}
							{$nextYear={$setYear}}
						{/if}
						<div class="d-grid gap-2">
							{if isset($team)}
								<a name="" id="" class="btn btn-dark" href="main.php?m={$nextMonth}&y={$nextYear}&t={$team}" role="button">{$months.$nextMonth} {$nextYear} →</a>
							{else}
								<a name="" id="" class="btn btn-dark" href="main.php?m={$nextMonth}&y={$nextYear}" role="button">{$months.$nextMonth} {$nextYear} →</a>
							{/if}
						</div>
					</div>
				</div>                
				<div class="row justify-content-center align-items-center mt-3">
					<div class="col">
						<table class="table table-dark table-striped table-bordered">
							<thead>
							<tr>
								<th class="name dark-text">
									Name
								</th>                                 
								{for $i=1 to {$date|date_format:"t"}}
									{if {$dateTable.{$i}.N} == 6 OR {$dateTable.{$i}.N} == 7}
									<th class="day weekend dark-text">
									{elseif {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}
										<th class="day today">
									{else}
										<th class="day dark-text">
									{/if}
									{$dateTable.{$i}.d}
									</th>
								{/for}
							</tr>
							</thead>
							{assign var="x"  value=1}
							{foreach from=$users item=user}
							<tr>
								<td class="name">
									{if $smarty.session.user.admin == 1 OR $smarty.session.user.id == $user.id}
										<a href="changeSchedule.php?id={$user.id}&y={$setYear}&m={$date|date_format:'m'}" class="link-light">{$user.firstname} {$user.lastname}</a>
									{else}
										<span class="dark-text">{$user.firstname} {$user.lastname}</span>
									{/if}
								</td>
								{for $i=1 to {$date|date_format:"t"}}
									{if array_key_exists($i, $schedule[$user.id]) == TRUE}
										<td class="day schedule p-0{if {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}{if {$x} == {$users|@count}} last{else} today{/if}{/if}" style="
											background-color: #{$schedule[$user.id][$i]['color']};
											--bs-table-bg-type: #{$schedule[$user.id][$i]['color']};
											--bs-table-striped-bg: #{$schedule[$user.id][$i]['color']};
											">
									{else}
										{if ({$dateTable.{$i}.N} == 6 OR {$dateTable.{$i}.N} == 7)}
											<td class="day weekend p-0">
										{else}
											<td class="day p-0{if {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}} today{/if}">
										{/if}
									{/if}
										<div class='shiftContainer{if array_key_exists($i, $schedule[$user.id]) == TRUE}{if $schedule[$user.id][$i]['homeOffice'] === 1} homeOffice{/if}{/if}'>
											{if array_key_exists($i, $schedule[$user.id]) == TRUE}
												<nobr>{$schedule[$user.id][$i]['display']|replace:"-":"-<br>"}</nobr>
											{/if}
										</div>
									</td>
								{/for}
							</tr>
							{assign var="x"  value=$x+1}
							{/foreach}
						</table>
					</div>
				</div>
				{/nocache}
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