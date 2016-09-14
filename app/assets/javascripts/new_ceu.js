$(document).on('turbolinks:load', function() {
  $('#show').hide();
  submitForm();
})

function submitForm(){
  $('#new_ceu').submit(function(event){
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/ceus', values);
    posting.done(function(data){
      var newCeu = new Ceu(data["title"], data["date"], data["location"], data["duration"], data["certificate"], data["id"]);
      $('#show').show();
      $('#ceuDetails').text("CEU Details");
      newCeu.createHTML();
    })
  })
};

function Ceu(title, date, location, duration, certificate, id){
  this.title = title;
  this.date = date;
  this.location = location;
  this.duration = duration;
  this.certificate = certificate;
  this.id = id;
}

Ceu.prototype.createHTML = function(){
    $('#ceuTitle').text("Title: " + this.title);
    $('#ceuDate').text("Date: " + this.date);
    $('#ceuLocation').text("Location: " + this.location);
    $('#ceuDuration').text("Duration: " + this.duration + " minutes");
    $('#ceuCertificate').text("Certificate: " + this.certificate);
  }
