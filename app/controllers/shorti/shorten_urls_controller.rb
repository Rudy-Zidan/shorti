module Shorti
  class ShortenUrlsController < ApplicationController
    before_action :set_shorten_url, only: [:show, :destroy]

    def index
      pagy, shorten_urls = GetAllShortenUrlService.run(index_params.to_h.symbolize_keys)
      render json: ShortenUrlCollectionPresenter.present(shorten_urls: shorten_urls, pagy: pagy), status: :ok
    end

    def show
      render json: present_shorten_url(@shorten_url), status: :ok
    end

    def create
      shorten_url = CreateShortenUrlService.run(create_params.to_h.symbolize_keys)

      if shorten_url.errors.any?
        render json: ValidationErrorPresenter.present(errors: shorten_url.errors), status: :unprocessable_entity
      else
        render json: present_shorten_url(shorten_url), status: :created
      end
    end

    def destroy
      DestroyShortenUrlService.run(shorten_url: @shorten_url)
      head :no_content
    end

    def redirect
      shorten_url = FindShortenUrlByUrlService.run(url: request.original_url)
      redirect_to shorten_url.original_url
    end

    private

    def index_params
      params.permit [:page, :per_page]
    end

    def create_params
      params.permit [:url, :domain]
    end

    def present_shorten_url(shorten_url)
      ShortenUrlPresenter.present(shorten_url: shorten_url)
    end

    def set_shorten_url
      @shorten_url = FindShortenUrlByIdService.run(id: params[:id])
    end
  end
end
