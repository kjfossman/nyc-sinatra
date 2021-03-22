class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    elsif 
      !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    # binding.pry
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      @figure.titles << @title
    elsif 
      !params[:landmark][:name].empty?
      @landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end


end


   #   binding.pry
    #   @figure = Figure.create(params['figure'])
    #   unless params[:landmark][:name].empty?
    #     @figure.landmarks << Landmark.create(params[:landmark])
    #   end
  
    #   unless params[:title][:name].empty?
    #     @figure.titles << Title.create(params[:title])
    #   end
  
    #   @figure.save
    #   redirect to "/figures/#{@figure.id}"
    # end


      # unless params[:figure][:landmark_ids].empty?
    #   @landmark = Landmark.find(params[:figure][:landmark_ids])
    #   @figure.landmarks << @landmark
    # end
    # unless params[:figure][:title_ids].empty?
    #   @title = Title.find(params[:figure][:title_ids])
    #   @figure.titles << @title
    # end
   