class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :period
      t.bigint :limit
      t.bigint :min_range
      t.bigint :max_range
      t.string :type_user
      t.bigint :scratch_card_min
      t.bigint :scratch_card_max

      t.timestamps
    end
  end
end
