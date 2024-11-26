

//handling role selection 
const selectRole = document.getElementById("find-role");
const addressField = document.getElementById("address-field");
const agencyField = document.getElementById("agency-field");
const businessNameField = document.getElementById("businessname-field");
const profileField = document.getElementById("profile-field");


//function that handle changing field according to role selection
function changeField() {
  const clickedRole = selectRole.value;

  //hide all the fields first before we handle the role change
  addressField.style.display = "none";
  agencyField.style.display = "none";
  businessNameField.style.display = "none";
  profileField.style.display = "none";
 

  if (clickedRole === "agent") {
    agencyField.style.display = "block";
    profileField.style.display="block"
  } else if (clickedRole === "client") {
    addressField.style.display = "block";
    profileField.style.display="block"

  } else {
    addressField.style.display = "block";
    businessNameField.style.display = "block";
    profileField.style.display="block"
    
    
  }
} //end of the changefield function

//add an event listener to the selectRole.value element
selectRole.addEventListener("change", changeField);


