class SessionsController < ApplicationController
  def new
  end

  def create
  #params = {"user"=>{"name"=>"mickey", "password"=>"mouse"}, "commit"=>"log in", "controller"=>"sessions", "action"=>"create"}
    @user = User.find_by(name: params[:user][:name])
  #params = "user"=>{"user_id"=>"5", "password"=>"[FILTERED]"}, "commit"=>"Sign In"}
  # @user = User.find(params[:user][:user_id])

   # if @user && @user.authenticate(params[:user][:password])
   if @user 
      log_in(@user)
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new' #, :flash => { :danger => 'Invalid email/password combination' }
    end
  end
  def destroy
    #session.delete :user_id
    log_out
    redirect_to '/'

    end
end
