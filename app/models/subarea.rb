class Subarea < ApplicationRecord
  belongs_to :area
  has_many :vinculos
  paginates_per 8
end