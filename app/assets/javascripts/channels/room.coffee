App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: ->
    @perform 'speak'

refreshPartial= ->
  App.room.speak

$(document).ready ->
  setInterval refreshPartial, 5000