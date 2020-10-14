# frozen_string_literal: true

class AddRssFeedToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :rss, :text
  end
end
