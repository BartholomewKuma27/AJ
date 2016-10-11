var depMap = [];
$(document).ready(function(){
    $("#addButton").click(function () {
        window.location = "http://localhost:8080/BOG/modifyDepartment.jsp";
    });
    $("#editButton").click(function () {
        var reqId = $("#editInput").val();
        sessionStorage.setItem("id", reqId);
        var curElem = depMap[reqId];
        var reqAbr = curElem.abr;
        sessionStorage.setItem("abr", reqAbr);
        var reqName = curElem.name;
        sessionStorage.setItem("name", reqName);
        var reqDsc = curElem.dsc;
        sessionStorage.setItem("dsc", reqDsc);
        window.location = "http://localhost:8080/BOG/modifyDepartment.jsp";
    });
    $("#removeButton").click(function () {
        var reqId = $("#removeInput").val();
        $.ajax({
            type : "POST",
            url : "removeDepartmentServlet",
            data: {"id" : reqId},
            success : function () {
                location.reload(true);
            }
        });
    });
    $.ajax({
        type: "POST",
        url: "getDepartmentsServlet",
        success : function(data){
            var table = document.createElement('table');
            var trH = document.createElement('tr');
            var td1H = document.createElement('td');
            var td2H = document.createElement('td');
            var td3H = document.createElement('td');
            var td4H = document.createElement('td');

            var text1H = document.createTextNode("ID");
            var text2H = document.createTextNode("ABREVIATION");
            var text3H = document.createTextNode("NAME");
            var text4H = document.createTextNode("DESCRIPTION");

            td1H.appendChild(text1H);
            td2H.appendChild(text2H);
            td3H.appendChild(text3H);
            td4H.appendChild(text4H);

            trH.appendChild(td1H);
            trH.appendChild(td2H);
            trH.appendChild(td3H);
            trH.appendChild(td4H);

            table.appendChild(trH);
            for (var i in data){
                var curRow = data[i];
                var id = curRow.id;
                var abr = curRow.abr;
                var name = curRow.name;
                var dsc = curRow.dsc;

                var saver = {};
                saver.id = id;
                saver.abr = abr;
                saver.name = name;
                saver.dsc = dsc;
                depMap[saver.id] = saver;

                var tr = document.createElement('tr');

                var td1 = document.createElement('td');
                var td2 = document.createElement('td');
                var td3 = document.createElement('td');
                var td4 = document.createElement('td');

                var text1 = document.createTextNode(id);
                var text2 = document.createTextNode(abr);
                var text3 = document.createTextNode(name);
                var text4 = document.createTextNode(dsc);

                td1.appendChild(text1);
                td2.appendChild(text2);
                td3.appendChild(text3);
                td4.appendChild(text4);

                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
                tr.appendChild(td4);

                table.appendChild(tr);
            }
            document.getElementById('departments').appendChild(table);
        }
    });
});