class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :catalog_id
      t.string :category
      t.text :description
      t.text :url
      t.string :rating
      t.string :youtube_url
      t.string :created_by
      t.timestamp :creation_date
      t.string :last_created_by
      t.timestamp :last_updated

      t.timestamps
    end
  end
end
