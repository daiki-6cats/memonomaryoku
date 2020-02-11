class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :title
      t.text :fact
      t.text :abstract
      t.text :diversion
      t.string :wrap
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
