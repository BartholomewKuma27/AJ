<%--
  Created by IntelliJ IDEA.
  User: Ika
  Date: 29.09.2016
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>$Title$</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
      $(document).ready(function(){
        $("#say").click(function(){
            var name = $("#inputName").val();
            $.ajax({
                type: "POST",
                url: "talker",
                data: {name : name},
                success: function(result){
                    alert(result);
                }
            });
        });
      });
    </script>
  </head>
  <body>
  Say my name <input type="text" id="inputName"/>
  <button id="say">SAY IT!!</button>


  </body>
</html>
