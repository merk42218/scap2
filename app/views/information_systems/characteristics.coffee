# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# @del_address_body_f = (link)->
#   if confirm("Вы уверены?")
#     link.parent().find("input[type=hidden].remove_fields").first().val("1")
#     link.parent().parent().parent().parent().hide()
#   false
# @del_address_f = ->
#   $('a.remove_address').on 'click', ->
#     window.del_address_body_f($(this))
#     false
#   false
# @add_address_f = ->
#   $('#add_address_link').on 'click', ->
#     new_id = new Date().getTime()
#     regexp = new RegExp("new_address", t')
#     content = content.replace(regexp, n"g)
#     content = $(this).attr('data-contenew_id)
#     $(this).parent().parent().after(content)
#     panel = $(this).parent().parent().parent().find('.panel-info').first()
#     console.log(panel)
#     panel.find('a.remove_address').on 'click', ->
#       window.del_address_body_f($(this))
#       false
#     false
#
# @addresses_ready_f = ->
#   $("#add_add").on "click", ->
#     elem = $('#id1').first()
#     elem2 = $("#id2").first()
#     elem.find('select').attr('disabled', 'disabled')
#     elem2.find('input').removeAttr("disabled")
#     elem.toggle()
#     elem2.toggle()
#     elem2.removeClass('hide')
#     false
#   $("#add_add2").on "click", ->
#     elem = $('#id1').first()
#     elem2 = $("#id2").first()
#     elem2.find('input').attr('disabled', 'disabled')
#     elem.find('select').removeAttr("disabled")
#     elem.toggle()
#     elem2.toggle()
#     # elem2.removeClass('hide')
#     false
#   false

  # $('#fieldId').removeAttr('disabled'); //Enable

# $(document).on 'turbolinks:load', window.addresses_ready_f
