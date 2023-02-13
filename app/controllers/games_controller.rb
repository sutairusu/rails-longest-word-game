require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = 10.times.map { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters]
    @attempt = params[:attempt]
    url = "https://wagon-dictionary.herokuapp.com/#{params[:attempt]}"
    @data = JSON.parse(URI.parse(url).open.read)
    @eng_word = @data['found'] == true
    @included = @attempt.upcase.chars.all? { |letter| @letters.include?(letter) }
  end
end
