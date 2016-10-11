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
    <title>Employee Page</title>
</head>
<body>
    <a href="http://localhost:8080/BOG/employBonus.jsp">bonuses</a>
</body>
</html>
