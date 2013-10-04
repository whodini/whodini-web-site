require [
    'jquery'
    'underscore'
    'ghosttype'
], ($, _) ->

  $ ->
    console.log 'js for all pages'

    $('.close').click (event) ->
      event.preventDefault()
      $(event.target).parent().hide('fast')

    $('#nav-toggle').on 'click', (event) ->
      event.preventDefault()
      if $('.site-nav').find('li').css('display') is 'inline-block'
      else
        $('.site-nav').toggle()



