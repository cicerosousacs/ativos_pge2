class Subarea < ApplicationRecord
  belongs_to :area
  paginates_per 8
end
