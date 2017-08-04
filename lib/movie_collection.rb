# encoding: utf-8
require_relative 'movie.rb'

class MovieCollection
  KEYS = [:link, :name, :year, :country, :date, :genre, :duration, :rating, :author, :actors].freeze
  def initialize(file_path)
    f = File.open(file_path, 'r:UTF-8')
    @films =  f.map {  |film| Movie.new(KEYS.zip(film.strip.split('|')).to_h) }
    f.close
  end

  def all
    @films
  end

  def movie_sort(sort_field)
    @films.sort_by { |film| film.sort_field }
  end
end
