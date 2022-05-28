function post (){
  const takingBtn = document.getElementById("taking_display_btn");
  takingBtn.addEventListener("click", () => {
  const takingDisplay = document.getElementById("taking_display");
    if(takingDisplay.style.display == "block"){
      takingDisplay.style.display = "none";
    }else{
      takingDisplay.style.display = "block";
    };
  });
};

window.addEventListener('load', post);