function validRegistrationEmailFunction() {
    var check = document.getElementById("email").value;
    if (check.includes("@") && check.substring(check.lastIndexOf("@"), check.length).includes(".")) {
        document.getElementById("not_valid").innerHTML = "<p style='color:#66ff33;'>Username is valid!</p>";
        document.getElementById("submit").innerHTML = "<input class='input_submit'  type='submit' name='submit' value='REGISTER'>";
    } else {
        document.getElementById("not_valid").innerHTML = "<p style='color:red;'>Username is NOT valid!</p>";
        document.getElementById("submit").innerHTML = "<input class='input_submit'  type='submit' name='submit' value='REGISTER' disabled>";
    }
}

function validateFieldsRegistrationForm() {
  var a = document.forms["myForm"]["firstname"].value;
  var b = document.forms["myForm"]["lastname"].value;
  var c = document.forms["myForm"]["email"].value;
  var d = document.forms["myForm"]["username"].value;
  var e = document.forms["myForm"]["password"].value;
  if (a === "" || b === "" || c === "" || d === "" || e === "") {
    alert("All fields must be filled out");
    return false;
  }
} 

function validateFieldsLoginForm() {
  var a = document.forms["myForm"]["username"].value;
  var b = document.forms["myForm"]["password"].value;
  if (a === "" || b === "") {
    alert("All fields must be filled out");
    return false;
  }
} 

function validateFieldsReservationQueryClientForm() {
  var a = document.forms["myForm"]["activity_id"].value;
  var b = document.forms["myForm"]["meal_id"].value;
  var c = document.forms["myForm"]["firstname"].value;
  var d = document.forms["myForm"]["lastname"].value;
  var e = document.forms["myForm"]["age"].value;
  var f = document.forms["myForm"]["city"].value;
  var g = document.forms["myForm"]["street"].value;
  var h = document.forms["myForm"]["house_n"].value;
  var i = document.forms["myForm"]["phone"].value;
  var j = document.forms["myForm"]["passport"].value;
  var k = document.forms["myForm"]["activityPriceClientInput"].value;
  var l = document.forms["myForm"]["mealPriceClientInput"].value;
  if (a === "" || b === "" || c === "" || d === "" || e === "" || f === "" || g === "" || h === "" || i === "" || j === "" || k === "" || l === "") {
    alert("All fields must be filled out");
    return false;
  }
} 

function validateFieldsNewsletterForm() {
  var a = document.forms["myForm"]["email_newsletter"].value;

  if (a === "") {
    alert("Please write your email");
    return false;
  }
} 
