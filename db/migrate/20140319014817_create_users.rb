class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phraseofpass
      t.string :location
      t.integer :mood_pref
      t.integer :auth

      t.timestamps
    end
  end
end
