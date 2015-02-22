module JsonHelper

  def chat(player, message)
    {
      action: 'chat',
      message: "<strong>#{player.name}:</strong> #{message}"
    }.to_json
  end

  def same_player?(player1, player2)
    player1 == player2
  end

end
