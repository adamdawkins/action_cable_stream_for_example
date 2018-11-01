html = (htmlString) ->
  div = document.createElement('div')
  div.innerHTML = htmlString.trim()
  div.firstChild

App.comments = App.cable.subscriptions.create { channel: "CommentsChannel", id: 1 },
  collection: -> document.querySelector('[data-channel="comments"]')
  connected: ->
    console.log('CommentsChannel connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('CommentsChannel disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('CommentsChannel received')
    console.log(data)
    @collection().appendChild(html(data.comment))
