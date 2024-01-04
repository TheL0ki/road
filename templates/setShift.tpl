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
    <style>
      label, td, th {
        color: rgb(200, 200, 200);
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
      <div class="row">
        <div class="col">
          <div class?="container">
            <form method="post" action="setShift.php?save=true">
              <div class="row mt-2">
                <div class="col align-self-start">
                  <div class="mb-3">
                    <label for="month" class="form-label">Month</label>
                    <select class="form-select bg-dark text-white" name="month" id="month" aria-describedby="helpId" placeholder="">
                        {for $i=1 to 12}
                          <option value="{$i}">{$i}</option>
                        {/for}
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="year" class="form-label">Year</label>
                    <select class="form-select bg-dark text-white" name="year" id="year" aria-describedby="helpId" placeholder="">
                        {for $i={$date|date_format:"Y"}-2 to {$date|date_format:"Y"}+2}
                          {if $i == {$date|date_format:"Y"}}
                            <option selected="selected" value="{$i}">{$i}</option>
                          {else}
                            <option value="{$i}">{$i}</option>
                          {/if}
                        {/for}
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="shift" class="form-label">Shift</label>
                    <select class="form-select bg-dark text-white" name="shift" id="shift" aria-describedby="helpId" placeholder="">
                      {foreach from=$shift item=$option}
                        <option value="{$option.id}">{$option.name}</option>
                      {/foreach}
                    </select>
                  </div>
                </div>
                <div class="col align-self-start">
                  <table class="table table-dark table-striped table-bordered">
                    <tr>
                      <td><input type="checkbox" id="weekdayCheck_1" value="1" name="weekdayCheck[]"></td><td>Monday</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" id="weekdayCheck_2" value="2" name="weekdayCheck[]"></td><td>Tuesday</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" id="weekdayCheck_3" value="3" name="weekdayCheck[]"></td><td>Wednesday</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" id="weekdayCheck_4" value="4" name="weekdayCheck[]"></td><td>Thursday</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" id="weekdayCheck_5" value="5" name="weekdayCheck[]"></td><td>Friday</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" id="weekdayCheck_6" value="6" name="weekdayCheck[]"></td><td>Saturday</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" id="weekdayCheck_7" value="7" name="weekdayCheck[]"></td><td>Sunday</td>
                    </tr>
                  </table>
                </div>
              </div>
              <div class="row">
              </div>
              <div class="row">
                <div class="col align-self-start">
                  <table class="table table-dark table-striped table-bordered">
                    <thead>
                      <tr>
                        <th></th>
                        <th>Name</th>
                      </tr>
                      {foreach from=$users item=user}
                      <tr>
                        <td><input type="checkbox" id="userCheck_{$user.id}" value="{$user.id}" name="checkedUser[]"></td>
                        <td>{$user.firstname} {$user.lastname}</td>
                      </tr>
                      {/foreach}
                    </thead>
                  </table>
                </div>
              </div>
              <div class="mb-3">
                <input type="submit" class="btn btn-success" value="Set shift">
              </div>
            </form>
          </div>
        </div>
        <div class="col">
          <div class="container">
            <div class="row">
              <form method="post" action="setHoliday.php">
                <div class="mb-3">
                  <label for="day" class="form-label">Day</label>
                  <select class="form-select bg-dark text-white" name="day" id="day" aria-describedby="helpId" placeholder="">
                      {for $i=1 to 31}
                        <option value="{$i}">{$i}</option>
                      {/for}
                  </select>
                </div>
                <div class="mb-3">
                  <label for="month" class="form-label">Month</label>
                  <select class="form-select bg-dark text-white" name="month" id="month" aria-describedby="helpId" placeholder="">
                      {for $i=1 to 12}
                        <option value="{$i}">{$i}</option>
                      {/for}
                  </select>
                </div>
                <div class="mb-3">
                  <label for="year" class="form-label">Year</label>
                  <select class="form-select bg-dark text-white" name="year" id="year" aria-describedby="helpId" placeholder="">
                      {for $i={$date|date_format:"Y"}-2 to {$date|date_format:"Y"}+2}
                        {if $i == {$date|date_format:"Y"}}
                          <option selected="selected" value="{$i}">{$i}</option>
                        {else}
                          <option value="{$i}">{$i}</option>
                        {/if}
                      {/for}
                  </select>
                </div>
                <div class="mb-3">
                  <input type="submit" class="btn btn-success" value="Set holiday">
                </div>
              </form>
            </div>
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