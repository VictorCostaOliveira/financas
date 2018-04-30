class BaseService
  attr_accessor :errors

  def initialize
    @errors = []
  end
end
