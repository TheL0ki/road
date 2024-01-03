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
    <style>
        .nav-move {
            margin-left: 10px;
        }
    </style>
</head>

<body>
  <header>
    {include file='nav.tpl'}
  </header>
  <main>
    <div class="container-fluid">
      <div class="row">
        <div class="col">
          <div class?="container">
            <form method="post" action="setShift.php?save=true">
              <div class="row mt-2">
                <div class="col align-self-start">
                  <div class="mb-3">
                    <label for="month" class="form-label">Month</label>
                    <select class="form-select" name="month" id="month" aria-describedby="helpId" placeholder="">
                        {for $i=1 to 12}
                          <option value="{$i}">{$i}</option>
                        {/for}
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="year" class="form-label">Year</label>
                    <select class="form-select" name="year" id="year" aria-describedby="helpId" placeholder="">
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
                    <select class="form-select" name="shift" id="shift" aria-describedby="helpId" placeholder="">
                      {foreach from=$shift item=$option}
                        <option value="{$option.id}">{$option.name}</option>
                      {/foreach}
                    </select>
                  </div>
                </div>
                <div class="col align-self-start">
                  <table class="table table-striped table-bordered">
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
                  <table class="table table-striped table-bordered">
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
                <input type="submit" class="btn btn-primary" value="Set shift">
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
                  <select class="form-select" name="day" id="day" aria-describedby="helpId" placeholder="">
                      {for $i=1 to 31}
                        <option value="{$i}">{$i}</option>
                      {/for}
                  </select>
                </div>
                <div class="mb-3">
                  <label for="month" class="form-label">Month</label>
                  <select class="form-select" name="month" id="month" aria-describedby="helpId" placeholder="">
                      {for $i=1 to 12}
                        <option value="{$i}">{$i}</option>
                      {/for}
                  </select>
                </div>
                <div class="mb-3">
                  <label for="year" class="form-label">Year</label>
                  <select class="form-select" name="year" id="year" aria-describedby="helpId" placeholder="">
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
                  <input type="submit" class="btn btn-primary" value="Set holiday">
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
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>

</html>