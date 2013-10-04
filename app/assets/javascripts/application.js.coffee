require [
    'jquery'
    'underscore'
    'ghosttype'
], ($, _) ->

  $ ->
    console.log 'the DOM is ready'

    $('.close').click (event) ->
      event.preventDefault()
      $(event.target).parent().hide('fast')

    setTimeout ->
      $("#searchField").focus().teletype
        animDelay: 50 # the bigger the number the slower the typing
        text: "project management"
    ,30

    setTimeout ->
      $('#scoreTags li').addClass('active')
    ,1000

    $('#nav-toggle').on 'click', (event) ->
      event.preventDefault()
      if $('.site-nav').find('li').css('display') is 'inline-block'
      else
        $('.site-nav').toggle()



