console.log("haha");
const dueDateFun = () =>{
  let borrowDate = document.getElementById("borrow-date");
  let dueDate = document.getElementById("due-date");
  let dueDateLable = document.getElementById("dueDateLable");

  let borrow = new Date(borrowDate.value);
  let date = new Date();
  date.setDate(borrow.getDate()+7);
  dueDate.value = date.toLocaleDateString();

  if(dueDateLable.style.display == "none"){
    dueDateLable.style.display ="block"
  }
};





