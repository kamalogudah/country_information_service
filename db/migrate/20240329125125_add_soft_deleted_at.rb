class AddSoftDeletedAt < ActiveRecord::Migration[7.1]
  def change
    add_column :countries, :soft_deleted_at, :datetime
    add_index :countries, :soft_deleted_at
  end
end
