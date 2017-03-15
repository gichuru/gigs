class AddUsertypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_employer, :boolean, default: false
  end
end
