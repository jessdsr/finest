// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initFlatpickr } from "./plugins/flatpickr";


// Search bar
const clearInput = () => {
  const input = document.getElementsByTagName("input")[0];
  input.value = "";
}

const clearBtn = document.getElementById("clear-btn");
clearBtn.addEventListener("click", clearInput);
//



document.addEventListener("turbo:load", () => {
  console.log("turbo!");
  initFlatpickr();

  document.querySelector(".show-login-btn").addEventListener("click",function(){

    document.querySelector(".login-box").classList.toggle("showed");
  });
  document.querySelector(".hide-login-btn").addEventListener("click",function(){
    document.querySelector(".login-box").classList.toggle("showed");
  });
});
