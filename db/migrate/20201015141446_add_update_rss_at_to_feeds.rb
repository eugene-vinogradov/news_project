# frozen_string_literal: true

class AddUpdateRssAtToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :update_rss_at, :datetime
  end
end
