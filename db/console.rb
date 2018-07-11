require("pry")
require_relative("../models/albums")
require_relative("../models/artists")

artist1 = Artist.new ({'name' => 'band'})
artist2 = Artist.new ({'name' => 'band'})
artist1.save()
artist2.save()

album1 = Album.new ({'name' => 'band'})
album2 = Album.new ({'name' => 'band'})
album1.save()
album2.save()
