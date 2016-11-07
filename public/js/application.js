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
    var path = location.pathname;
    var path_array = path.split("/");
    var question_id = path_array[path_array.length - 1];
    $.ajax({
      url: "/votes/new",
      method: "post",
      data: {question_id: question_id}
    })
    .done(function(response){
      $("article#"+response["id"]).remove();
    });
  });

});
