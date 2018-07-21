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


end
