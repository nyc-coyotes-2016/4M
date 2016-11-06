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
    $('.comment-list').prepend("<li>" + response.body + "</li><hr>");
  });
});

  $(document).on('submit','.answer', function(event){
    event.preventDefault();
    var answerRoute = $(this).attr('action');
    var answerData = $(this).serialize();
  $.ajax({
    url: answerRoute,
    method: 'post',
    data: answerData
  }).done(function(response){
        debugger;
    $('.answer-section').append("<div class= container>"+response.body+"</div>");
  });
  });

  $(document).on('click', ".arrow-up", function(event){
    alert(location);
    var vote = $(this).serialize();
    $.ajax({
      url: "/votes/new",
      method: "post",
      data: vote
    })
    .done(function(response){
      $("article#"+response["id"]).remove();
    });
  });

});
