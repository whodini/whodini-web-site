require [
    'jquery'
    'underscore'
    'jquery-spin'
    'welcome'
    'ghosttype'
    'waypoints'
], ($, ConfigManager) ->

  # Start up the app once the DOM is ready
  $ ->
    console.log 'the web app is ready'

    whodini =
        initialize: ->
            console.log 'init Whodini'
            @initSliders()
            # $(".thing").waypoint (direction) ->
            #   alert "Top of thing hit top of viewport."

            $('.close').click( (event) ->
              event.preventDefault()
              $(event.target).parent().hide('fast')
            )

            setTimeout ->
              $("#searchField").focus().teletype
                animDelay: 50 # the bigger the number the slower the typing
                text: "project management"
            ,30

            setTimeout ->
              $('#scoreTags li').addClass('active')
            ,1000

            $('#nav-toggle').on('click', (event) ->
              event.preventDefault()

              if $('.site-nav').find('li').css('display') is 'inline-block'

              else
                $('.site-nav').toggle()
            )

        initSliders: ->
          $sliders = $(".slider")
          $.each $sliders, ( i, v ) ->
            $(v).find('li').first().addClass("active").show()

          $('.executiveTeam a').click( (event) ->
            event.preventDefault()
            $('.executiveTeam li').removeClass('active')
            $sliders.find('li').removeClass('active')
            href = $(event.target).closest('a').attr('href')
            $(href).addClass('active')
            $(event.target).closest('li').addClass('active')
          )

        activatePoints: ->
          console.log 'activatePoints'
          $("#points").addClass('active')

        deactivatePoints: ->
          console.log 'deactivatePoints'
          $("#points").removeClass('active')

    whodini.initialize()


