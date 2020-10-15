# frozen_string_literal: true

class RemoveUpdateRssAtToFromFeeds < ActiveRecord::Migration[6.0]
  def change
    remove_column :feeds, :update_rss_at_to, :datetime
  end
end
