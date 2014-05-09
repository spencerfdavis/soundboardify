class AddImageUrlToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :image_url, :string
  end
end
