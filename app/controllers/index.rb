get '/' do
  # Look in app/views/index.erb
  @all_player = Player.all

  erb :index
end


get '/player/create' do

  erb :'/player/create'
end

post '/player/create' do
  @name = params[:name]
  Player.create(name: @name)
  redirect '/'
end

post '/game' do
  player_1 = params[:player_1]
  player_2 = params[:player_2]
  current_game = Game.create()

  # current_round = Round.create(player1_id:player_1, player2_id:player_2)
  redirect "/game/#{player_1}/#{player_2}/#{current_game.id}"
end


get '/game/:player_1/:player_2/:game_id' do
  @p1_id = params[:player_1]
  @p2_id = params[:player_2]
  @game_id = params[:game_id]
  # @round_id = params[:round_id]
  # @current_round = Round.find(@round_id)
  # @current_round.game_id << Game.find(@game_id)
  # @current_round.player1_id << Player.find(@p1_id)
  # @current_round.player2_id << Player.find(@p2_id)

  erb :'/game/begin'
end

post '/won' do
  game = Game.find(params[:game])
  game.winner_id = params[:winner]
  game.loser_id = params[:loser]
  game.win_time = params[:time]
  game.save
  redirect "/won"
end

get '/won' do
  "stop here first"
end