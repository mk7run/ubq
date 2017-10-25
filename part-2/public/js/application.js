$(document).ready(function() {
 $("#new-poem-form").on("submit", function(event){
  event.preventDefault();
  var $newPoemForm = $(this);

  var url = $newPoemForm.attr("action");
  var method = $newPoemForm.attr("method");
  var data = $newPoemForm.serialize();

  $.ajax({
    url: url,
    method: method,
    data: data
  }).done(function(response){
    $newPoemForm.trigger("reset")
    $("#poem-list").prepend(response)
  });
 });
});
