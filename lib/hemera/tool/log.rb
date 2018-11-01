module Hemera
  class << self
    def log(message)
      STDOUT.puts message
    end
  end
end