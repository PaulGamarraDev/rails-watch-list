class Movie < ApplicationRecord
  #ASSOCIATIONS
  has_many :bookmarks

  #VALIDATIONS
  validates :title, uniqueness: true
  validates :overview, :title, presence: true
end
