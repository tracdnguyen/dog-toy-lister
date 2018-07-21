class ToysController < ApplicationController
  get '/toys' do
    if logged_in?
      @toys = Toy.all
      erb :'toys/toys'
    else
      redirect to '/login'
    end
  end

  get '/toys/new' do
    if logged_in?
      erb :'toys/create_toy'
    else
      redirect to '/login'
    end
  end

  post '/toys' do
    if logged_in?
      if params[:name] == "" || params[:url] == ""
        flash[:error] = "Please enter both a name and url for your new favorite toy!"
        redirect to "/toys/new"
      else
        @toy = current_user.toys.build(name: params[:name], url: params[:url])
        if @toy.save
          redirect to "/toys/#{@toy.id}"
        else
          redirect to "/toys/new"
        end
      end
    else
      redirect to '/login'
    end
  end


end
