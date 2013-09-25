require [
    'jquery'
    'underscore'
    'jquery-spin'
    'welcome'
], ($, ConfigManager) ->

  # Start up the app once the DOM is ready
  $ ->
    console.log 'the web app is ready'

    whodini =
        initialize: ->
            console.log 'init Whodini'
            # pointsPosition = $("#points").position().top-400
            # $(document).scroll ->
            #     whodini.activatePoints()  if $(@).scrollTop() >= pointsPosition
            #     whodini.deactivatePoints()  if $(@).scrollTop() <= pointsPosition
            # $('.main-nav > li a').on('click', (event) ->
            #   event.preventDefault() if $(event.target).parent().find('ul').length > 0
            #   console.log $(event.target).parent().find('ul').toggle()
            # )
            $('#nav-toggle').on('click', (event) ->
              event.preventDefault()

              if $('.site-nav').find('li').css('display') is 'inline-block'
                # dont show/hide the site-nav
              else
                $('.site-nav').toggle()

              $('.team-nav').toggle()
              # if $('.team-nav').is(":visible")
              #   $('.team-nav, .site-nav').hide()
              # else
              #   $('.team-nav, .site-nav').show()

              # if $('.site-nav').is(":visible")
              #   $('.site-nav').hide()
              # else
              #   $('.site-nav').show()

            )

        activatePoints: ->
          console.log 'activatePoints'
          $("#points").addClass('active')

        deactivatePoints: ->
          console.log 'deactivatePoints'
          $("#points").removeClass('active')

    whodini.initialize()


