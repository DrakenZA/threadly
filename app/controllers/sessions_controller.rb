class SessionsController < ApplicationController
  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


def create
@user = User.find_by_username(params[:session][:username])
if @user && @user.authenticate(params[:session][:password])
  session[:user_id] = @user.id
  redirect_to '/'
else
  flash.keep[:notice] = "Login Failed"

  redirect_to login_path

end
end


end
