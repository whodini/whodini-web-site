define [
  "config"
], (config) ->

  # returns the value of the key based on the environment
  getValue: (key) ->
    env = undefined
    switch window.location.hostname
      when "localhost", "127.0.0.1"
        env = "local"
      when "corp.whodini.com"
        env = "staging"
      when "whodini.com"
        env = "production"
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
