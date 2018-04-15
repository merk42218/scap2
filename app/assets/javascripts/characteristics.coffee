@del_part_of_characteristic_body_f = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
  false

@del_part_of_characteristic_f = ->
  $('a.remove_part_of_characteristic').on 'click', ->
      window.del_part_of_characteristic_body_f($(this))
    false
  false
@cparse = ->
  $('#cparse').on 'click', ->
    true
  $('.dontgo').on 'click', ->
    false


@add_part_of_characteristic_f = ->
  $('#add_part_of_characteristic_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_part_of_characteristic", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    console.log(panel)
    panel.find('a.remove_part_of_characteristic').on 'click', ->
      window.del_part_of_characteristic_body_f($(this))
      false
    false
# НОВЫЙ АДРЕС ИЛИ ВЫБОР ИЗ СУЩЕСТВУЮЩИХ!!!!!!!!!!!!!!!
@add_or_remove_fields_for_address = ->
  elem= $('#characteristic_address_new2')
  elem2 = $('#characteristic_address_select2')
  elem.find('select').attr('disabled', 'disabled')
  elem2.find('input').removeAttr("disabled")
  elem.toggle()
  elem2.toggle()
  $('#characteristic_add_new_address').on 'click', ->
    $('#characteristic_address_select').css("display","none")
    $('#characteristic_address_new').css("display","block")
    elem2.find('select').attr('disabled', 'disabled')
    elem.find('input').removeAttr("disabled")

  $('#characteristic_add_select_address').on 'click', ->
    elem2.find('select').removeAttr("disabled")
    elem.find('input').attr('disabled', 'disabled')
    $('#characteristic_address_select').css("display","block")
    $('#characteristic_address_new').css("display","none")
  false

@part_of_characteristics_ready_f = ->
  window.add_part_of_characteristic_f()
  window.del_part_of_characteristic_f()
  window.cparse()
  window.add_or_remove_fields_for_address()
$(document).on 'turbolinks:load', window.part_of_characteristics_ready_f
