class SimpleDb::CommandParser
  def self.call(**args)
    self.new(**args).call
  end

  def call : Command
    if command.size > 0 && command[0] == '.'
      Command.new(is_meta: true, value: command[1..-1])
    else
      Command.new(is_meta: false, value: command)
    end
  end

  private def initialize(@command : String)
  end

  private getter command
end
