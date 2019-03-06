class SimpleDb::CLI
  def initialize
  end

  def start
    while true
      prompt
      command = CommandParser.call(command: read_input)
      CommandExecutor.call(command: command)
    end
  end

  private def prompt
    print "db > "
  end

  private def read_input
    gets.to_s.strip
  end
end
