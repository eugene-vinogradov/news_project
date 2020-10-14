# frozen_string_literal: true

class Feed < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :link, presence: true
  validates :title, presence: true
end
