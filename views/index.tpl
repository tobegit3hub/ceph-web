<!DOCTYPE html>

<html>
  <head>
    <title>Ceph Web</title>

    <!-- Css -->
    <link rel="stylesheet" type="text/css" href="static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/bower_components/bootstrap-material-design/dist/css/material-fullpalette.min.css">
    <link rel="stylesheet" type="text/css" href="static/bower_components/bootstrap-material-design/dist/css/material.min.css">
    <link rel="stylesheet" type="text/css" href="static/bower_components/bootstrap-material-design/dist/css/ripples.min.css">
    <link rel="stylesheet" type="text/css" href="static/bower_components/bootstrap-material-design/dist/css/roboto.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">

    <!-- JavaScript -->
    <script src="static/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="static/bower_components/bootstrap-material-design/dist/js/material.min.js"></script>
    <script src="static/bower_components/bootstrap-material-design/dist/js/ripples.min.js"></script>
    <script src="static/js/style.js"></script>

        <script>
            $(document).ready(function() {
                // This command is used to initialize some elements and make them work properly
                $.material.init();
            });
        </script>

  </head>

  <body>

<!-- Nav bar -->
<div class="navbar navbar-warning">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-warning-collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="javascript:void(0)">Ceph-web</a>
  </div>
  <div class="navbar-collapse collapse navbar-warning-collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="javascript:void(0)">Home</a></li>
    </ul>
    <form class="navbar-form navbar-left">
      <input type="text" class="form-control col-lg-8" placeholder="Search">
    </form>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="https://github.com/tobegit3hub/ceph-web/">Github</a></li>
      <li class="dropdown">
        <a href="index.html" data-target="#" class="dropdown-toggle" data-toggle="dropdown">More <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="https://github.com/tobegit3hub/ceph-web/issues">Submit issues</a></li>
          <li><a href="https://github.com/tobegit3hub">Contact author</a></li>
        </ul>
      </li>
    </ul>
  </div>
</div>


    <div class="container">

<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Ceph Status</h3>
    </div>
    <div class="panel-body">
        {{.health.Output.OverallStatus}}
    </div>
</div>

      <h1>OSD Disk Free</h1>
      <h2>{{.osdDf.Output.Nodes}}</h2>

<div class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title">Panel success</h3>
    </div>
    <div class="panel-body">
        Panel content
    </div>
</div>

<div class="panel panel-warning">
    <div class="panel-heading">
        <h3 class="panel-title">Panel warning</h3>
    </div>
    <div class="panel-body">
        Panel content
    </div>
</div>

<div class="panel panel-danger">
    <div class="panel-heading">
        <h3 class="panel-title">Panel danger</h3>
    </div>
    <div class="panel-body">
        Panel content
    </div>
</div>

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">Panel info</h3>
    </div>
    <div class="panel-body">
        Panel content
    </div>
</div>


      <h1>OSD CRUSH Dump</h1>
      <h2>{{.osdCrushDump}}</h2>

      <h1>OSD Tree</h1>
      <h2>{{.osdTree}}</h2>

      <h1>PG Stat</h1>
      <h2>{{.pgStat}}</h2>

      <h1>MDS Compat Show</h1>
      <h2>{{.mdsCompatShow.Output.Incompat}}</h2>

      <h1>MDS Stat</h1>
      <h2>{{.mdsStat}}</h2>

    </div><!-- End of container -->

  </body>
</html>
