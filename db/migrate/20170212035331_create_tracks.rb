class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :user_id
      t.string :ip_address
      t.timestamps
    end
    add_reference :tracks, :short_link, index:true
  end
end
