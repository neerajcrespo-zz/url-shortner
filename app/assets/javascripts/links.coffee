# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


onReaderLoad = (event) ->
  console.log "eventiffyf"


$('document').ready ->

  $('#homepage').click (event) ->
    location.href = '/links'
    return

  $('#shorten_btn').click (event) ->
    out_url =  $('#shorten_url').val()
    if out_url.replace(/\s/g, '').length
      formdata =  {'out_url' : out_url, 'http_status' : 301}
      console.log formdata
      $.post "/links.json", formdata, ((data, status) ->
        location.href = '/links/'+data.id
        return
      ), 'json'
      .fail((data)->
        console.log "failed error"
        alert "Failed to create resource, I am fixing this shortly."
      )

    else
      console.log "contains space"
  
    return
  return
