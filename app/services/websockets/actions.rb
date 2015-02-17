class Websockets::Actions

  VALID_ACTIONS = {
    'lobby_chat' => :lobby
  }

  class << self

    def action_class(action)
      case VALID_ACTIONS[action]
      when :lobby
        Websockets::Lobby
      when :game
        Websockets::Gabe
      end
    end

    def valid_action(action)
      VALID_ACTIONS.has_key?(action)
    end

  end

end
