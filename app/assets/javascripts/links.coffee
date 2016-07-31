# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


onReaderLoad = (event) ->
  console.log "eventiffyf"


$('document').ready ->

  $('#shorten_btn').click (event) ->
    out_url =  $('#shorten_url').val()
    if out_url.replace(/\s/g, '').length
      console.log "fine no space"
    else
      console.log "contains space"
  
    return
  return
