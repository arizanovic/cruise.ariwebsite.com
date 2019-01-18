function removeOptions(selectbox)
{
    var i;
    for(i = selectbox.options.length - 1 ; i >= 0 ; i--)
    {
        selectbox.remove(i);
    }
}

function val() {
    var da = document.getElementById("departure_arrival_id").value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("GET", "ResRoomDepArrServlet?departure_arrival_id=" + da, true);
    zahtev.send(null);
    console.log("poslali zahtev");

    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                    var x = document.getElementById("rooms");
                    removeOptions(document.getElementById("rooms"));

                    for (var i = 0; i < obj.length; i++) {
                      var option = document.createElement("option");
                      option.text = obj[i].id;
                      x.add(option);
                    }
                }
            };
}

function roomNumber() {
    var ro = document.getElementById("rooms").value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("GET", "RoomServlet?room_id=" + ro, true);
    zahtev.send(null);
    console.log("poslali zahtev");

    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                    document.getElementById("roomPrice").value = obj.price;
                }
            };
}

function activityNumber() {
    var ac = document.getElementById("activity").value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("GET", "ActivityServlet?activity_id=" + ac, true);
    zahtev.send(null);
    console.log("poslali zahtev");

    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                    document.getElementById("activityPrice").value = obj.price;
                }
            };
}

function activityNumberClient() {
    var ac = document.getElementById("activityClient").value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("GET", "ActivityServlet?activity_id=" + ac, true);
    zahtev.send(null);
    console.log("poslali zahtev");

    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);                   
                    document.getElementById("activityPriceClient").innerHTML = "ACTIVITY PRICE: " + obj.price + " euros";
                    document.getElementById("activityPriceClientInput").value = obj.price;
                }
            };
}

function mealNumber() {
    var me = document.getElementById("meal").value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("GET", "MealServlet?meal_id=" + me, true);
    zahtev.send(null);
    console.log("poslali zahtev");

    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                    document.getElementById("mealPrice").value = obj.price;
                }
            };
}

function mealNumberClient() {
    var me = document.getElementById("mealClient").value;
    var zahtev = new XMLHttpRequest();
    zahtev.open("GET", "MealServlet?meal_id=" + me, true);
    zahtev.send(null);
    console.log("poslali zahtev");

    zahtev.onreadystatechange =
            function ()
            {
                if (zahtev.readyState == 4) {
                    var niz = zahtev.responseText;
                    var obj = JSON.parse(niz);
                    document.getElementById("mealPriceClient").innerHTML = "FOOD PRICE: " + obj.price + " euros";
                    document.getElementById("mealPriceClientInput").value = obj.price;
                }
            };
}