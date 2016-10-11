<%
    HttpSession ses = request.getSession(false);
    String id = null;
    try {
        id = ses.getAttribute("id").toString();
    } catch (Exception e) {
    }
    if (id == null ) {
        response.sendRedirect("http://localhost:8080/BOG/");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="employBonus.js"></script>
    <link rel="stylesheet" type="text/css" href="employBonus.css">
</head>
<body>
    <h2>Bonuses</h2>
    <div id="bonuses">
    </div>
</body>
</html>
