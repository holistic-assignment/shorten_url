class CreateShortLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :short_links do |t|
      t.string :url
      t.string :unique_key, unique: true
      t.timestamps
    end
  end
end
