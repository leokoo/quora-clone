$(document).ready(function() {
  $(".up").on('submit', function(event) {
  	event.preventDefault();
  	question_id = $(this).data("id")
 		alert("lala");
  	$.ajax({
  		method: "POST",
  		url: $(this).attr("action"),
  	}).done(function(response){
  		$("#vote-result-" + question_id).append(response)
  	});
});
});