require "sinatra"
require "sqlite3"

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), "db/jukebox.sqlite"))

get '/' do
  redirect '/home'
end

get '/iframe' do
  erb :iframe
end

get "/home" do
  search = params[:artist]
  search_query = <<-SQL
    WHERE UPPER(artists.name) LIKE UPPER(\"\%#{search}\%\")
  SQL
  query = <<-SQL
    SELECT artists.id AS artist_id, artists.name AS artist_name
    FROM albums
    JOIN artists
    ON albums.artist_id = artists.id #{search_query unless search.nil?}
    GROUP BY artist_id
  SQL
  p query
  DB.results_as_hash = true
  @artists = DB.execute(query)
  session[:artist] = nil
  erb :home
end

post '/search_artist' do
  artist = params[:artist]
  redirect to("/home?artist=#{artist}")
end

get "/artists/:id" do
  query = <<-SQL
    SELECT artists.name AS artist_name,
           albums.id AS album_id,
           albums.title AS album_title,
           genres.name AS genre
    FROM tracks
    JOIN albums ON tracks.album_id = albums.id
    JOIN artists ON albums.artist_id = artists.id
    JOIN genres ON tracks.genre_id = genres.id
    WHERE artists.id = #{params[:id]}
    GROUP BY albums.title
  SQL
  DB.results_as_hash = true
  @albums = DB.execute(query)
  erb :artist
end

get "/albums/:id" do
  query = <<-SQL
    SELECT albums.title AS album_title,
           tracks.id AS track_id,
           tracks.name AS track_name,
           artists.name AS artist_name
    FROM tracks
    JOIN albums ON tracks.album_id = albums.id
    JOIN artists ON albums.artist_id = artists.id
    WHERE tracks.album_id = #{params[:id]}
  SQL
  DB.results_as_hash = true
  @tracks = DB.execute(query)
  erb :album
end

get "/tracks/:id" do
  query = <<-SQL
    SELECT tracks.name AS track_name,
           artists.name AS artist_name,
           tracks.composer AS composer,
           albums.title AS album_title,
           genres.name AS genre_name,
           tracks.milliseconds AS track_length,
           tracks.unit_price AS unit_price
    FROM tracks
    JOIN albums ON tracks.album_id = albums.id
    JOIN artists ON albums.artist_id = artists.id
    JOIN genres ON tracks.genre_id = genres.id
    WHERE tracks.id = #{params[:id]}
  SQL
  DB.results_as_hash = true
  @track_info = DB.execute(query).first
  erb :track
end
