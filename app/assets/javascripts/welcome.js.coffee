require [
    'jquery'
    'underscore'
    # 'waypoints'
    # 'waypoints-sticky'
], ($, _) ->

  $ ->
    setTimeout ->
      $("#searchField").focus().teletype
        animDelay: 50 # the bigger the number the slower the typing
        text: "project management"
    ,30

    setTimeout ->
      $('#scoreTags li').addClass('active')
    ,1000