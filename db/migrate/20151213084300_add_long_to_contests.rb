class AddLongToContests < ActiveRecord::Migration
  def change
    add_column :contests, :long, :decimal
  end
end
