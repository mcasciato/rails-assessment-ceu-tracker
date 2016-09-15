$(document).on('turbolinks:load', function() {
  attachListeners();
})

function attachListeners() {
  $('#ceus').on('click', function() {
    getCeus();
  })
}

function getCeus() {
  $.getJSON("/ceus.json", function(data) {
    var list = "<div class='card-block'>";
    $.each(data, function(index, ceu){
      list += "<p data-id=" + ceu["id"] + "><a href='/ceus/" + ceu["id"] + "'>" + ceu["title"] + "</a></p>"
    });
      list += "</div> <a href='/ceus/new'>New CEU</a>";
  })
}
