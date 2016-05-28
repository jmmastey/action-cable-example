module MessageStrategies
  class EmoteMessage
    def self.match?(message)
      message =~ /^\/me/
    end

    def self.handle(data)
      data[:content] = data[:content].sub(/^\/me\s+/, '')
      message = Message.new(data.merge(message_type: "emote"))

      if message.save
        ActionCable.server.broadcast 'emotes',
          message: message.content,
          user: message.user.username
      end
    end
  end
end
