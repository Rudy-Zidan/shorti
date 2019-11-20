module Shorti
  class ValidationErrorPresenter < BasePresenter
    def initialize(errors: [])
      @errors = errors
    end

    def present
      {
        errors: @errors.each_with_object([]) do |(field, message), collection|
          collection << {
            field: field,
            message: message
          }
        end
      }
    end
  end
end
