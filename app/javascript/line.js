const privacyPolicyCheck = () => {
  document.querySelectorAll("[id^='omniauth-button-']").forEach(function(button) {
    button.addEventListener("click", function(event) {
      if (!document.getElementById("privacy_policy").checked) {
        event.preventDefault();
        alert("プライバシーポリシーに同意してください。");
      }
    });
  });
};

window.addEventListener("turbo:load", privacyPolicyCheck);
window.addEventListener("turbo:render", privacyPolicyCheck);