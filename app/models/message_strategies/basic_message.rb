module MessageStrategies
  class BasicMessage
    def self.match?(message)
      true
    end

    def self.handle(data)
      message = Message.new(data.merge(message_type: "text"))

      if message.save
        ActionCable.server.broadcast 'messages',
          message: message.content,
          user: message.user.username
      end
    end
  end
end
