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
    , 1000

    setTimeout ->
      $("#searchField").focus().val('').teletype
        animDelay: 50
        text: "marketing"
    ,5000

    setTimeout ->
      $("#searchField").focus().val('').teletype
        animDelay: 50
        text: "engineering"
    ,10000

    setTimeout ->
      #show and activate the first result set
      $('#scoreTags.one').addClass('active')
    ,2000

    setTimeout ->
      #show and activate the second result set
      $('#scoreTags.one').hide()
      $('#scoreTags.two').addClass('active')
    ,6000

    setTimeout ->
      #show and activate the third result set
      $('#scoreTags.two').hide()
      $('#scoreTags.three').addClass('active')
    ,11000