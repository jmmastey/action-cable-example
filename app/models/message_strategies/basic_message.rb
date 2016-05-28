module MessageStrategies
  class BasicMessage
    def self.match?(message)
      true
    end

    def self.handle(data)
      message = Message.new(data)

      if message.save
        ActionCable.server.broadcast 'messages',
          message: message.content,
          user: message.user.username
      end
    end
  end
end
