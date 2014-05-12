registerSounds = ->
  $('.sound-wrap').each ->
    resource = gapi.hangout.av.effects.createAudioResource($(@).data('url'))
    sound = resource.createSound(
      loop: false
      global: true
    )

    $(@).click (e) ->
      if 
      sound.play()

init = ->
  gapi.hangout.onApiReady.add (eventObj) ->
    registerSounds()
    $('#soundboardify').css('visibility', 'visible')

gadgets.util.registerOnLoadHandler init