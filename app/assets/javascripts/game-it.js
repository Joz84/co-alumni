document.addEventListener("DOMContentLoaded",function(){

  function addPulse(element) {
    element.className.add("pulse");
  }

  var badges = document.querySelectorAll('.badge');

  badges.forEach(badge => badge.addEventListener("mouseover", addPulse))
});
