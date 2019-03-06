class SimpleDb::CLI
  def initialize
  end

  def start
    while true
      prompt
      parse_command(command: read_input)
    end
  end

  private def parse_command(command)
    if command == ".exit"
      exit 0
    else
      unrecognized_command_message(command: command)
    end
  end

  private def prompt
    print "db > "
  end

  private def read_input
    gets.to_s.strip
  end

  private def unrecognized_command_message(command)
    puts "Unrecognized command #{command}"
  end
end
