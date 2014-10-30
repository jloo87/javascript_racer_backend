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
  redirect "/game/#{player_1}/#{player_2}"
end


get '/game/:player_1/:player_2' do
  @p1_id = params[:player_1]
  @p2_id = params[:player_2]

  erb :'/game/begin'
end

# post '/'do
#   puts "Our params are:"
# p params
# p params ['player']
# p params ['game']

# winner = session[:player_1] if params ["player"] == 1
# winner = session[:player_2] if params ["player"] == 2

# player = Player.find_by (name:winner).games.players.find_by(game_id: session[:game_id])
# player.winner = true
# player.save
# g = game.find(session[:game.id])
# g.duration = params["duration"]
# g.save
# p winner
# p "/games/#{session[:game_id]}"
# "/games/#{session[:game_id]}"
# end