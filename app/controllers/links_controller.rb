class LinksController < ApplicationController
  before_action :require_user

  def index
    @links = current_user.links
  end

  def create
    parsed_link = Link.parse(link_params['url'])
    url = parsed_link.first
    recipient = parsed_link.last
    link = current_user.links.new(url: url, title: link_params['title'])
    if @link.save
      UserNotifier.send_link(current_user, recipient, url).deliver_now
      redirect_to links_path
    else
      flash[:error] = "Invalid Url"
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Link updated."
      redirect_to links_path
    else
      flash[:error] = "Your url is invalid"
      redirect_to edit_link_path(@link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
