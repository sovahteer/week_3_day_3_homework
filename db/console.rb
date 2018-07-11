require("pry")
require_relative("../models/artist")
require_relative("../models/album")


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'The Killars'})
artist2 = Artist.new({'name' => 'Foo Fighters'})
artist1.save()
artist2.save()

artist1.name = "The Killers"
artist1.update()

album1 = Album.new({'artist_id' => artist1.id, 'album_name' => 'Runawoos', 'genre' => 'Rock'})
album2 = Album.new({'artist_id' => artist2.id, 'album_name' => 'Concrete and Gold', 'genre' => 'Hard Rock'})
album1.save()
album2.save()

album1.album_name = "Runaways"
album1.update()
