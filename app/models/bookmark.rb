class Bookmark < ApplicationRecord
  #ASSOCIATIONS
  belongs_to :movie
  belongs_to :list

  #VALIDATIONS
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list,
     message: "A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique" }
end
