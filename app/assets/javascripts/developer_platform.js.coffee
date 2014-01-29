require [
    'jquery'
    'underscore'
], ($, _) ->

  $ ->
    $('a[href="#joindevnet"').attr('href', "#{ConfigManager.getValue('devnet_url')}")