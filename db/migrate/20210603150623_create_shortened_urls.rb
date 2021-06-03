class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.string :target
      t.string :short_form
      t.references :user
      t.integer :visit_count, default: 0

      t.timestamps
    end
  end
end
