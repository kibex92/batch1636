// TODO - Fetch an activity with the Bored API - Let's psuedocode!
const url = "https://www.boredapi.com/api/activity/";

// btn.addEventListener("click", (event) => {
//   // Create an array of activities
//   const activities = ["Dancing", "Singing", "Playing"];
//   // Define a random index
//   const index = Math.floor(Math.random() * 3);
//   // Find an activity at this index
//   const activity = activities[index];
//   event.currentTarget.innerText = activity;
// });
// // Change Btn text

// Select the header
const header = document.getElementById("activity");
// Select the btn from the DOM
const btn = document.querySelector(".btn-warning");
// add event listener to btn -> Click
btn.addEventListener("click", () => {
  // Get the info from the API
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      // data.activity || data["activity"]
      const activity = data.activity;
      header.innerText = activity;
    });
});
// Change header text to activity
