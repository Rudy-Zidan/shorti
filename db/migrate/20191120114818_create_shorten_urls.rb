class CreateShortenUrls < ActiveRecord::Migration[6.0]
  def up
    create_table :shorten_urls do |t|
      t.string :original_url, nil: false
      t.string :url, nil: false
      t.timestamps
    end

    add_index :shorten_urls, :url, unique: true
  end

  def down
    drop :shorten_urls
  end
end
