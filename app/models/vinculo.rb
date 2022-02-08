class Vinculo < ApplicationRecord
  belongs_to :user, inverse_of: :vinculos
  belongs_to :area, inverse_of: :vinculos
  belongs_to :subarea, inverse_of: :vinculos

  has_many :addativos

  accepts_nested_attributes_for :addativos, reject_if: :all_blank, allow_destroy: true
end