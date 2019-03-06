class SimpleDb::CommandExecutor
  def self.call(**args)
    self.new(**args).call
  end

  def call
    if command.is_meta?
      case execute_meta_command
      when Result::Success
      when Result::Unrecognized
        unrecognized_command_message
      end
    else
      statement, result = StatementPreparer.call(command: command)
      case result
      when Result::Success
        execute_statement(statement: statement)
      when Result::Unrecognized
        unrecognized_statement_message
      end
    end
  end

  private def initialize(@command : Command)
  end

  private getter command

  private def execute_meta_command : Result
    if command.value == "exit"
      exit 0
    else
      Result::Unrecognized
    end
  end

  private def execute_statement(statement : Statement)
    case statement.type
    when "insert"
      puts "This is where we would do an insert."
    when "select"
      puts "This is where we would do a select."
    end
    puts "Executed."
  end

  private def unrecognized_command_message
    puts "Unrecognized command #{command.value}"
  end

  private def unrecognized_statement_message
    puts "Unrecognized keyword at start of '#{command.value}'"
  end
end
