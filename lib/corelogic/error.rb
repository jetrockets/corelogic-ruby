module Corelogic
  class Error < StandardError
    attr_reader :code

    BadRequest = Class.new(self)
    Unauthorized = Class.new(self)
    Forbidden = Class.new(self)
    NotFound = Class.new(self)

    ERRORS_MAP = {
      400 => Corelogic::Error::BadRequest,
      401 => Corelogic::Error::Unauthorized,
      403 => Corelogic::Error::Forbidden,
      404 => Corelogic::Error::NotFound
    }.freeze

    private

    def self.from_response(body)
      new(body[:message], body[:status])
    end

    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end
  end
end