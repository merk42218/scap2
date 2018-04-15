

@ready = ->
  $('#button_sidebar1').on 'click', ->
      $("#mySidenav").css("width", "0px")
      $("#main").css("left", "0px")
      $("#button_sidebar2").css("display", "inline-block")
      $("#button_sidebar1").css("display", "none")
      $("#main").css("width", "95%")
      # $(".app-name").css("width","200px")

      false

  $('#button_sidebar2').on 'click', ->
      $("#mySidenav").css("width", "250px")
      $("#main").css("left", "250px")
      $("#button_sidebar2").css("display", "none")
      $("#button_sidebar1").css("display", "inline-block")
      $("#main").css("width", "80%")

      # $(".app-name").css("width","250px")

      false





  false

$(document).on 'turbolinks:load', @ready
