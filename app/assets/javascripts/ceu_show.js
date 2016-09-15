$(function() {
  $(".js-next").on("click", function(e){
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/ceus/" + nextId + ".json", function(data) {
      $(".ceuTitle").text(data["title"]);

      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
