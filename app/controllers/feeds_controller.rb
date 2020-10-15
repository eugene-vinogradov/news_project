# frozen_string_literal: true

class FeedsController < ApplicationController
  before_action :logged_in_user, only: %i[index show create]

  def index
    @user = current_user
  end

  def show
    @feed = current_user.feeds.find_by_id(params[:id])
    update unless fresh_news(@feed)
    @rss = JSON.parse(@feed.rss)
  end

  def create
    if link_exist?(clearing_link_from_query(params[:link]))
      @feed = Feed.find_by(link: params[:link])
      current_user.feeds << @feed
      flash[:success] = 'You are add new feed, my congratulations!'
    else
      xml = RSS::Parser.parse(open(params[:link])).to_json
      @feed = current_user.feeds.build(title: params[:title],
                                       link: params[:link],
                                       rss: xml,
                                       update_rss_at: DateTime.now)
      @feed.user_ids = current_user.id
      if @feed.save
        flash[:success] = 'You are add new feed, my congratulations!'
      else
        flash[:danger] = 'Feel all fields!'
      end
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
    xml = RSS::Parser.parse(open(@feed.link)).to_json
    @feed.update(rss: xml, update_rss_at: DateTime.now)
    redirect_to @feed
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in!!'
      redirect_to login_url
    end
  end

  def link_exist?(link)
    !Feed.find_by(link: link).nil?
  end

  def clearing_link_from_query(link)
    clear_link = URI.parse(link)
    clear_link.fragment = clear_link.query = nil
    clear_link.to_s
  end

  def fresh_news(feed)
    time_difference = (DateTime.now.to_f - feed.update_rss_at.to_f) / 86_400
    time_difference < 1
  end
end
