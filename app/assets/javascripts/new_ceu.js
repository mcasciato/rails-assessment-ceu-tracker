$(document).on('turbolinks:load', function() {
  $('#show').hide();
  submitForm();
})

function submitForm() {
  $('#new_ceu').submit(function(event){
    event.preventDefault();
    var values = $(this).serialize();
    var submitting = $.post('/ceus', values);
    submitting.done(function(data){
      var newCeu = new Ceu(data["title"], data["date"], data["location"], data["duration"], data["id"]);
      $('#show').show();
      $('#ceuDetails').text("CEU Details");
      newCeu.createHTML();
    })
  })
};

function Ceu(title, date, location, duration, id) {
  this.title = title;
  this.date = date;
  this.location = location;
  this.duration = duration;
  this.id = id;
}
