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
        // Refer to http://fezvrasta.github.io/bootstrap-material-design/#getting-started
        $(document).ready(function() {
            // This command is used to initialize some elements and make them work properly
            $.material.init();
        });
    </script>

  </head>

  <body>

<!-- For more usage of bootstrap-material-design in https://fezvrasta.github.io/bootstrap-material-design/bootstrap-elements.html -->

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
          <li><a href="https://github.com/tobegit3hub/ceph-web/" target="_blank">Github</a></li>
          <li class="dropdown">
            <a href="index.html" data-target="#" class="dropdown-toggle" data-toggle="dropdown">More <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="https://github.com/tobegit3hub/ceph-web/issues" target="_blank">Issues</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>


    <div class="container">


      <!-- Health card -->
      <div class="panel panel-primary">
          <div class="panel-heading">
              <span class="panel-title">Ceph Status</span>
              <!-- <span class="togglebutton">
                <label>
                  &nbsp; &nbsp; &nbsp;<input type="checkbox" checked="">
                </label>
              </span> -->
          </div>
          <div class="panel-body">
            <p><b>Overall status:</b> {{.health.Output.OverallStatus}}</p>
            <p><b>Epoch:</b>  {{.health.Output.Timechecks.Epoch}}</p>
            <p><b>Round status:</b>  {{.health.Output.Timechecks.RoundStatus}}</p>
          </div>
      </div>

      <!-- OSD disk free card -->
      <div class="panel panel-success">
          <div class="panel-heading">
              <span class="panel-title">OSD Disk Free</span>
              <!-- <span class="togglebutton">
                <label>
                  &nbsp; &nbsp; &nbsp;<input type="checkbox" checked="">
                </label>
              </span> -->
          </div>
          <div class="panel-body">
              <p><b>Total disk(KB):</b> {{.osdDf.Output.Summary.TotalKb}}</p>
              <p><b>Used disk(KB):</b> {{.osdDf.Output.Summary.TotalKbUsed}}</p>
              <p><b>Available disk(KB):</b> {{.osdDf.Output.Summary.TotalKbAvail}}</p>
              <p><b>Average utilization:</b> {{.osdDf.Output.Summary.AverageUtilization}}</p>
              <p><b>Dev:</b> {{.osdDf.Output.Summary.Dev}}</p>
              <p><b>Max var:</b> {{.osdDf.Output.Summary.MaxVar}}</p>
              <p><b>Min var:</b> {{.osdDf.Output.Summary.MinVar}}</p>
          </div>
      </div>

      <!-- Osd crush dump card -->
      <div class="panel panel-warning">
          <div class="panel-heading">
              <span class="panel-title">OSD CRUSH Dump</span>
              <!-- <span class="togglebutton">
                <label>
                  &nbsp; &nbsp; &nbsp;<input type="checkbox" checked="">
                </label> -->
              </span>
          </div>
          <div class="panel-body">
              <p><b>OSD Profile:</b> {{.osdCrushDump.Output.Tunables.Profile}}</p>
              <p><b>OSD has_v3_rules:</b> {{.osdCrushDump.Output.Tunables.HasV3Rules}}</p>
              <p><b>OSD has_v4_buckets:</b> {{.osdCrushDump.Output.Tunables.HasV4Buckets}}</p>
              <p><b>OSD choose_total_tries:</b> {{.osdCrushDump.Output.Tunables.ChooseTotalTries}}</p>
              <p><b>OSD require_feature_tunables3:</b> {{.osdCrushDump.Output.Tunables.RequireFeatureTunables3}}</p>
              <p><b>OSD legacy_tunables:</b> {{.osdCrushDump.Output.Tunables.LegacyTunables}}</p>
              <p><b>OSD chooseleaf_descend_once:</b> {{.osdCrushDump.Output.Tunables.ChooseleafDescendOnce}}</p>
              <p><b>OSD allowed_bucket_algs:</b> {{.osdCrushDump.Output.Tunables.AllowedBucketAlgs}}</p>
              <p><b>OSD choose_local_fallback_tries:</b> {{.osdCrushDump.Output.Tunables.ChooseLocalFallbackTries}}</p>
              <p><b>OSD has_v2_rules:</b> {{.osdCrushDump.Output.Tunables.HasV2Rules}}</p>
              <p><b>OSD straw_calc_version:</b> {{.osdCrushDump.Output.Tunables.StrawCalcVersion}}</p>
              <p><b>OSD require_feature_tunables2:</b> {{.osdCrushDump.Output.Tunables.RequireFeatureTunables2}}</p>
              <p><b>OSD optimal_tunables:</b> {{.osdCrushDump.Output.Tunables.OptimalTunables}}</p>
              <p><b>OSD choose_local_tries:</b> {{.osdCrushDump.Output.Tunables.ChooseLocalTries}}</p>
              <p><b>OSD chooseleaf_vary_r:</b> {{.osdCrushDump.Output.Tunables.ChooseleafVaryR}}</p>
              <p><b>OSD require_feature_tunables:</b> {{.osdCrushDump.Output.Tunables.RequireFeatureTunables}}</p>
          </div>
      </div>

      <!-- Osd tree card -->
      <div class="panel panel-danger">
          <div class="panel-heading">
              <span class="panel-title">OSD Tree</span>
              <!-- <span class="togglebutton">
                <label>
                  &nbsp; &nbsp; &nbsp;<input type="checkbox" checked="">
                </label>
              </span> -->
          </div>
          <div class="panel-body">
              <p><b>Status:</b> {{.osdTree.Status}}</p>
          </div>
      </div>

      <!-- Pg status card -->
      <div class="panel panel-info">
          <div class="panel-heading">
              <span class="panel-title">PG Status</span>
              <!-- <span class="togglebutton">
                <label>
                  &nbsp; &nbsp; &nbsp;<input type="checkbox" checked="">
                </label>
              </span> -->
          </div>
          <div class="panel-body">
              <p><b>Num pgs:</b> {{.pgStat.Output.NumPgs}}</p>
              <p><b>Raw bytes:</b> {{.pgStat.Output.RawBytes}}</p>
              <p><b>Num bytes:</b> {{.pgStat.Output.NumBytes}}</p>
              <p><b>Version:</b> {{.pgStat.Output.Version}}</p>
              <p><b>Raw bytes used:</b> {{.pgStat.Output.RawBytesUsed}}</p>
              <p><b>Raw bytes avail:</b> {{.pgStat.Output.RawBytesAvail}}</p>
          </div>
      </div>

      <!-- Mds status card -->
      <div class="panel panel-success">
          <div class="panel-heading">
              <span class="panel-title">MDS Status</span>
              <!-- <span class="togglebutton">
                <label>
                  &nbsp; &nbsp; &nbsp;<input type="checkbox" checked="">
                </label>
              </span> -->
          </div>
          <div class="panel-body">
              <p><b>Fs name:</b> {{.mdsStat.Output.Mdsmap.FsName}}</p>
              <p><b>Created:</b> {{.mdsStat.Output.Mdsmap.Created}}</p>
              <p><b>Modified:</b> {{.mdsStat.Output.Mdsmap.Modified}}</p>
              <p><b>Enabled:</b> {{.mdsStat.Output.Mdsmap.Enabled}}</p>
              <p><b>Session timeout:</b> {{.mdsStat.Output.Mdsmap.SessionTimeout}}</p>
              <p><b>Stopped:</b> {{.mdsStat.Output.Mdsmap.Stopped}}</p>
              <p><b>Root:</b> {{.mdsStat.Output.Mdsmap.Root}}</p>
          </div>
      </div>

      <!-- All data is null, not used yet
      <div class="panel panel-primary">
          <div class="panel-heading">
              <span class="panel-title">MDS Compat Show</span>
          </div>
          <div class="panel-body">
              <p><b>Compat:</b> {{.mdsCompatShow.Output.Compat}}</p>
              <p><b>Ro ccompat:</b> {{.mdsCompatShow.Output.RoCompat}}</p>
              <p><b>Feature 1:</b> {{.mdsCompatShow.Output.Incompat.Feature1}}</p>
              <p><b>Feature 2:</b> {{.mdsCompatShow.Output.Incompat.Feature2}}</p>
              <p><b>Feature 3:</b> {{.mdsCompatShow.Output.Incompat.Feature3}}</p>
              <p><b>Feature 4:</b> {{.mdsCompatShow.Output.Incompat.Feature4}}</p>
              <p><b>Feature 5:</b> {{.mdsCompatShow.Output.Incompat.Feature5}}</p>
              <p><b>Feature 6:</b> {{.mdsCompatShow.Output.Incompat.Feature6}}</p>
              <p><b>Feature 8:</b> {{.mdsCompatShow.Output.Incompat.Feature8}}</p>
          </div>
      </div>
      -->

      <div class="checkbox"><label><input type="checkbox"></label></div>

    </div><!-- End of container -->

  </body>
</html>
