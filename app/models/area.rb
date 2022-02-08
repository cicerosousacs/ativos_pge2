class Area < ApplicationRecord
    has_many :subareas
    has_many :vinculos
    paginates_per 8
end