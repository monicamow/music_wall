# testing sessions
enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:id])
  end
end

#Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do 
  if current_user
    #@tracks = Track.all.joins(:votes).group("tracks.id").order("count(votes.track_id) DESC")
    @tracks = Track.all.joins("LEFT JOIN 'votes' on votes.track_id = tracks.id").group("tracks.id").order("count(votes.track_id) DESC")
    erb :'tracks/index'
  else
    "YOU NEED TO LOGIN TO SEE THIS"
  end  
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

# post new track
post '/tracks' do
  @track = Track.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
    )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

# show individual track posts
get '/tracks/:id' do
  @track = Track.find(params[:id])
  erb :'tracks/show'
end

# get '/' do
#   session["value"] ||= "Hello world!"
#   "The cookie you've created contains the value: #{session["value"]}"
# end

get '/login' do
  erb :login
end

# post login info
post '/login' do
  @user = User.find_by(username: params[:username], password: params[:password])
  session[:id] = @user.id
  redirect '/tracks'
end

get '/signup' do
  @new_user = User.new
  erb :signup
end

post '/signup' do 
    @new_user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @new_user.save
    "You're signed up!"
  else
    "DO IT AGAIN"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

# create new vote object when Votes button clicked
post '/votes' do
  track_id = params[:track_id]
  @vote = Vote.new(
    track_id: track_id,
    user_id: current_user.id
    )
  if @vote.save
    redirect '/tracks'
  else
    erb :votes, locals: {vote: @vote}
  end
end
