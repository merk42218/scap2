@forms = ->

  $(".text_field").on 'keydown', ->
    e = ($(this)).find(":first-child").first().val()
    b = ($(this)).parent().find(".label_field").first()
    if (e.length == 0)
      b.css("display", "none")
    else
      b.css("display", "block")

    # alert(e.length)
  $.each $(".text_field"), (i) ->
    e = ($(this)).find(":first-child").first().val()
    b = ($(this)).parent().find(".label_field").first()
    if (e.length > 0)
      b.css("display", "block")
    # alert(e.length)





$(document).on 'turbolinks:load', window.forms
