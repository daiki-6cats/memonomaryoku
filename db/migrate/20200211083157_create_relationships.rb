class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }
      #trueじゃないのはfollowテーブルを参照させずusersテーブルへ行かせるため

      t.timestamps
      
      t.index [:user_id, :follow_id], unique: true
      #user_idとfollow_idがデータベースで保存されないようにしている
    end
  end
end
