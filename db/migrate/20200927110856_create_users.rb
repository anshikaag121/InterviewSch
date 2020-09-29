class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :resume
      t.integer :userid

      t.timestamps
    end
  end
end
