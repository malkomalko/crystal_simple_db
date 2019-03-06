class SimpleDb::CLI
  def initialize
  end

  def start
    while true
      prompt
      command = gets.to_s.strip
      if command == ".exit"
        exit 0
      else
        puts "Unrecognized command #{command}"
      end
    end
  end

  private def prompt
    print "db > "
  end
end
