function updateForm()
{
    var user_id = event.target.value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("POST", "UpdateUserServlet?user_id=" + user_id, true);
    zahtev.send(null);
    console.log("poslali zahtev");
    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                    document.getElementById("firstname").value = obj[0].firstname;
                    document.getElementById("lastname").value = obj[0].lastname;
                    document.getElementById("email").value = obj[0].email;
                    document.getElementById("username").value = obj[0].username;

                    document.getElementById("role").value = obj[0].role;
                    document.getElementById("gender").value = obj[0].gender;

                        
                }
            };
}
