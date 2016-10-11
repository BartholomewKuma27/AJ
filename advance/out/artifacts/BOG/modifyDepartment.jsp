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
    <title>Modify Department</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="modifyDepartment.js"></script>
</head>
<body>
    <label for="depId">ID</label><input id="depId" readonly><br/>
    <label for="depAbr">ABREVIATION</label><input id="depAbr"><br/>
    <label for="depName">NAME</label><input id="depName"><br/>
    <label for="depDsc">DESCRIPTION</label><input id="depDsc"><br/>
    <button id="submit">SAVE</button>
</body>
</html>
