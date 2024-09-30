console.log("hlwl");

const customInputPhoneNumber = document.getElementById("phoneNumber");
const customInputRollNumber = document.getElementById("roleNo");
const customInputRollNumberForLoginPage= document.getElementsByClassName("role");


// const deleteBtn = document.getElementById("deleteBtn");
// deleteBtn.addEventListener("click", (e) =>{
//   console.log("click btn");
// });

customInputRollNumber.addEventListener("focus",(e) =>  {
  e.target.value = "CMM_";
});



customInputPhoneNumber.addEventListener("keypress",(e) =>{
  if(e.target.value.length == 3 || e.target.value.length == 8 ){
    e.target.value += "-";
  }
});

function myFunction(e){
  let imgTextField = document.getElementById("textImg")

  const file = e.target.files;
  const filename = file[0].name;
  imgTextField.value = filename;
};

customInputRollNumberForLoginPage.addEventListener("focus",(e)=>{
  e.target.value = "CMM_";
});


