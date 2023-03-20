puts "Destroying jukeboxes..."
Jukebox.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Creating users..."
User.create!(email: 'alice@alice.com', password: '123456', username: '12136120750', role: 0)
User.create!(email: 'bob@bob.com', password: '123456', username: '12136120750', role: 1)
User.create!(email: 'carol@carol.com', password: '123456', username: '12136120750', role: 2)
