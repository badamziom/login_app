class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if	user	&&	user.password == params[:session][:password]
      log_in	user
      redirect_to	user
    else
      flash[:danger] = 'Błędne dane'
      render 'new'
    end
  end

  def logout
    log_out
    redirect_to	root_url
  end
end
