class SimpleDb::CLI
  def initialize
  end

  def start
    while true
      prompt
      CommandParser.call(command: read_input)
    end
  end

  private def prompt
    print "db > "
  end

  private def read_input
    gets.to_s.strip
  end
end
