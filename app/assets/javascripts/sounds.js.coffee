registerSounds = ->
  $('.sound-wrap').each ->
    resource = gapi.hangout.av.effects.createAudioResource($(@).data('url'))
    duration = 5000
    calculateDuration(resource).done (dur) ->
      duration = dur

    sound = resource.createSound(
      loop: false
      localOnly: false
    )

    $(@).click (e) ->
      gapi.hangout.av.setMicrophoneMute(true)
      sound.play()
      setTimeout ->
        gapi.hangout.av.setMicrophoneMute(false)
      , duration

calculateDuration = (resource) ->
  deferred = new $.Deferred()
  audio = document.createElement("audio")
  audio.ondurationchange = (event) ->
    deferred.resolve(event.target.duration * 1000)

  audio.src = resource.getUrl()
  audio.play()
  setTimeout ->
    audio.pause()
  , 1
  deferred.promise()

init = ->
  gapi.hangout.onApiReady.add (eventObj) ->
    registerSounds()
    $('#soundboardify').css('visibility', 'visible')

gadgets.util.registerOnLoadHandler init