class List < ApplicationRecord
  #ASSOCIATIONS
  has_many :bookmarks , dependent: :destroy
  has_many :movies, through: :bookmarks

  #VALIDATIONS
  validates :name, uniqueness: true, presence: true
end
