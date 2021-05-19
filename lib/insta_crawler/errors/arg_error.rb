module InstaCrawler
    module Errors
        class ArgError < StandardError
            def initialize(message)
                super("Missing arguments: #{message}")
            end
        end
    end
end

