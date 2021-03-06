class ToysController < ApplicationController
  use Rack::Flash

  get '/toys' do
    if logged_in?
      @toys = Toy.all
      erb :'toys/toys'
    else
      flash[:error] = "Please login to view favorite toys posted by other users!"
      redirect to '/login'
    end
  end

  get '/toys/new' do
    if logged_in?
      erb :'toys/create_toy'
    else
      flash[:error] = "Please login to create a new toy!"
      redirect to '/login'
    end
  end

  post '/toys' do
    if logged_in?
      if params[:name] == "" || params[:url] == "" || params[:price] = ""
        flash[:error] = "Fields for name, url, and price cannot be left blank!"
        redirect to "/toys/new"
      else
        @toy = current_user.toys.build(name: params[:name], url: params[:url], image_url: params[:image_url], price: params[:price])
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

  get '/toys/:id' do
    if logged_in?
      @toy = Toy.find_by_id(params[:id])
      erb :'toys/show_toy'
    else
      redirect to '/login'
    end
  end

  get '/toys/:id/edit' do
    if logged_in?
      @toy = Toy.find_by_id(params[:id])
      if @toy && @toy.user == current_user
        erb :'toys/edit_toy'
      else
        flash[:error] = "Users can only edit their own favorite toys."
        redirect to '/toys'
      end
    else
      redirect to '/login'
    end
  end

  patch '/toys/:id' do
    if logged_in?
      if params[:name] == "" || params[:url] == ""
        redirect to "/toys/#{params[:id]}/edit"
      else
        @toy = Toy.find_by_id(params[:id])
        if @toy && @toy.user == current_user
          if @toy.update(name: params[:name], url: params[:url], image_url: params[:image_url], price: params[:price])
            redirect to "/toys/#{@toy.id}"
          else
            redirect to "/toys/#{@toy.id}/edit"
          end
        else
          redirect to '/toys'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/toys/:id/delete' do
    if logged_in?
      @toy = Toy.find_by_id(params[:id])
      if @toy && @toy.user == current_user
        @toy.delete
        redirect to "/users/#{current_user.id}"
      else
        flash[:error] = "Users can only delete their own favorite toys."
        redirect to '/toys'
      end
    else
      redirect to '/login'
    end
  end

end
