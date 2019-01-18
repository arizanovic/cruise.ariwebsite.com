
function cruTabValue() {
    var da = document.getElementById("input_text_da").value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("GET", "CruiserTableJavaServlet?departure_arrival_id=" + da, true);
    zahtev.send(null);


    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                                      
                }
            };
}