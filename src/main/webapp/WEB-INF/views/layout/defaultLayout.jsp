<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!--<link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet">-->
        <!--<link href="/static/font-awesome/css/font-awesome.min.css" rel="stylesheet">-->

        <!--For Gyph icons for the top menu, this is CDN version and not in the local repository-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title><tiles:getAsString name="title" /></title>

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
			#top-menu{
			    margin-bottom: -18px
				}
				#sidebar{
				    padding-top: 51px;
    padding-bottom: 396px;
	}
            
        </style>


    </head>

    <body>
        <header id="header">
            <tiles:insertAttribute name="header" />
        </header>

        <section id="sidemenu">
            <tiles:insertAttribute name="menu" />
        </section>

        <section id="site-content">
            <tiles:insertAttribute name="body" />
        </section>

        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
    </body>
</html>