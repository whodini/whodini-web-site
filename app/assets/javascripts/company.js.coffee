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
      # siblings is a list, specify which sibling
      teamList = '#' + $(this).siblings('.slider').attr('id') # executiveSlider or advisorsSlider
      # how to replace a call wtih a variable
      direction = 'prev' if $(this).hasClass('lt')
      direction = 'next' if $(this).hasClass('rt')

      activeImg = $(imageGroup + ' li.active')
      activeBio = $(teamList + ' li.active')
      if activeImg.hasClass('first') && $(this).hasClass('lt')
        $(imageGroup + ' li.last').addClass('active')
        $(teamList + ' li.last').addClass('active')
      else if activeImg.hasClass('last') && $(this).hasClass('rt')
        $(imageGroup + ' li.first').addClass('active')
        $(teamList + ' li.first').addClass('active')
      else # call the function by using a string
        activeImg[direction]().addClass('active')
        activeBio[direction]().addClass('active')
      
      activeImg.removeClass('active')
      activeBio.removeClass('active')