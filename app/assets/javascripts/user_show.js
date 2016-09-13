$(document).on('turbolinks:load', function () {
  attachListeners();
})

function attachListeners() {
  $("#ceus").on("click", function () {
    getCeus();
  });
  $("users").on("click", function () {
    getUsers();
  });
}
