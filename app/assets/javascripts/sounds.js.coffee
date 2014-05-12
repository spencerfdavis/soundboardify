registerSounds = ->
  $('.sound-wrap').each ->
    resource = gapi.hangout.av.effects.createAudioResource($(@).data('url'))
    sound = resource.createSound(
      loop: false
      localOnly: false
      volume: 1
    )

    $(@).click (e) ->
      gapi.hangout.av.setMicrophoneMute(muted: true)
      sound.play()
      setTimeout(-> gapi.hangout.av.setMicrophoneMute(muted: false), 5000)

init = ->
  gapi.hangout.onApiReady.add (eventObj) ->
    registerSounds()
    $('#soundboardify').css('visibility', 'visible')

gadgets.util.registerOnLoadHandler init