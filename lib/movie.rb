class Movie
  attr_accessor :title, :release_date, :director, :summary

  @@movies = []

  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@movies << self
  end

  def url
    header = self.title.downcase.gsub(" ","_")
    url_friendly = header + '.html'
  end

  def self.all
    @@movies
  end

  def self.reset_movies!
    @@movies = []
    @@movies
  end

  def self.make_movies!
    new_array = []
    file = File.open('spec/fixtures/movies.txt')
    file.each do |line|
      row = line.split(" - ")
      movie = Movie.new(row[0], row[1].to_i, row[2], row[3])
      new_array << movie
    end
    new_array
  end

  def self.recent
    array = []
    Movie.all.each do |movie|
      if movie.release_date >= 2012
        array << movie
      end
    end
    array
  end


end
