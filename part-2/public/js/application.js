$(document).ready(function() {
 $("#new-poem-form").on("submit", function(event){
  event.preventDefault();
  var $newPoemForm = $(this);

  var url = $newPoemForm.attr("action");
  var method = $newPoemForm.attr("method");
  var data = $newPoemForm.serialize();
  $newPoemForm.siblings(".errors").remove();
  $.ajax({
    url: url,
    method: method,
    data: data
  }).done(function(response){
    $newPoemForm.trigger("reset")
    $("#poem-list").prepend(response)
  }).fail(function(failure){
    $newPoemForm.before(failure.responseText);
  });
 });

 $("#poem-list").on("click", ".applaud-button", function(event){
  event.preventDefault();
  var $applaudButton = $(this);

  var url = $applaudButton.attr("action");
  var method = $applaudButton.find("input[type='hidden']").attr("value");
  $.ajax({
    url: url,
    method: method
  }).done(function(response){
    console.log(response)
    $applaudButton.closest("article.poem").find(".applause-count").replaceWith(response)
  })
 });
});
