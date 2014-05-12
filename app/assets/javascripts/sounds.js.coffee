registerSounds = ->
  $('.sound-wrap').each ->
    resource = gapi.hangout.av.effects.createAudioResource($(@).data('url'))
    sound = resource.createSound(
      loop: false
      localOnly: false
    )

    $(@).click (e) ->
      gapi.hangout.av.setMicrophoneMute(muted: true)
      sound.play()
      gapi.hangout.av.setMicrophoneMute(muted: false)

init = ->
  gapi.hangout.onApiReady.add (eventObj) ->
    registerSounds()
    $('#soundboardify').css('visibility', 'visible')

gadgets.util.registerOnLoadHandler init