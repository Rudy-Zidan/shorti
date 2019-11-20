module Shorti
  class ShortenUrlsController < ApplicationController
    def create
      shorten_url = CreateShortenUrlService.run(create_params.to_h.symbolize_keys)

      if shorten_url.errors.any?
        render json: ValidationErrorPresenter.present(errors: shorten_url.errors), status: :unprocessable_entity
      else
        render json: ShortenUrlPresenter.present(shorten_url: shorten_url), status: :created
      end
    end

    private

    def create_params
      params.permit [:url, :domain]
    end
  end
end
