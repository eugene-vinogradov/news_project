# frozen_string_literal: true

class ChangeTitleToBeTextInFeeds < ActiveRecord::Migration[6.0]
  def change
    change_column :feeds, :title, :text
    change_column :feeds, :rss, :text
  end
end
