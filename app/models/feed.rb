# frozen_string_literal: true

class Feed < ApplicationRecord
  has_and_belongs_to_many :users
  default_scope -> { order(created_at: :desc) }
  validates :user_ids, presence: true
  validates :link, presence: true
  validates :title, presence: true
end
