# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

Movie.destroy_all

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Bridget Jones' Diary", overview: "Bridget Jones, a 32-year-old office worker from London, struggles with dating in a very judgmental society.", poster_url: "https://www.imdb.com/title/tt0243155/mediaviewer/rm1869180160/?ref_=tt_ov_i", rating: 6.7)
# Movie.create(title: "Seven Years in Tibet", overview: "A Nazi-sympathizing Austrian mountain climber goes through a personal transformation and meets the Dalai Lama.", poster_url: "https://en.wikipedia.org/wiki/Seven_Years_in_Tibet_(1997_film)#/media/File:Seven_Years_in_Tibet_cover.jpeg", rating: 7.1)

base_url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_list_serialized = URI.open(base_url).read
movie_list = JSON.parse(movie_list_serialized)

movie_list['results'][0...10].each do |entry|
  Movie.create(title: entry['original_title'],
               overview: entry['overview'],
               poster_url: entry['poster_path'],
               rating: entry['vote_average'])
end
