puts "Destroying records..."
Record.destroy_all

puts "Destroying jukeboxes..."
Jukebox.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Destroying tracks..."
Track.destroy_all

puts "Destroying genres..."
Genre.destroy_all

puts "Destroying albums..."
Album.destroy_all

puts "Destroying artists..."
Artist.destroy_all
