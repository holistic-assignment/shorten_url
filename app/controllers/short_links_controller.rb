class ShortLinksController < ApplicationController
  before_action :log_track, :only => [:redirect]

  def show
    @shortlink = ShortLink.find(params[:id])

  end

  def redirect
    redirect_to @shortlink.url
  end

  def create
    @shortlink = ShortLink.new (param_short_link)
    if @shortlink.link_type == "user_link"
      @shortlink.user_id = current_user.id
      if @shortlink.save()
        redirect_to short_link_path(id: @shortlink.id)
      else
        redirect_to root_path
      end
    elsif @shortlink.link_type == "public_link"
      url_exist=ShortLink.check_exist_url(@shortlink.url)
      if url_exist.empty?
        if @shortlink.save()
          redirect_to short_link_path(id: @shortlink.id)
        else
          redirect_to root_path
        end
      else
        redirect_to short_link_path(id: url_exist.first.id)
      end
    end
  end

  private


  def check_url
    params[:short_link][:url] = "http://#{params[:short_link][:url]}" unless params[:short_link][:url]=~/^https?:\/\//
  end

  def param_short_link
    check_url
    params.require(:short_link).permit(:url, :link_type)
  end

  def log_track
    @shortlink = ShortLink.find_by(unique_key: params[:id])
    unless request.location.country.empty?
      @shortlink.tracks.create(ip_address: request.remote_ip, user_id: current_user.nil? ? nil : current_user.id, country: request.location.country)
    else
      @shortlink.tracks.create(ip_address: request.remote_ip, user_id: current_user.nil? ? nil : current_user.id)
    end
  end
end
