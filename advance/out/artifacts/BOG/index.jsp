<%
    HttpSession ses = request.getSession(false);
    String id = null;
    String status = null;
    try {
        id = ses.getAttribute("id").toString();
        status = ses.getAttribute("status").toString();
    } catch (Exception e) {
    }
    if (id != null) {
        if(status.equals("A")){
            response.sendRedirect("http://localhost:8080/BOG/mainPageA.jsp");
        }
        else{
            response.sendRedirect("http://localhost:8080/BOG/mainPageE.jsp");
        }
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>BARCS</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <link rel="stylesheet" type="text/css" href="login.css">
    <script>
    </script>
  </head>
  <body>
    <div id="loginDiv">
        username
        <input type="text" id="username" name="username"/>
        password
        <input type="text" id="password" name="password"/>
        <button type="button" id="loginButton">login</button>
    </div>
  <script>
  $(document).ready(function(){
      $("#loginButton").click(function(){
          var username = $("#username").val();
          var password = $("#password").val();
          $.ajax({
              type: "POST",
              url: "loginServlet",
              data: {username : username,
                    password: password},
              success: function(data){
                  if(data.ok){
                      if (data.status == "A"){
                          window.location = "http://localhost:8080/BOG/mainPageA.jsp";
                      }
                      else{
                          window.location = "http://localhost:8080/BOG/mainPageE.jsp";
                      }

                  }
                  else{
                      alert("wrong username or password");
                  }
              }
          });
      });
  });
  </script>
</body>
</html>
