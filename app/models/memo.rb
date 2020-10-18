class Memo < ApplicationRecord
  belongs_to :user
  # favorite のコード
  has_many :reverses_of_favorite, class_name: "Favorite"
  has_many :favoriters, through: :reverses_of_favorite, source: :user
  has_many:favorites, dependent: :destroy
  # favorite のコード終了
  
  validates :title, presence: true, length: { maximum: 20 }
end
