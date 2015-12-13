class CreatePigeons < ActiveRecord::Migration
  def change
    create_table :pigeons do |t|
      t.string :code
      t.references :contest, index: true, foreign_key: true
      t.decimal :lat
      t.decimal :long

      t.timestamps null: false
    end
  end
end
