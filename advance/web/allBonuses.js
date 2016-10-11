$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "allBonusesServlet",
        success :function (data) {
            for(var key in data){
                var nameHeader = document.createElement("h2");
                var name = document.createTextNode(key);
                nameHeader.appendChild(name);
                var table = getTable(data[key]);
                document.getElementById("allBonuses").appendChild(nameHeader);
                document.getElementById("allBonuses").appendChild(table);
            }
        }
    });
});

function getTable(data) {
    var table = document.createElement('table');
    var trH = document.createElement('tr');
    var td1H = document.createElement('td');
    var td2H = document.createElement('td');

    var text1H = document.createTextNode("project name");
    var text2H = document.createTextNode("bonus money");

    td1H.appendChild(text1H);
    td2H.appendChild(text2H);
    trH.appendChild(td1H);
    trH.appendChild(td2H);
    table.appendChild(trH);
    for (var key in data){
        var tr = document.createElement('tr');
        var td1 = document.createElement('td');
        var td2 = document.createElement('td');

        var text1 = document.createTextNode(key);
        var text2 = document.createTextNode(data[key]);

        td1.appendChild(text1);
        td2.appendChild(text2);
        tr.appendChild(td1);
        tr.appendChild(td2);
    }
    table.appendChild(tr);
    return table;
}