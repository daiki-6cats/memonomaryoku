class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :memo, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :memo_id], unique: true
      # user_idとmemo_idのペアの重複を防ぐもの
    end
  end
end
