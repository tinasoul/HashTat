class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :tattoo
      t.text  :comment_content
      t.timestamps
    end
  end
end
