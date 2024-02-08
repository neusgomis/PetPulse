class ChatpetChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    chatpet = Pet.find(params[:id])
    stream_for chatpet
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
