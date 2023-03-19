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
curator = User.create(email: 'bob@bob.com', password: '123456', username: 'bob', role: 'curator')
User.create(email: 'carol@carol.com', password: '123456', username: 'carol', role: 'admin')

puts "Creating jukeboxes..."
best = Jukebox.create(name: 'best', user: curator)
better = Jukebox.create(name: 'better', user: curator)
good = Jukebox.create(name: 'good', user: curator)

puts "Creating artists..."
beatles = Artist.create(name: 'The Beatles')
queen = Artist.create(name: 'Queen')
denver = Artist.create(name: 'John Denver')

puts "Creating albums..."
album1 = Album.create(title: 'Let It Be', artist: beatles)
album2 = Album.create(title: 'Abbey Road', artist: beatles)
album3 = Album.create(title: 'A Night At The Opera', artist: queen)
album4 = Album.create(title: 'Rhymes & Reasons', artist: denver)

puts "Creating genres..."
pop = Genre.create(name: 'pop')
rock = Genre.create(name: 'rock')
country = Genre.create(name: 'country')

puts "Creating tracks..."
track1 = Track.create(title: "Let It Be", album: album1, genre: pop)
track2 = Track.create(title: "Here Comes the Sun", album: album2, genre: pop)
track3 = Track.create(title: "Come Together", album: album2, genre: pop)
track4 = Track.create(title: "Love of My Life", album: album3, genre: rock)
track5 = Track.create(title: "Bohemian Rhapsody", album: album3, genre: rock)
track6 = Track.create(title: "Leaving on a Jet Plane", album: album4, genre: country)

puts "Creating records..."
Record.create(jukebox: best, track: track1)
Record.create(jukebox: best, track: track2)
Record.create(jukebox: best, track: track4)
Record.create(jukebox: best, track: track6)
Record.create(jukebox: better, track: track3)
Record.create(jukebox: better, track: track5)

puts "Finished"
