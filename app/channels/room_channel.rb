class RoomChannel < ApplicationCable::Channel
  include RoomsHelper

  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    data = api_request
    MessageBroadcastJob.perform_later(data)
  end
end
