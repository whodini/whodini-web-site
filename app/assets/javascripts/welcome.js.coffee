require [
    'jquery'
    'underscore'
    # 'waypoints'
    # 'waypoints-sticky'
], ($, _) ->

  $ ->
    $("a[href='#why']").click (event) ->
      event.preventDefault()
      id = $(event.target).attr('href')
      $("html, body").animate
        scrollTop: $(id).offset().top - 70
      , 500