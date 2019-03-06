class SimpleDb::CLI
  def initialize
  end

  def start
    while true
      prompt
      command = read_input
      if command == ".exit"
        exit 0
      else
        unrecognized_command_message(command: command)
      end
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
