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
            width: 3%;
            text-align: center;
            overflow: hidden;
        }

        .name {
            width: 10%;
            white-space: nowrap;
        }

        table.table.table-striped th.today, table.table.table-striped td.today {
            background-color: lightskyblue;
        }

        .schedule {
            font-size: x-small;
        }

        table.table.table-striped td.shiftLate {
            background-color: rgb(255,241,204);
        }

        table.table.table-striped td.shiftEarly {
            background-color: rgb(232,242,209);
        }

        table.table.table-striped td.shiftShort {
            background-color: rgb(204,228,247);
        }

        table.table.table-striped td.shiftAway {
            background-color: rgb(170, 170, 170);
        }

        table.table.table-striped td.shiftWe {
            background-color: rgb(230,228,248);
        }

        table.table.table-striped td.shiftHoliday {
            background-color: rgb(255,217,217);
        }
        
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
                      <a class="nav-link active" href="index.php">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="setShift.php">Set global shifts</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="userManager.php">User management</a>
                    </li>
                  </ul>
                </div>
            </nav>
        </header>
        <main>
            {nocache}
            <div class="container-fluid mt-3">
                <div class="row justify-content-start align-items-center">
                    <div class="col">
                        <div class="container-fluid p-0">
                            <div class="row">
                                <div class="mb-3">
                                    <label for="team" class="form-label">Team</label>
                                    <select class="form-select" name="team" id="team" aria-activedescendant="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
                                        <option {if $team == 'all'} selected="selected"{/if} value="index.php?y={$date|date_format:'Y'}&m={$date|date_format:'%-m'}">All</option>
                                        {foreach from=$listTeams item=listTeam}
                                            <option {if $team == $listTeam.id} selected="selected"{/if} value="index.php?y={$date|date_format:'Y'}&m={$date|date_format:'%-m'}&t={$listTeam.id}">{$listTeam.display}</option>
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
                                        <label for="month" class="form-label">Month</label>
                                        <select class="form-select" name="month" id="month" aria-describedby="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
                                            {for $i=1 to 12}
                                                {if $i=={$date|date_format:"%-m"}}
                                                    <option selected="selected" value="index.php?y={$date|date_format:'Y'}&m={$i}">{$months.$i}</option>
                                                {else}
                                                    <option value="index.php?y={$date|date_format:'Y'}&m={$i}">{$months.$i}</option>
                                                {/if}
                                            {/for}
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="mb-3">
                                        <label for="year" class="form-label">Year</label>
                                        <select class="form-select" name="year" id="year" aria-describedby="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
                                            {for $i={$date|date_format:"Y"}-2 to {$date|date_format:"Y"}+2}
                                            {if $i == {$date|date_format:"Y"}}
                                            <option selected="selected" value="index.php?y={$i}&m={$date|date_format:'%-m'}">{$i}</option>
                                            {else}
                                            <option value="index.php?y={$i}&m={$date|date_format:'%-m'}">{$i}</option>
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
                            {$prevYear={$date|date_format:"Y"}-1}
                        {else}
                            {$prevMonth={$date|date_format:"m"}-1}
                            {$prevYear={$date|date_format:"Y"}}
                        {/if}
                        <div class="d-grid gap-2">
                            <a name="" id="" class="btn btn-primary" href="index.php?m={$prevMonth}&y={$prevYear}" role="button">← {$months.$prevMonth} {$prevYear}</a>
                        </div>
                    </div>
                    <div class="col">
                        {if {$date|date_format:"m"}==12}
                            {$nextMonth=1}
                            {$nextYear={$date|date_format:"Y"}+1}
                        {else}
                            {$nextMonth={$date|date_format:"m"}+1}
                            {$nextYear={$date|date_format:"Y"}}
                        {/if}
                        <div class="d-grid gap-2">
                            <a name="" id="" class="btn btn-primary" href="index.php?m={$nextMonth}&y={$nextYear}" role="button">{$months.$nextMonth} {$nextYear} →</a>
                        </div>
                    </div>
                </div>                
                <div class="row justify-content-center align-items-center mt-3">
                    <div class="col">
                        <!-- <div class="table-responsive" style="overflow: hidden;"> -->
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th class="name">
                                        Name
                                    </th>                                 
                                    {for $i=1 to {$date|date_format:"t"}}
                                        {if {$dateTable.{$i}.N} == 6 OR {$dateTable.{$i}.N} == 7}
                                        <th class="day bg-secondary">
                                        {elseif {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}
                                            <th class="day today">
                                        {else}
                                            <th class="day">
                                        {/if}
                                        {$dateTable.{$i}.d}
                                        </th>
                                    {/for}
                                </tr>
                                </thead>
                                {foreach from=$users item=user}
                                <tr>
                                    <td class="name">
                                        <a href="changeSchedule.php?id={$user.id}&y={$date|date_format:'Y'}&m={$date|date_format:'m'}">{$user.firstname} {$user.lastname}</a>
                                    </td>
                                    {for $i=1 to {$date|date_format:"t"}}
                                        {if {$schedule[$user.id]} != NULL and array_key_exists($i, $schedule[$user.id]) == TRUE}
                                            {if {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}
                                                <td class="day today schedule">                                                
                                            {elseif $schedule[$user.id][$i]['name'] == '918' OR $schedule[$user.id][$i]['name'] == '917' OR $schedule[$user.id][$i]['name'] == '916' OR $schedule[$user.id][$i]['name'] == '913'}
                                                <td class="day schedule shiftEarly">
                                            {elseif $schedule[$user.id][$i]['name'] == '1017' OR $schedule[$user.id][$i]['name'] == '1218' OR $schedule[$user.id][$i]['name'] == '1117' OR $schedule[$user.id][$i]['name'] == '1217'}
                                                <td class="day schedule shiftLate">
                                            {elseif $schedule[$user.id][$i]['name'] == '814' OR $schedule[$user.id][$i]['name'] == '915' OR $schedule[$user.id][$i]['name'] == '1518'}
                                                <td class="day schedule shiftShort">
                                            {elseif $schedule[$user.id][$i]['name'] == 'U' OR $schedule[$user.id][$i]['name'] == 'K' OR $schedule[$user.id][$i]['name'] == 'Ka' OR $schedule[$user.id][$i]['name'] == 'SCH'}                                        
                                                <td class="day schedule shiftAway">
                                            {elseif $schedule[$user.id][$i]['name'] == 'WE'}
                                                <td class="day schedule shiftWe">
                                            {elseif $schedule[$user.id][$i]['name'] == 'F'}
                                                <td class="day schedule shiftHoliday">
                                            {else}
                                                <td class="day schedule">
                                            {/if}
                                        {else}
                                            {if ({$dateTable.{$i}.N} == 6 OR {$dateTable.{$i}.N} == 7)}
                                                <td class="day bg-secondary">
                                            {elseif {$dateTable.{$i}.ymd} == {$smarty.now|date_format:'Y-m-d'}}
                                                <td class="day today schedule">
                                            {else}
                                                <td class="day">
                                            {/if}
                                        {/if}
                                        {if {$schedule[$user.id]} != NULL and array_key_exists($i, $schedule[$user.id]) == TRUE}
                                            {$schedule[$user.id][$i]['display']|replace:"-":"-<br>"}
                                        {/if}
                                    </td>
                                    {/for}
                                </tr>
                                {/foreach}
                            </table>
                        <!-- </div> -->
                    </div>
                </div>
                {/nocache}
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