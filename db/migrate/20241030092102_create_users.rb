class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :description
      t.string :email, null: false
      t.integer :age
      t.references :city, foreign_key: true, null: false

      t.timestamps
    end

      add_index :users, :email, unique: true 
  end
end
