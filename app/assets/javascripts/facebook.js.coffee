jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true

  app = $('[data-fb-app-id]').val()

window.fbAsyncInit = ->
  #FB.init(appId: '588832501224049', cookie: true) # Nordics producstion
  FB.init(appId: app, cookie: true) # Nordics test

  $('#sign_in').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true