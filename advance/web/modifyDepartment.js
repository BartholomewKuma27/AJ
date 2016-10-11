$(document).ready(function(){
    $("#depId").val(sessionStorage.getItem("id"));
    $("#depAbr").val(sessionStorage.getItem("abr"));
    $("#depName").val(sessionStorage.getItem("name"));
    $("#depDsc").val(sessionStorage.getItem("dsc"));
    $("#submit").click(function () {
        var abr = $("#depAbr").val();
        var name = $("#depName").val();
        var dsc = $("#depDsc").val();
        var id = $("#depId").val();
        $.ajax({
            type: "POST",
            url: "modifyDepartmentServlet",
            data: { "id" : id,
                    "abr" : abr,
                    "name" : name,
                    "dsc" : dsc},
            success : function(data){
                window.location = "http://localhost:8080/BOG/departments.jsp";
            }
        });
    });
});