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
      $(v).find('li').first().addClass("first")
      $(v).find('li').last().addClass("last")

    #set active, first, and last in js instead of html
    $selectors = $(".selector")
    $.each $selectors, ( i, v ) ->
      $(v).find('li').first().addClass("active")
      $(v).find('li').first().addClass("first")
      $(v).find('li').last().addClass("last")

    #this code needs to be more generic, should pass which slider group so it doesn't have to be repeated for each independently
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

    #again, make more generic
    $('a.motion').click (event) ->
      event.preventDefault()
      teamSet = $( this ).parent().attr('id'); # slideExec or slideAdvisor
      if teamSet == 'slideExec'
        imageGroup = '#executiveTeam'
      else
        imageGroup = '#advisors'
      teamList = '#' + $(this).siblings().attr('id') if $(this).hasClass('lt') # executiveSlider or advisorsSlider
      # siblings not working for previous? why?
      teamList = '#' + $(this).prev().attr('id') if $(this).hasClass('rt') # executiveSlider or advisorsSlider
      # console.log 'teamList: ' + teamList
      # couldn't get direction to work in else
      # direction = 'prev()' if $(this).hasClass('lt')
      # direction = 'next()' if $(this).hasClass('rt')
      # console.log 'direction: ' + direction


      activeImg = $(imageGroup + ' li.active')
      activeBio = $(teamList + ' li.active')
      if activeImg.hasClass('first') && $(this).hasClass('lt')
        #console.log 'first'
        $(imageGroup + ' li.last').addClass('active')
        $(teamList + ' li.last').addClass('active')
      else if activeImg.hasClass('last') && $(this).hasClass('rt')
        #console.log 'last'
        $(imageGroup + ' li.first').addClass('active')
        $(teamList + ' li.first').addClass('active')
      # else
      #   console.log 'not first'
        # activeImg.direction.addClass('active')
        # activeBio.direction.addClass('active')
      else if $(this).hasClass('lt')
        activeImg.prev().addClass('active')
        activeBio.prev().addClass('active')
      else if $(this).hasClass('rt')
        activeImg.next().addClass('active')
        activeBio.next().addClass('active')
      activeImg.removeClass('active')
      activeBio.removeClass('active')