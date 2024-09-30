const inputValue = document.getElementById("userId"); /* Form books/index.html.erb */
const deleteFunc = (parameter) =>{
  let modalContainer= document.getElementById("modal_container");
  console.log(parameter);
  inputValue.value=parameter;
  modalContainer.classList.add("show");

};




const closeModalBox =function(){
  let modalContainer= document.getElementById("modal_container");
  const close = document.getElementById("closeModalBox");
  close.addEventListener("click",()=>{
  modalContainer.classList.remove("show");
  });
}
