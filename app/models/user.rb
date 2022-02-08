class User < ApplicationRecord
    has_many :vinculos
    paginates_per 8
end