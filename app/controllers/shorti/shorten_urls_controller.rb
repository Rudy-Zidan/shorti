module Shorti
  class ShortenUrlsController < ApplicationController
    def show
      shorten_url = FindShortenUrlByIdService.run(id: params[:id])
      render json: present_shorten_url(shorten_url), status: :ok
    end

    def create
      shorten_url = CreateShortenUrlService.run(create_params.to_h.symbolize_keys)

      if shorten_url.errors.any?
        render json: ValidationErrorPresenter.present(errors: shorten_url.errors), status: :unprocessable_entity
      else
        render json: present_shorten_url(shorten_url), status: :created
      end
    end

    private

    def create_params
      params.permit [:url, :domain]
    end

    def present_shorten_url(shorten_url)
      ShortenUrlPresenter.present(shorten_url: shorten_url)
    end
  end
end
