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

puts "Creating users..."
User.create(email: 'alice@alice.com', password: '123456', username: 'alice')
User.create(email: 'bob@bob.com', password: '123456', username: 'bob', role: 'curator')
User.create(email: 'carol@carol.com', password: '123456', username: 'carol', role: 'admin')
