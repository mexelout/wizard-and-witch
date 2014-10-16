class WebsocketPositionController < WebsocketRails::BaseController
  def position_recieve
    recive_position = message()
    broadcast_message(:websocket_position, recive_position)
  end
end
