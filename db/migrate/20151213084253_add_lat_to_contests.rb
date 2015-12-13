class AddLatToContests < ActiveRecord::Migration
  def change
    add_column :contests, :lat, :decimal
  end
end
