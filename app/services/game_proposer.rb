class GameProposer

  def initialize(data, proposer)
    @data = data
    @proposer = proposer
  end

  def propose
    if too_many_players?
      WebsocketManager.find(@proposer.name).send Json::Lobby.player_count_error
    elsif players_already_in_game?
      WebsocketManager.find(@proposer.name).send Json::Lobby.in_game_error(in_game_players)
    else
      @game = GameCreator.new(players, @proposer).create
      send_proposal
    end
  end

  private

  def send_proposal
    WebsocketManager.find(player_names).each do |name, socket|
      socket.send Json::Lobby.game_proposal(@game, name, @proposer)
    end
    set_timeout
  end

  def set_timeout
    Thread.new {
      sleep(30)
      send_timeout(@game) if @game.pending?
    }
  end

  def send_timeout
    WebsocketManager.find(player_names).each do |name, socket|
      socket.send Json::Lobby.proposal_timeout(@game.timed_out_players)
    end
  end

  def too_many_players?
    players.length > 4
  end

  def players_already_in_game?
    in_game_players.length > 0
  end

  def players
    @players ||= PlayerManager.find(player_names)
  end

  def player_names
    @player_names ||= @data['player_names'].push(@proposer.name)
  end

  def in_game_players
    @in_game_players ||= players.select(&:in_game?)
  end
end
