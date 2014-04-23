#= require active_admin/base

jQuery ->
  $('.myclass tbody').sortable()
  axis: 'y'
  handle: '.handle'
  update: ->
    $.post($(this).data('update-url'), $(this).sortable('serialize'))

