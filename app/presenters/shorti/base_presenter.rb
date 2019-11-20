module Shorti
  class BasePresenter
    def self.present(*args)
      new(*args).present
    end

    def self.present_collection(*args)
      new(*args).present_collection
    end
  end
end
