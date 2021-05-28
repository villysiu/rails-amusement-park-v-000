class AttractionsController < ApplicationController
    def new
        @attraction = Attraction.new
    end
    def create
      @attraction = Attraction.new(attraction_params)
      if @attraction && @attraction.save
        redirect_to @attraction
      else
        flash.now[:danger] = 'Invalid attraction'
        render 'new'
      end
    end
    def index
      @attractions = Attraction.all
    end
    def show
      @attraction = Attraction.find(params[:id])
    end
  
  
    def edit
      if current_user.admin
        @attraction = Attraction.find(params[:id])
      else
        flash[:danger] = 'You are not authorized to edit attraction'
        redirect_to '/'
      end
    end

    def update
        @attraction = Attraction.find(params[:id])
        #puts user_params
        @attraction.update(attraction_params)
        if @attraction.errors.messages != {}
          render :edit
        else
          redirect_to @attraction
        end
      end
  
    private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
  end
  
