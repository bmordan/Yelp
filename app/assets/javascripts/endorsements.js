$(document).ready(function() {

  $('main ul li ul li p a .fa-thumbs-o-up').on('click', function(event){
      
    event.preventDefault();
    var href = $(this).parent().get(0).href
    var count = $(this).parent().prevUntil('p').get(1)

    $.post(href, function(response){
      result = response.new_endorsement_count
      console.log(count)
      $(count).text(response.new_endorsement_count)
    })
  })
})