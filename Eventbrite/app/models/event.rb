class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances 

    validates :start_date,
    presence: true
    # numericality: {greater_than_or_equal_to: Time.now}

    # puts duration
    validates :duration,
    presence: true
    # numericality: {equal_to: :duration % 5 }
    
    validates :title,
    presence: true,
    length: {in: 5..140}

    validates :description,
    presence: true,
    length: {in: 20..1000}

    validates :price,
    presence: true,
    numericality: { only_integer: true }

    validates :location,
    presence: true
end
