# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@del_characteristic_body_f = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
  false
false

@del_characteristic_f = ->
  $('a.remove_characteristic').on 'click', ->
      window.del_characteristic_body_f($(this))
    false
  false


@load_from_json_body_f = (link)->
  obj = $(link).parent().parent().find("[id$='address_id']");
  val = obj.val()
  url = $(link).data('url')
  oid = obj.attr('id')
  $.post(url, { address_id: val, oid: oid })
  false


@load_from_json_f = ->
  $(".parse a").on 'click', ->
    window.load_from_json_body_f($(this))
    false
  false


@add_characteristic_f = ->
  $('#add_characteristic_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_characteristic", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $('#submit_row').after(content)
    panel = $('#submit_row').parent().find('.panel-info').first()

    panel.find('a.remove_characteristic').on 'click', ->
      window.del_characteristic_body_f($(this))

    panel.find(".parse a").on 'click', ->
      window.load_from_json_body_f($(this))
      false
    false

@characteristics_ready_f = ->
  window.add_characteristic_f()
  window.del_characteristic_f()
  window.load_from_json_f()


$(document).on 'turbolinks:load', window.characteristics_ready_f
