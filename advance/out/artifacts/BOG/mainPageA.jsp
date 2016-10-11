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
    <title>Main Page</title>
</head>
<body>
       <a href="http://localhost:8080/BOG/departments.jsp">Departments</a><br/>
       <a href="http://localhost:8080/BOG/allBonuses.jsp">Bonuses</a><br/>
       <a href="http://localhost:8080/BOG/allRatings.jsp">Raitings</a>
</body>
</html>
