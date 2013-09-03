define [
  "whodini_main/config"
], (config) ->

  getValue: (key) ->
    env = undefined
    switch window.location.hostname
      when "localhost", "127.0.0.1"
        env = "Local"
      when "ec2-54-215-119-173.us-west-1.compute.amazonaws.com"
        env = "Dev"
      when "staging"
        env = "Staging"
      when "production"
        env = "Production"
      else
        throw ("Unknown environment: " + window.location.hostname)
    value = config[env][key] ? config['defaults'][key]

  getAppBaseUrl: ->
    window.location.protocol + "//" + window.location.hostname + ":" + window.location.port

  getWhodiniClientId: ->
    return @getValue("whodini_client_id")

  getAuthUrl: ->
    return "#{@getValue('auth_endpoint')}&client_id=#{@getWhodiniClientId()}"

  getApiBaseUrl: ->
    return  "#{@getValue('api_baseurl')}/v1"

  getLogoutUrl: ->
    "#{@getAppBaseUrl()}/logout"
