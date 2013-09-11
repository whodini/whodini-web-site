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
            pointsPosition = $("#points").position().top-400
            $(document).scroll ->
                whodini.activatePoints()  if $(@).scrollTop() >= pointsPosition
                whodini.deactivatePoints()  if $(@).scrollTop() <= pointsPosition

        activatePoints: ->
          console.log 'activatePoints'
          $("#points").addClass('active')

        deactivatePoints: ->
          console.log 'deactivatePoints'
          $("#points").removeClass('active')

    whodini.initialize()


