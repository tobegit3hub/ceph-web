<!DOCTYPE html>

<html>
  <head>
    <title>Ceph Web</title>

    <!-- Css -->
    <link rel="stylesheet" type="text/css" href="static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">

    <!-- JavaScript -->
    <script src="static/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="static/js/style.js"></script>
  </head>

  <body>

    <div class="container">

      <h1>Ceph Health</h1>
      <h1>{{.health.Output.Timechecks.Epoch}}</h1>

      <h1>OSD Disk Free</h1>
      <h2>{{.osdDf.Output.Nodes}}</h2>

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
