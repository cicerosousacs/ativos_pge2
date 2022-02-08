class Ativo < ApplicationRecord
  belongs_to :type
  paginates_per 10


  scope :search, -> (query) { 
    text = "%#{query}%"
    search_columns = %w[tombo description serial]
    where(
      search_columns
        .map { |field| "#{field} LIKE :search" }
        .join(' OR '),
      search: text
    )
  }

end
