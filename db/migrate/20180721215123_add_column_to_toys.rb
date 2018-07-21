class AddColumnToToys < ActiveRecord::Migration[5.2]
  def change
    add_column :toys, :user_id, :integer
  end
end
