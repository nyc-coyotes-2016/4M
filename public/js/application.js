
$(document).ready(function() {
  $('.question-section').on('submit','form', function(event){
    event.preventDefault();
    alert('gj miles')
    debugger;
    var route = $(this).attr('action')

    $.ajax({
      url: route
      method: 'post'
      data: $(this).find'(name').serialize()
    }).done(function(response)){
    $('.comment-selection').append(response)
  }
  })


});
