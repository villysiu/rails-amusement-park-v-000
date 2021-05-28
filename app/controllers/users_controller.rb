class UsersController < ApplicationController
    def new
        @user=User.new
    end
    def create
        #params = {"user"=>{"name"=>"minnie","password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"create"}

        @user = User.new(user_params)

        if @user && @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
        end
  end
  def show
        if logged_in?
            @user = User.find(params[:id])
        else
            flash[:danger] = 'You are not signed in'
            redirect_to '/'
        end
  end
  def index
    @users = User.all
  end
  def edit
    if logged_in?
      @user = User.find(params[:id])
    else
      flash[:danger] = 'You are not signed in'
      redirect_to '/'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
  end


end
