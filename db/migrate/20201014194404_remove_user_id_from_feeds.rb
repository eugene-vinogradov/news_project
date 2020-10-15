# frozen_string_literal: true

class RemoveUserIdFromFeeds < ActiveRecord::Migration[6.0]
  def change
    remove_column :feeds, :user_id, :integer
  end
end
