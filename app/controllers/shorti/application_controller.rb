module Shorti
  class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

    private

    def not_found_error(e)
      render json: NotFoundErrorPresenter.present(msg: e.message), status: :not_found
    end
  end
end
