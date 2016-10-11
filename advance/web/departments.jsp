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
    <title>Department</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="departments.js"></script>
    <link rel="stylesheet" type="text/css" href="departments.css">
</head>
<body>
    <button id="addButton">add department</button></br>
    <label for="editInput">Enter id to edit</label><input type="text" id="editInput">
    <button id="editButton">edit department</button></br>
    <label for="removeInput">Enter id to remove</label><input type="text" id="removeInput">
    <button id="removeButton">remove department</button></br>
    <h2>departments</h2>
    <div id="departments">
    </div>
</body>
</html>
