class UrlsController < ApplicationController
  before_action :set_by_short_url, only: [:show]

  def index
    @url = Url.new
    if current_user
      @urls = Url.find_by(user_id: current_user.id)
    elsif session[:url_ids] && session[:url_ids].any?
      @urls = Url.find(session[:url_ids])
    else
      @urls = []
    end
  end

  def new
    @url = Url.new
  end

  def show
    @url.increment!(:page_views)
    redirect_to @url.original_url
  end

  def create
    @url = Url.new(url_params)
    @url.user = current_user
    respond_to do |format|
      if @url.save
        set_url_in_session
        format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
        format.json { render action: 'index', status: :created, location: @url }
      else
        format.html { render action: 'index' }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_url_in_session
    if session[:url_ids]
      session[:url_ids] << @url.id
    else
      session[:url_ids] = [@url.id]
    end
  end

  def set_by_short_url
    @url = Url.find_by(short_url: params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url, :short_url)
  end
end
