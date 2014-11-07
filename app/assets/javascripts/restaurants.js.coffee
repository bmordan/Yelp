# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  jQuery ->

    $('main').hide()

    setTimeout ->
      $('main').show('fast')
    ,200