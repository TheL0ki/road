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
    <nav class="navbar navbar-expand-lg navbar-light bg-light nav-move">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M17 1c0-.552-.447-1-1-1s-1 .448-1 1v2c0 .552.447 1 1 1s1-.448 1-1v-2zm-12 2c0 .552-.447 1-1 1s-1-.448-1-1v-2c0-.552.447-1 1-1s1 .448 1 1v2zm13 5v10h-16v-10h16zm2-6h-2v1c0 1.103-.897 2-2 2s-2-.897-2-2v-1h-8v1c0 1.103-.897 2-2 2s-2-.897-2-2v-1h-2v18h20v-18zm-11.646 14c-1.318 0-2.192-.761-2.168-2.205h1.245c.022.64.28 1.107.907 1.107.415 0 .832-.247.832-.799 0-.7-.485-.751-1.3-.751v-.977c.573.05 1.196-.032 1.196-.608 0-.455-.369-.663-.711-.663-.575 0-.793.422-.782 1.003h-1.256c.052-1.401.902-2.107 2.029-2.107.968 0 1.969.613 1.969 1.64 0 .532-.234.945-.638 1.147.528.203.847.681.847 1.293-.001 1.201-.993 1.92-2.17 1.92zm5.46 0h-1.306v-3.748h-1.413v-1.027c.897.024 1.525-.233 1.657-1.113h1.062v5.888zm10.186-11v19h-22v-2h20v-17h2z"/></svg>
        <a class="navbar-brand nav-move" href="#">R.O.A.D</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="index.php">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="setShift.php">Batch assign</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="userManager.php">User management</a>
            </li>
          </ul>
        </div>
    </nav>
  </header>
  <main>
    <div class="container-fluid">
      <form method="post" action="setShift.php?save=true">
        <div class="row mt-2">
          <div class="col-2 align-self-start">          
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
          <div class="col-2 align-self-start">
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
          <div class="col-4 align-self-start">
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
        <input type="submit" class="btn btn-primary"> 
      </form>
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