require 'pry'
require '../db/sql_runner'

class Album

  attr_accessor :artist_id, :album_name, :band_name
  attr_reader :id

  def initialize(options)
    @artist_id = options['artist_id'].to_i
    @album_name = options['album_name']
    @band_name = options['band_name']
    @genre = options ['genre']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums ( artist_id, album_name, genre )
          VALUES ( $1, $2, $3) RETURNING id"
    values = [@artist_id, @album_name, @genre]
    customers = SqlRunner.run(sql, values)
    @id = customers [0]["id"].to_i
  end

  def update()
    sql = "UPDATE albums SET ( artist_id, album_name, genre )
    = ( $1,$2, $3 ) WHERE id = $4"
  values = [@artist_id, @album_name, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums where id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    orders = SqlRunner.run(sql)
    return album.map { |album| Album.new(album)}
  end

  def find_albums_by(artist)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [ id ]
    albums_by = SqlRunner.run(sql, values)
    return albums_by.map{ |artists_by_hash|
      Album.new(albums_by_hash) }
  end

  def self.find(id)
      sql = "SELECT * FROM albums WHERE id = $1"
      values = [id]
      albums = SqlRunner.run(sql,values)
      album = album.new(album.first)
      return album
  end
end
