
$(document).ready(function() {
  $(document).on('submit','.comment', function(event){
    event.preventDefault();
    var route = $(this).attr('action');
    var fieldData = $(this).serialize();
  $.ajax({
    url: route,
    method: 'post',
    data: fieldData
  }).done(function(response){
    //var comment = " ";
    // debugger;
    $('.comment-list').append("<li>" + response.body + "</li><hr>");
  });
});
});
