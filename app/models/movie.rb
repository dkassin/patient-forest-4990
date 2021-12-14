class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies


  def age_listing
    actors.order(:age)
  end

  def avg_age
    actors.average(:age)
  end
end
