class GamesApp < Sinatra::Base

# root
  get "/" do
    redirect('/games')
  end

  # about page
  get "/about" do
    erb(:about)
  end

 # index
  get '/games' do
    @games = Game.all
    erb(:"games/index")
  end

# new
 get '/games/new' do
    @game = Game.new
    erb(:"games/new")
  end

# add
  post '/games' do
    @game = Game.new(params[:game])
    if @game.save
      redirect("/games/#{@game.id}")
    else
      erb(:"games/new")
    end
  end

# show
  get '/games/:id' do
    @game = Game.find(params[:id])
    erb(:"games/show")
  end

   # edit
  get '/games/:id/edit' do
    @game = Game.find(params[:id])
    erb(:"games/edit")
  end

   # update
  put '/games/:id' do
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect("/games")
    else
      erb(:"games/new")
    end
  end

# delete
 delete '/games/:id' do
    @game = Game.find(params[:id])
    if @game.destroy
      redirect('/games')
    else
      redirect("/games/#{@game.id}")
    end
  end

  #  # destroy
  # delete "/widgets/:id" do
  #   @widget = Widget.find params[:id]
  #   if @widget.destroy
  #     redirect "/widgets"
  #   else
  #     redirect "/widgets/#{@widget.id}"
  #   end
  # end

end
