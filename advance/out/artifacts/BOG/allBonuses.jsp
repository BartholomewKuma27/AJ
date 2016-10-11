<%
    HttpSession ses = request.getSession(false);
    String id = null;
    String status = null;
    try {
        id = ses.getAttribute("id").toString();
        status = ses.getAttribute("status").toString();
    } catch (Exception e) {
    }
    if (id == null || !status.equals("A")) {
        response.sendRedirect("http://localhost:8080/BOG/");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Bonuses</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="allBonuses.js"></script>
    <link rel="stylesheet" type="text/css" href="allBonuses.css">
</head>
<body>
    <div id="allBonuses">

    </div>
</body>
</html>
