function showLogin() {
  document.getElementById("login-tab").classList.add("active-tab");
  document.getElementById("register-tab").classList.remove("active-tab");
  document.getElementById("login-section").classList.add("active-section");
  document
    .getElementById("register-section")
    .classList.remove("active-section");
}

function showRegister() {
  document.getElementById("register-tab").classList.add("active-tab");
  document.getElementById("login-tab").classList.remove("active-tab");
  document.getElementById("register-section").classList.add("active-section");
  document.getElementById("login-section").classList.remove("active-section");
}

document.addEventListener("DOMContentLoaded", function () {
  showLogin();
});