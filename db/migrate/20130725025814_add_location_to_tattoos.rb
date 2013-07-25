class AddLocationToTattoos < ActiveRecord::Migration
  def change
    add_column :tattoos, :location, :string
  end
end
