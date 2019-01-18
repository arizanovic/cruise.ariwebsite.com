function updateForm()
{
    var client_id = event.target.value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("POST", "UpdateClientServlet?client_id=" + client_id, true);
    zahtev.send(null);
    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                    for(var i =0; i< Object.keys(obj).length; i++){
                        var kljuc = Object.keys(obj)[i];
                        var vrednost = obj[kljuc];
                        var elem = document.getElementById(kljuc);
                        if (elem != null)
                            elem.value = vrednost;
                    }
                        
                }
            };
}


