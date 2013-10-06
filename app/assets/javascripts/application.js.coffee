require [
    'jquery'
    'underscore'
    'ghosttype'
], ($, _) ->

  $ ->
    $('.close').click (event) ->
      event.preventDefault()
      $(event.target).parent().hide('fast')

    $('#nav-toggle').on 'click', (event) ->
      event.preventDefault()

      if $('.site-nav').find('li').css('display') is 'inline-block'
      else
        $('.site-nav').toggle()

    $header = $("#header")
    $clone = $header.before($header.clone().addClass("clone"))
    $(window).on "scroll", ->
      top = $(document).scrollTop()
      $('body').toggleClass "down", (top > 400)



