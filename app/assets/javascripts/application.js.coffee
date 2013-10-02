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

        activatePoints: ->
          console.log 'activatePoints'
          $("#points").addClass('active')

        deactivatePoints: ->
          console.log 'deactivatePoints'
          $("#points").removeClass('active')

    whodini.initialize()


