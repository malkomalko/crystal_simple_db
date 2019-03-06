struct Command
  getter is_meta
  getter value

  def initialize(@is_meta : Bool, @value : String)
  end

  def is_meta?
    is_meta
  end
end
