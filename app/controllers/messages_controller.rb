class MessagesController < ApplicationController
  STRATEGIES = [ MessageStrategies::EmoteMessage, MessageStrategies::BasicMessage ]

  def create
    message_data = message_params.merge(user: current_user)
    message_data[:content].strip!

    success = STRATEGIES
              .find { |strategy| strategy.match? message_data[:content] }
              .handle(message_data)

    head :ok if success
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
