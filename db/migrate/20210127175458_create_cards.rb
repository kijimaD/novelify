class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :image
      t.references :story, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
