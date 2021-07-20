class Album
  attr_reader :id, :name, :genre, :artist, :year

  @@albums = {}
  @@total_rows = 0

  def initialize(name, artist, genre, year, id)
    @name = name
    @artist = artist
    @genre = genre
    @year = year
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.artist, self.genre, self.year, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.search(name)
    id = 0
    @@albums.each do |album|
      if album[1].name == name
        id = album[1].id
      end
    end
    return id
  end
end
