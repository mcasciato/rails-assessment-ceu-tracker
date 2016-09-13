$(document).on('turbolinks:load', function() {
  $('#show').hide();
  submitForm();
})

function submitForm() {
  $('#new_ceu').submit(function(event){
    event.preventDefault();
    var values = $(this).serialize();
    var submitting = $.post('/ceus', values);
    
  })
}
