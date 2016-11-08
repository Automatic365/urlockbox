class Api::V1::LinksController < ApiBaseController

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      respond_with @link
    end
  end

  private

  def link_params
    params.require(:link).permit(:read)
  end

end
