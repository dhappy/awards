class Award < ApplicationRecord
  has_many :entries
  has_many(
    :years, -> { order(:number).distinct },
    through: :entries
  )

  def to_s; name; end
end
