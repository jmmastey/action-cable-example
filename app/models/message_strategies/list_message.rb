module MessageStrategies
  class ListMessage
    def self.match?(message)
      message =~ /^\/list/
    end

    def self.handle(data)
      payload = Chatroom.all
                  .pluck(:slug)
                  .map { |slug| [ slug, "/chatrooms/#{slug}" ] }

      ActionCable.server.broadcast 'list', channels: payload
    end
  end
end
