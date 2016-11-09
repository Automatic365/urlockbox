class LinksController < ApplicationController
  before_action :require_user

  def index
    @links = current_user.links
  end

  def create
    parsed_link = Parser.new(link_params[:url])
    link = current_user.links.new(url: parsed_link.url , title: link_params[:title])
    if link.save && parsed_link.should_be_emailed?
      UserNotifier.email_link(current_user, parsed_link.recipient, parsed_link.url).deliver_now
      flash[:success] = "Link sent to #{parsed_link.recipient}!"
    elsif link.save
      flash[:success] = "Link Submitted"
      redirect_to links_path
    else
      flash[:error] = "Invalid URL"
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    parsed_link = Parser.new(link_params[:url])
    if @link.update(url: parsed_link.url, title: link_params[:title])
      flash[:success] = "Link updated."
      redirect_to links_path
    else
      flash[:error] = "Your URL is invalid"
      redirect_to edit_link_path(@link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
