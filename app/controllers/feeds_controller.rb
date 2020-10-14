# frozen_string_literal: true

class FeedsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    user = current_user
    @feed = user.feeds.find_by_id(params[:id])
    @rss = JSON.parse(@feed.rss)
  end

  def create
    xml = RSS::Parser.parse(open(params[:link])).to_json
    @feed = current_user.feeds.build(title: params[:title], link: params[:link], rss: xml)
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
    xml = RSS::Parser.parse(open(@feed.link)).to_json
    @feed.update(rss: xml)
    redirect_to @feed
  end
end
