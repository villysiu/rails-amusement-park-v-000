class RidesController < ApplicationController
  def new
  end

  def create
    ride = Ride.create(ride_params)
    flash.alert = ride.take_ride

    redirect_to ride.user
  end
  def show

  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end

  

end
