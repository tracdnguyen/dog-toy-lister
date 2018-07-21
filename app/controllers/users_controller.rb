class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      flash[:error] = "Please sign up with both a username and password."
      redirect '/users/create_user'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to "users/#{@user.id}"
    end
  end

end
