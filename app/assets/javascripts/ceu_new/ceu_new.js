$(function() {
  $('#show').hide();
  submitForm();

  // create CEU form
  function submitForm() {
    $('#new_ceu').submit(function(event){
      event.preventDefault();
      var values = $(this).serialize();
      $.ajax({
        type: 'post',
        url: this.action,
        data: values,
        dataType: 'json',
        success: function (data) {
          var newCeu = new Ceu (data["title"], data["date"], data["location"], data["duration"], data["certificate"], data["id"]);
          $('#show').show();
          $('#ceuDetails').text("You successfully entered your CEU!");
          newCeu.createHTML();
          $('#ceuInfo').show();
        },
        error: function () {
          $('#show').show();
          $('#ceuDetails').text('You must fill in all fields.');
          $('#ceuInfo').hide();
        }
      })
      this.reset();
    })
  };

  function Ceu(title, date, location, duration, certificate, id) {
    this.title = title;
    this.date = date,
    this.location = location;
    this.duration = duration;
    this.certificate = certificate;
    this.id = id;
  }

  Ceu.prototype.createHTML = function() {
    $('#ceuTitle').text("Title: " + this.title);
    $('#ceuDate').text("Date: " + this.date);
    $('#ceuLocation').text("Location: " + this.location);
    $('#ceuDuration').text("Duration: " + this.duration + " minutes");
    $('#ceuCertificate').text("Certificate: " + this.certificate);
  };

  // success and error callbacks in separate functions?

  // function ceuSuccess() {
  //
  // };
  //
  // function ceuError() {
  //
  // }

});
