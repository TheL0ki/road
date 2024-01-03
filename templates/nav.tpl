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
          <a class="nav-link" href="selfManager.php">Settings</a>
        </li>
        {if $session.admin == 1}
          <li class="nav-item">
            <a class="nav-link" href="setShift.php">Batch assign</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="userManager.php">User management</a>
          </li>
        {/if}
        <li class="nav-item">
            <a class="nav-link" href="logout.php">Logout</a>
        </li>
      </ul>
    </div>
</nav>