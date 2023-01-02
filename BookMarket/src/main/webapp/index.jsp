<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <style>
            html{
                overflow-y:scroll;
            }

            .library-bg {
                background-image: url("./resources/images/library.jpg");
                background-color: #cccccc;
                color: #ffffff;
                text-shadow: 3px 3px #000000;
                height: 35em;
                padding-top: 13em;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                position: relative;
            }
        </style>
        <title>인터넷 할인 서점입니다.</title>
    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <div class="jumborton library-bg">
            <div class="container">
                <h1 class="display-3">인터넷 할인 서점입니다.</h1>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
