class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    validates_presence_of :email
  validates_uniqueness_of :email
  
    def mood
        if nausea && happiness
            nausea > happiness ? 'sad' : 'happy'
        else
            'N/A'
        end
    end
    def how_tall?
        height ? "#{height} inches" : 'N/A'
    end
end
