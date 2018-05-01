class BaseService
  attr_accessor :errors

  def initialize
    @errors = []
  end

  def add_unprocessable_error(message)
    @errors.push(message)
  end
end
