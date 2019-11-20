module Shorti
  class BaseService
    def self.run(*args)
      new(*args).run
    end
  end
end
