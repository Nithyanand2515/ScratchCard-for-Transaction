	class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Phone_Number

      t.timestamps
    end
  end
end
