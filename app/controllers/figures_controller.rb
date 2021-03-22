class FiguresController < ApplicationController
  get '/figures' do 
    erb :index
  end

  get '/figures/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    
    erb :'/figures/new'
  end

  post '/figures' do 
    binding.pry
    @figure = Figure.create(name: params[:figure][:name])
    if !params[:figure][:title_ids].empty?
      @title = Title.find(params[:figure][:title_ids])
      @figure.titles << @title
    elsif !params[:figure][:landmark_ids].empty?
      @landmark = Landmark.find(params[:figure][:landmark_ids])
      @figure.landmarks << @landmark
    elsif !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    elsif 
      !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
  end
end
