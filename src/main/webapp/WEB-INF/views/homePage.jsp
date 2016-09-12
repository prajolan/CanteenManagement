<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
            .row.content {height: 100%}

            /* Set gray background color and 100% height */
            .sidenav {
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }
            
            #sidebar{
                padding-top: 10px;
            }
            #topbar{
                color:white;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height: auto;}
            }
        </style>
    </head>
    <body>
        

            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Companies Name</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> View Items</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-stats"></span> View Report</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Activity Log</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-plus"></span> Create Account</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>

       


        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-3 sidenav" id="sidebar">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#section2">View Food/Drinks</a></li>
                        <li><a href="#section3">View Report</a></li>
                        <li><a href="#section3">Manage Account</a></li>
                        <li><a href="#section3">Activity Log</a></li>
                    </ul><br>
                    <!----------------------------Search Bar Menu------------------------->
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search Item">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                    <!---------------------------Search Bar Menu------------------------------>
                </div>

                <div class="col-sm-9" id="div1">
                    <h4><small>RECENT POSTS</small></h4>
                    <hr>

                    <h2>I Love Food</h2>
                    <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
                    <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
                    <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <br><br>

                    <h4><small>RECENT POSTS</small></h4>
                    <hr>
                    <h2>Officially Blogging</h2>
                    <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
                    <h5><span class="label label-success">Lorem</span></h5><br>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <hr>
                    <p><span class="badge">2</span> Comments:</p><br>
                </div>
            </div>
        </div>

        <footer class="container-fluid">
            <p>Footer Text</p>
        </footer>

    </body>
</html>