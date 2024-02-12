require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ("A".."Z").to_a.sample(10)
  end

  def score
      @word = params[:word]
      apiurl = "https://wagon-dictionary.herokuapp.com/#{@word}"
      result_serialized = URI.open(apiurl).read
      result = JSON.parse(result_serialized)
      @found = result["found"]
  end

end
