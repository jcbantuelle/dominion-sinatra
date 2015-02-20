class Json::Lobby

  class << self

    def refresh(players)
      {
        action: 'refresh',
        players: players
      }.to_json
    end

    def player_count_error
      {
        action: 'player_count_error'
      }.to_json
    end

    def in_game_error(players)
      {
        action: 'player_in_game_error',
        players: players
      }.to_json
    end

    def game_proposal(game, player, proposer)
      {
        action: 'propose',
        players: game.players,
        cards: game.kingdom_cards,
        proposer: proposer,
        is_proposer: same_player?(player, proposer),
        game_id: game.id
      }.to_json
    end

    def proposal_timeout(players)
      {
        action: 'timeout',
        players: players
      }.to_json
    end

  end

end
