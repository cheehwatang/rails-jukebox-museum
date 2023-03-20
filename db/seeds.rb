puts "Destroying jukeboxes..."
Jukebox.destroy_all

puts "Destroying users..."
User.destroy_all

puts "Creating users..."
User.create!(email: 'alice@alice.com', password: '123456', username: '12136120750', role: 0)
curator = User.create!(email: 'bob@bob.com', password: '123456', username: '12136120750', role: 1)
User.create!(email: 'carol@carol.com', password: '123456', username: '12136120750', role: 2)

puts "Creating jukeboxes..."
Jukebox.create!(name: 'best', user: curator)
Jukebox.create!(name: 'better', user: curator)
Jukebox.create!(name: 'good', user: curator)

puts "Finished!"
