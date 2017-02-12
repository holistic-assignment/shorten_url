class AddColumnShortLinkType < ActiveRecord::Migration[5.0]
  def change
    add_column :short_links, :link_type, :string
  end
end
