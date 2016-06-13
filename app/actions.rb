# Homepage (Root path)
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
    redirect '/tracks/new'
  end
end

