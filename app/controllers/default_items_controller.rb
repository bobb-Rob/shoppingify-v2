class DefaultItemsController < ApplicationController
  def index
    # render json: DefaultItem.all with image url from active storage
    render json: DefaultItem.all.map { |item| item.as_json.merge(image_url: url_for(item.image_attachment)) }   
  end
end
