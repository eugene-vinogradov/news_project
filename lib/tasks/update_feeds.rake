# frozen_string_literal: true

namespace :update_feeds do
  desc 'I try update all feeds'
  task all_feeds: :environment do
    Feed.all.each do |feed|
      feed.update(rss: '')
      xml = SimpleRSS.parse open(feed.link)
      feed.update(rss: xml.to_json)
    end
  end
end
