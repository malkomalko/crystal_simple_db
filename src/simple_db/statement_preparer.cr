class SimpleDb::StatementPreparer
  def self.call(**args)
    self.new(**args).call
  end

  def call : Tuple(Statement, Result)
    prepare
  end

  private def initialize(@command : Command)
  end

  private getter command

  private def prepare
    statement_type = VALID_STATEMENTS.find do |statement|
      command.value.starts_with?(statement)
    end

    if statement_type
      {Statement.new(type: statement_type), Result::Success}
    else
      {NullStatement.new, Result::Unrecognized}
    end
  end

  VALID_STATEMENTS = ["insert", "select"]
end
