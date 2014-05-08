class AddNameToSound < ActiveRecord::Migration
  def change
    add_column :sounds, :name, :string
  end
end
