function applyLink(event) {
  event.preventDefault();

  var firstToday = document.querySelectorAll(".match.today-ish")[0];
  if(firstToday) {
    firstToday.scrollIntoView();
    window.scrollBy(0, -10);
  }
  else {
    window.scrollTo(0, 0);
  }
}

document.addEventListener("DOMContentLoaded", function(event) {
  var todayLink = document.querySelector("a.today");

  todayLink.addEventListener("click", applyLink);
});