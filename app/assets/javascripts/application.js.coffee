require [
    'jquery'
    'underscore'
    'config_manager'
    # 'ghosttype'
], ($, _, ConfigManager) ->

  $ ->
    # load the sign in and sign up links from confiuration manager
    $('a[href="#signin]"').attr('href', ConfigManager.getValue('app_url'))
    $('a[href="#signup]"').attr('href', "#{ConfigManager.getValue('app_url')}fre")
    $('.close').click (event) ->
      event.preventDefault()
      $(event.target).parent().hide('fast')

    $('#nav-toggle').on 'click', (event) ->
      event.preventDefault()

      if $('.site-nav').find('li').css('display') is 'inline-block'
      else
        $('.site-nav').toggle()

    $header = $(".header")
    $('body').append($header.clone().addClass("clone"))
    $(window).on "scroll", ->
      top = $(document).scrollTop()
      $('body').toggleClass "down", (top > 0)



