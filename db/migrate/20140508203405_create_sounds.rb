class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :url

      t.timestamps
    end
  end
end
