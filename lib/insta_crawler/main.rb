module InstaCrawler
    class Main
        def self.run
            Logger.info text_to_ASCII.light_red
            Logger.info "Running Insta-crawler v#{InstaCrawler::VERSION}\n"
            start_time = Time.now
            File.mkdir
            parse_info, user_id = Parser::Html.new(Config.base_url).parsing
            end_time  = Time.now
            Logger.info "\nSuccess, all files has been downloaded!".light_green
        end

        private

        def self.text_to_ASCII
            <<~USAGE.freeze

            INSTA CRAWLER
            USAGE
        end
    end
end
