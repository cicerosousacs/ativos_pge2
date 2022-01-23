class Area < ApplicationRecord
    has_many :subareas
    paginates_per 8
end
