class SessionsController < ApplicationController
  def new
  end

  def create
    @email = params[:session][:email]
    user = authenticate( params[:session][:email], params[:session][:password] )
    #session[:user_id] = user.id
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      render :new
    else
      login( user )
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
