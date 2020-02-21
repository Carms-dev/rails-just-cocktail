class Review < ApplicationRecord
  belongs_to :cocktail
  has_many_attached :photos

  validates :username, :content, :rating, presence: true;
  validates :rating, inclusion: { in: (0..5).to_a }, numericality: { only_integer: true }
end
