module Shorti
  class NotFoundErrorPresenter < BasePresenter
    def initialize(msg:)
      @msg = msg
    end

    def present
      {
        error: @msg
      }
    end
  end
end
