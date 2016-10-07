<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login page</title>
        <link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
    </head>

    <body>
        <div id="mainWrapper">
            <div class="login-container">
                <div class="login-card">
            <center>
                    <a href="admin" class="btn btn-success btn-lg" role="button" style="margin-right: 71px">ADMIN</a>

                    <a href="user" class="btn btn-success btn-lg" role="button">USER</a>
            </center>
        </div>
            </div>
            </div>

    </body>
</html>