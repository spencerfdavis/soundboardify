registerSounds = ->
  $('.sound-wrap').each ->
    resource = gapi.hangout.av.effects.createAudioResource($(@).data('url'))
    sound = resource.createSound(
      loop: false
      localOnly: false
      volume: 1
    )

    $(@).click (e) ->
      sound.play()

init = ->
  gapi.hangout.onApiReady.add (eventObj) ->
    registerSounds()
    $('#soundboardify').css('visibility', 'visible')

gadgets.util.registerOnLoadHandler init