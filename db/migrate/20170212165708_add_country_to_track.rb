class AddCountryToTrack < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :country,:string, default:'Unknow'
  end
end
