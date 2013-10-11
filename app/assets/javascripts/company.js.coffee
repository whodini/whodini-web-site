require [
    'jquery'
    'underscore'
], ($, _) ->

  $ ->
    console.log 'Init company js'
    console.log "Function : initSliders"

    $sliders = $(".slider")
    $.each $sliders, ( i, v ) ->
      $(v).find('li').first().addClass("active").show()

    $('#executiveTeam a.exec').click (event) ->
      event.preventDefault()
      $('#executiveTeam li, #executiveSlider li').removeClass('active')
      $($(event.target).closest('a').attr('href')).addClass('active')
      $(event.target).closest('li').addClass('active')

    $('#advisors a.exec').click (event) ->
      event.preventDefault()
      $('#advisors li, #advisorsSlider li').removeClass('active')
      $($(event.target).closest('a').attr('href')).addClass('active')
      $(event.target).closest('li').addClass('active')