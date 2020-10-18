class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :memos
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow #この行が多対多の関係を作っている
  has_many :reverses_of_relationship, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverses_of_relationship, source: :user #この行が多対多の関係を作っている
# favorite のコード
    has_many :favorites
    has_many :likes, through: :favorites, source: :memo
# favorite のコード終了
  
  
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_memos
    Memo.where(user_id: self.following_ids + [self.id])
  end
  
  def favorite(other_memo)
    unless self == other_memo
      self.favorites.find_or_create_by(memo_id: other_memo.id)
    end
  end
  
  def unfavorite(other_memo)
    favorite = self.favorites.find_by(memo_id: other_memo.id)
    favorite.destroy if favorite
  end
  
  def likes?(other_memo)
    self.likes.include?(other_memo)
  end
end
