class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: "User"
  #followの存在しないクラスを参照することを防ぐため。
end
