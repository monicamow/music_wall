#Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do 
  @tracks = Track.all
  erb :'tracks/index'
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

# testing sessions
enable :sessions

# get '/' do
#   session["value"] ||= "Hello world!"
#   "The cookie you've created contains the value: #{session["value"]}"
# end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end
