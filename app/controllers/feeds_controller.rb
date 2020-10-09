# frozen_string_literal: true

class FeedsController < ApplicationController
  def index
    @user = current_user
    @feed = @user.feeds.build
  end

  def show
    user = current_user
    @feed = user.feeds.find_by_id(params[:id])
    @rss = JSON.parse(@feed.rss)
  end

  def create
    xml = SimpleRSS.parse open(params[:feed][:link])
    @feed = current_user.feeds.build(feed_params.merge(rss: xml.to_json))
    if @feed.save
      flash[:success] = 'You are add new feed, my congratulations!'
    else
      flash[:danger] = 'Feel all fields!'
    end
    redirect_to feeds_path
  end

  def destroy
    current_user.feeds.find_by_id(params[:id]).destroy
    flash[:success] = 'Feed deleted'
    redirect_to feeds_path
  end

  def update
    @feed = current_user.feeds.find_by_id(params[:id])
    @feed.update(rss: '')
    xml = SimpleRSS.parse open(@feed.link)
    @feed.update(rss: xml.to_json)
    redirect_to @feed
  end

  def update_all_feeds
    feeds = Feed.all
    feeds.each do |feed|
      xml = SimpleRSS.parse open(feed.link)
      feed.update(rss: xml.to_json)
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:title, :link)
  end
end
