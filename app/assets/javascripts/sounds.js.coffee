registerSounds = ->
  $('.sound-wrap').each ->
    resource = gapi.hangout.av.effects.createAudioResource($(@).data('url'))
    audio = document.createElement("audio")
    duration = 5000
    audio.ondurationchange = (event) ->
      duration = event.target.duration * 1000

    audio.src = resource.getUrl()
    audio.play()
    setTimeout ->
      audio.pause()
    , 1

    sound = resource.createSound(
      loop: false
      localOnly: false
      volume: 1
    )

    $(@).click (e) ->
      console.log "Timing out to duration", duration
      gapi.hangout.av.setMicrophoneMute(true)
      sound.play()
      setTimeout ->
        gapi.hangout.av.setMicrophoneMute(false)
      , duration

init = ->
  gapi.hangout.onApiReady.add (eventObj) ->
    registerSounds()
    $('#soundboardify').css('visibility', 'visible')

gadgets.util.registerOnLoadHandler init