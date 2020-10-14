# frozen_string_literal: true

class AddTitleToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :title, :text
  end
end
