require 'json'
require 'rest-client'

class HomepageController < ApplicationController
  def index
    @url = 'https://tarea-1-breaking-bad.herokuapp.com/api/episodes'
    @response = RestClient.get @url
    @result = JSON.parse @response.to_str
    @seasons_bb = []
    @seasons_bcs =[]
    for element in @result
      if element["series"] == "Breaking Bad"
        @seasons_bb.append(element["season"].to_i)
      else
        @seasons_bcs.append(element["season"].to_i)
      end
    end
    @seasons_bb=@seasons_bb.uniq
    @seasons_bcs=@seasons_bcs.uniq
    @series = ["bb","bcs"]

  
  end

  def new
    @chapter = params[:chapter]
    @season = params[:season]
    @serie = params[:serie]
    if @serie == "bb"
      @url = 'https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Breaking+Bad'
    else
      @url = 'https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Better+Call+Saul'
    end
    @response = RestClient.get @url
    @result = JSON.parse @response.to_str
  end

  def show
    @url = ''
    @season = params[:id]
    @serie = params[:serie]
    if @serie == "bb"
      @url = 'https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Breaking+Bad'
    else
      @url = 'https://tarea-1-breaking-bad.herokuapp.com/api/episodes?series=Better+Call+Saul'
    end
    @response = RestClient.get @url
    @result = JSON.parse @response.to_str
  end

  def edit
    @character = params[:character]
    @character = @character.gsub '-', ''
    @url = 'https://tarea-1-breaking-bad.herokuapp.com/api/characters?name='+ @character
    @url_quote= 'https://tarea-1-breaking-bad.herokuapp.com/api/quote?author='+ @character
    @response = RestClient.get @url
    @result = JSON.parse @response.to_str
    @character = @character.gsub '+', ' '
    @response_quotes = RestClient.get @url_quote
    @quotes = JSON.parse @response_quotes.to_str

    if @quotes != nil or @result != nil
      len_occupation = @result[0]["occupation"].length()
      @ocupaciones = @result[0]["occupation"][0]

      i=1
      while i < len_occupation  do
        @ocupaciones += ', ' +@result[0]["occupation"][i]
        i +=1
      end
      @seasons_bb = @result[0]["appearance"]
      @seasons_bcs = @result[0]["better_call_saul_appearance"]
    end

  end

  def update
    @name = params[:keyword]
    if @name != nil
      @name = @name.gsub ' ', '+'
      @url = 'https://tarea-1-breaking-bad.herokuapp.com/api/characters?name='+ @name
      @response = RestClient.get @url
      @characters = JSON.parse @response.to_str
      @name = @name.gsub '+', ' '
    else
      redirect_to homepage_index_path() , notice: "Hemos vuelto a inicio"
    end
  end
end
