# frozen_string_literal: true

class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.text :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :feeds, %i[user_id created_at]
  end
end
