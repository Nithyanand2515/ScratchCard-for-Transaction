class CreateScratchCards < ActiveRecord::Migration[5.2]
  def change
    create_table :scratch_cards do |t|
      t.belongs_to :trans_id, index: true
      t.belongs_to :user, index: true
      t.integer :amount
      t.timestamps
    end
  end
end
