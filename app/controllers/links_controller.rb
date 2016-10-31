class LinksController < ApplicationController
  before_action :require_user

  def index
    @links = current_user.links
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash[:error] = "Invalid Url"
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
