require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
# require "better_errors"
require "sqlite3"

configure :development do
  # use BetterErrors::Middleware
  # BetterErrors.application_root = File.expand_path(__dir__)
end

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), "db/jukebox.sqlite"))

get "/" do
  # TODO: Gather all artists to be displayed on home page
  query = <<-SQL
    SELECT artists.id AS artist_id, artists.name AS artist_name
    FROM artists
  SQL
  DB.results_as_hash = true
  @artists = DB.execute(query)
  erb :home
end

# Then:
# 1. Create an artist page with all the albums. Display genres as well
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

# 2. Create an album pages with all the tracks
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

# 3. Create a track page with all the track info
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
  @track_info = DB.execute(query)[0]
  erb :track
end
