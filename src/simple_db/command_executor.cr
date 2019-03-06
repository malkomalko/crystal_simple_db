class SimpleDb::CommandExecutor
  def self.call(**args)
    self.new(**args).call
  end

  def call
    if command.is_meta?
      case execute_meta_command
      when MetaCommandResult::Success
      when MetaCommandResult::Unrecognized
        unrecognized_command_message
      end
    end
  end

  private def initialize(@command : Command)
  end

  private getter command

  private def execute_meta_command : MetaCommandResult
    if command.value == "exit"
      exit 0
    else
      MetaCommandResult::Unrecognized
    end
  end

  private def unrecognized_command_message
    puts "Unrecognized command #{command.value}"
  end

  enum MetaCommandResult
    Success
    Unrecognized
  end
end
