require "./statement"

class NullStatement < Statement
  def initialize
    super(type: "null")
  end
end
