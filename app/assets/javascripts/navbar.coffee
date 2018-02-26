# function myFunction() {
#     var x = document.getElementById("myTopnav");
#     if (x.className === "topnav") {
#         x.className += " responsive";
#     } else {
#         x.className = "topnav";
#     }
@ready = ->
  $('.active-link').on 'click', ->
    false
  $('#button_nav').on 'click', ->
    topnav = $("#myTopnav")
    # alert ('jQuery подключен и отлично работает!')
    if (topnav.attr("class")==('topnav'))
       topnav.addClass('responsive')
    else
       topnav.removeClass()
       topnav.addClass('topnav')
    false
  false
# $(document).ready ready
# $(document).on 'page:load', ready
$(document).on 'turbolinks:load', @ready
