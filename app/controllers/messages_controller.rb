class MessagesController < ApplicationController
  STRATEGIES = [ MessageStrategies::BasicMessage ]

  def create
    message_data = message_params.merge(user: current_user)
    success = STRATEGIES
              .first { |strategy| strategy.match? message_data[:content] }
              .handle(message_data)


    head :ok if success
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
