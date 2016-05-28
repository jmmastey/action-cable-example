class EmotesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'emotes'
  end
end
