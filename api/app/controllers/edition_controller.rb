class EditionController < ApplicationController
  before_action :authorize_request

  def index
    render json: { editions: Edition.all }, status: :ok
  end

  def cards
    edition = Edition.find params[:id]
    render json: { cards: edition.cards }, status: :ok
  end



end
