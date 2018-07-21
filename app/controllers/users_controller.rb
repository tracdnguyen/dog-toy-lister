class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if is_logged_in?(session)
      erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/'
    end
  end



end
