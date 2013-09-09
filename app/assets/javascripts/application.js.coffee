require [
    'jquery'
    'config_manager'
    'underscore'
    'jquery-spin'
    'welcome'
], ($, ConfigManager) ->

  # Start up the app once the DOM is ready
  $ ->
    console.log 'the web app is ready'

    whodini =
        initialize: ->
            $('#popup')
                .attr('href', ConfigManager.getAuthUrl())
                .on "click", (event) =>
                    @popupCenter(event)

            $('.sections a').click(->
              console.log 'click'
              sectionId = $(this).attr('href')
              $('body').animate({scrollTop: $(sectionId).offset().top}, 'fast')
            )

        popupCenter: (e) ->
            console.log 'popup center'
            e.preventDefault()
            url = $(e.target).attr('href')
            width = 500
            height = 350
            left = (screen.width/2)-(width/2)
            top = (screen.height/2)-(height/2)
            popup = window.open url, "whodinipopup", "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top

        childClosed:  (params)  ->
            console.log 'and the childClosed method was called'

        callbackHandler: ->
          console.log 'Inside callbackHandler'
          oauthParams = {}

          # Get the hashed portion of the query string
          queryString = location.hash.substring(1)

          # Regex for parsing query string params
          regex = /([^&=]+)=([^&]*)/g
          match = undefined

          # Iterate over all the query params
          oauthParams[decodeURIComponent(match[1])] = decodeURIComponent(match[2])  while match = regex.exec(queryString)

          if(window.opener)
            window.opener.localStorage.at = oauthParams.access_token
            window.opener.localStorage.uid = oauthParams.userid
            window.opener.loginComplete()
            window.close()
          else
            console.error "Critical!!!Could not find the parent window."

    whodini.initialize()


