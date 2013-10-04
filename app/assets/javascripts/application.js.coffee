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
            @initSlider()
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

        initSlider: ->
          console.log 'slider initted'
          slides = ->
            $slider.find $slide

          $slider = $(".slider")
          $slide = 'li'
          $transition_time = 1000
          $time_between_slides = 4000
          # slides().fadeOut()

          slides().first().addClass("active").show()

          # auto scroll
          # $interval = setInterval(->
          #   $i = $slider.find($slide + ".active").index()
          #   slides().eq($i).removeClass "active"
          #   slides().eq($i).fadeOut $transition_time
          #   $i = -1  if slides().length is $i + 1 # loop to start
          #   slides().eq($i + 1).fadeIn $transition_time
          #   slides().eq($i + 1).addClass "active"
          # , $transition_time + $time_between_slides)

          $('.executiveTeam a').click( (event) ->
            event.preventDefault()
            $('.executiveTeam li').removeClass('active')
            slides().removeClass('active')

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


