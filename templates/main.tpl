<!doctype html>
<html lang="en">
    <head>
    <title>R.O.A.D - Overview</title>
    <!-- Test Change-->
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
        {nocache}
        <header>
            {include file='nav.tpl'}
        </header>
        <main>
            <div class="container-fluid mt-3">
                <div class="row justify-content-start align-items-center">
                    <div class="col">
                        <div class="container-fluid p-0">
                            <div class="row">
                                <div class="mb-3">
                                    <label for="team" class="form-label">Team</label>
                                    <select class="form-select" name="team" id="team" aria-activedescendant="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
                                        <option {if $team == 'all'} selected="selected"{/if} value="main.php?y={$setYear}&m={$setMonth}">All</option>
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
                                        <label for="month" class="form-label">Month</label>
                                        <select class="form-select" name="month" id="month" aria-describedby="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
                                            {for $i=1 to 12}
                                                {if $i=={$setMonth}}
                                                    <option selected="selected" value="main.php?y={$setYear}&m={$i}">{$months.$i}</option>
                                                {else}
                                                    <option value="main.php?y={$setYear}&m={$i}">{$months.$i}</option>
                                                {/if}
                                            {/for}
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="mb-3">
                                        <label for="year" class="form-label">Year</label>
                                        <select class="form-select" name="year" id="year" aria-describedby="helpId" placeholder="" onchange="if (this.value) window.location.href=this.value">
                                            {for $i={$setYear}-2 to {$setYear}+2}
                                                {if $i == {$setYear}}
                                                    <option selected="selected" value="main.php?y={$i}&m={$setMonth}">{$i}</option>
                                                {else}
                                                    <option value="main.php?y={$i}&m={$setMonth}">{$i}</option>
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
                            <a name="" id="" class="btn btn-primary" href="main.php?m={$prevMonth}&y={$prevYear}" role="button">← {$months.$prevMonth} {$prevYear}</a>
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
                            <a name="" id="" class="btn btn-primary" href="main.php?m={$nextMonth}&y={$nextYear}" role="button">{$months.$nextMonth} {$nextYear} →</a>
                        </div>
                    </div>
                </div>                
                <div class="row justify-content-center align-items-center mt-3">
                    <div class="col">
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
                                    {if $session.admin == 1}
                                        <a href="changeSchedule.php?id={$user.id}&y={$setYear}&m={$date|date_format:'m'}">{$user.firstname} {$user.lastname}</a>
                                    {else}
                                        {$user.firstname} {$user.lastname}
                                    {/if}
                                </td>
                                {for $i=1 to {$date|date_format:"t"}}
                                    {if array_key_exists($i, $schedule[$user.id]) == TRUE}
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
                                        <div class="container-fluid">
                                            <div class="row p-0">
                                                <div class="col p-0">                                        
                                                    {if array_key_exists($i, $schedule[$user.id]) == TRUE}
                                                        {$schedule[$user.id][$i]['display']|replace:"-":"-<br>"}
                                                    {/if}
                                                </div>
                                            </div>
                                            <div class="row p-0">
                                                <div class="col p-0">
                                                    {if array_key_exists($i, $schedule[$user.id]) == TRUE}
                                                        {if {$schedule[$user.id][$i]['homeOffice']} == 1}
                                                            <div>
                                                                HO
                                                            </div>
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                {/for}
                            </tr>
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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
        </script>
    </body>
</html>