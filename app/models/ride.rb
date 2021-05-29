class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride

        message = "Sorry."
       
     
        if user.tickets < attraction.tickets
          message << " You do not have enough tickets to ride the #{attraction.name}."
        end
        if user.height < attraction.min_height
          message << " You are not tall enough to ride the #{attraction.name}."
        end
        if user.tickets >= attraction.tickets && user.height >= attraction.min_height
          user.tickets -= attraction.tickets

          puts user.tickets
          user.happiness += attraction.happiness_rating
          user.nausea += attraction.nausea_rating
          message = "Thanks for riding the #{attraction.name}!"
          user.save
        end
        message
    
      end

end
