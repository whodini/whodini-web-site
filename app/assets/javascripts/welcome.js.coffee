require [
    'jquery'
    'underscore'
    # 'waypoints'
    # 'waypoints-sticky'
], ($, _) ->

  $ ->
    welcome =
      loopAnimation: ->
        console.log 'loop animation'
        setTimeout ->
          $("#searchField").focus().val('').teletype
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
          $('#scoreTags.three').removeClass('active')
        ,1000

        setTimeout ->
          $('#scoreTags.one').addClass('active')
        ,2000

        setTimeout ->
          #show and activate the second result set
          $('#scoreTags.one').removeClass('active')
        ,5500

        setTimeout ->
          $('#scoreTags.two').addClass('active')
        ,6000

        setTimeout ->
          #show and activate the third result set
          $('#scoreTags.two').removeClass('active')
        ,10700
        setTimeout ->
          $('#scoreTags.three').addClass('active')
        ,11000

    welcome.loopAnimation()
    setInterval(welcome.loopAnimation, 15000)