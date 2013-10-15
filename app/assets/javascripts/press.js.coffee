require [
    'jquery'
    'underscore'
], ($, _) ->

  $ ->
    console.log 'init press js'
    $(".logo-strip a").click (event) ->
      event.preventDefault()
      id = $(event.target).attr('href')
      console.log id
      $("html, body").animate
        scrollTop: $(id).offset().top
      , 500