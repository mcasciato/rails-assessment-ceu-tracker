$(document).on('turbolinks:load', function () {
  attachListeners();
})

function attachListeners() {
  $("#ceus").on("click", function () {
    getCeus();
  });
  $("#users").on("click", function () {
    getUsers();
  });
}

function getCeus() {
  $.getJSON("/users/" + user.id + "/ceus.json", function(data) {
    var list = "<ul>";
    $.each(data, function (index, ceu) {
      list += "<li data-id="+ ceu["id"] + "><a href='/users/" + user.id + "/ceus/" + ceu["id"] + "'>" + ceu["title"] + "</a></li>"
    });
    list += "</ul> <a href='/users/" + user.id + "/ceus/new'> New CEU </a>";
    $("#ceu-list").html(list);
  })
}
