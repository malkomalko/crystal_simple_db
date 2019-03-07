require "./statement"

class SimpleDb::NullStatement < SimpleDb::Statement
  def initialize
    super(type: "null")
  end
end
