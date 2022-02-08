class Condition < ApplicationRecord
    has_many :situations
    belongs_to :vinculo
end
