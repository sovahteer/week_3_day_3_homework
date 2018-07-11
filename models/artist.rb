require 'pg'
require 'pry'
require '../db/sql_runner'

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists ( name )
            VALUES ( $1 ) RETURNING id"
    values = [@name]
    artist = SqlRunner.run(sql, values)
    @id = artist [0]["id"].to_i
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    orders = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)}
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artists = SqlRunner.run(sql,values)
    artist = Artist.new(artist.first)
    return artist
  end
end
