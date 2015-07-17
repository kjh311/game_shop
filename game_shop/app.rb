class GamesApp < Sinatra::Base

  get "/" do
    redirect('/games')
  end

  get '/games/new' do
    @game = Game.new
    erb(:"games/new")
  end

  post '/games' do
    @game = Game.new(params[:game])
    if @game.save
      redirect("/games/#{@game.id}")
    else
      erb(:"games/new")
    end
  end

  get '/games/:id' do
    @game = Game.find(params[:id])
    erb(:"games/show")
  end

  delete '/games/:id' do
    @game = Game.find(params[:id])
    if @song.destroy
      redirect('/games')
    else
      redirect("/games/#{@game.id}")
    end
  end

end
