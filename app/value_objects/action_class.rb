class ActionClass

  VALID_ACTIONS = {
    'lobby_chat' => :lobby,
    'propose_game' => :lobby
  }

  class << self

    def find(action)
      case VALID_ACTIONS[action]
      when :lobby
        Websockets::Lobby
      when :game
        Websockets::Gabe
      end
    end

    def self.valid?(action)
      VALID_ACTIONS.has_key?(action)
    end
  end

end
