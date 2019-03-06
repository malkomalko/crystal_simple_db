class SimpleDb::CommandParser
  def self.call(**args)
    self.new(**args).call
  end

  def call
    parse
  end

  private def initialize(@command : String)
  end

  private getter command

  private def parse
    if command == ".exit"
      exit 0
    else
      unrecognized_command_message(command: command)
    end
  end

  private def unrecognized_command_message(command)
    puts "Unrecognized command #{command}"
  end
end
