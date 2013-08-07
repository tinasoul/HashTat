class RemoveAndAddColumnsFromUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    rename_column :users, :name, :username
  end

  
end
