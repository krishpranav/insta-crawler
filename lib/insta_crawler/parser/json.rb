module InstaCrawler
    module Parser
      class Json < Base
        attr_reader :page_info, :user_id
  
        def initialize(page_info, user_id)
          @page_info = page_info
          @user_id   = user_id
        end
  
        def parsing
          begin
            end_cursor = page_info["end_cursor"][0..-3]
            url        = next_url(end_cursor, user_id)
            html       = get_json(url)
            json       = JSON.parse(html)
            @page_info = json["data"]["user"]["edge_owner_to_timeline_media"]["page_info"]
            edges      = json["data"]["user"]["edge_owner_to_timeline_media"]["edges"]
  
            loop_edges(edges)
          end while page_info["has_next_page"]
        end
  
        private
  
        def loop_edges(edges)
          edges.each do |edge|
            node = edge["node"]
            next if Config.before_date && (Config.parse_before_date < node["taken_at_timestamp"])
            check_after_time(node["taken_at_timestamp"])
            time = parse_to_date(node["taken_at_timestamp"])
  
            if node["is_video"]
              Logger.info "========VIDEO========".light_yellow
              url = node["video_url"]
              output(time, url)
              File.download(url, 'video', time)
            elsif !node["edge_sidecar_to_children"].nil?
              Logger.info "========POST========".light_magenta
              parse_post(node["edge_sidecar_to_children"]["edges"], time)
            else
              Logger.info "========PHOTO========".light_green
              url = node["display_url"]
              output(time, node["display_url"])
              File.download(url, 'photo', time)
            end
          end
        end
  
        def get_json(url)
          http = HTTP.cookies(sessionid: ENV["sessionid"])
          res = Config.proxyname ?
            http.via(Config.proxyname, Config.port).get(url) : http.get(url)
          raise Errors::HttpError, "#{res.code} #{res.reason}" if res.code != 200
          res.to_s
        end
  
        def next_url(end_cursor, user_id)
          "https://www.instagram.com/graphql/query/?query_hash=f412a8bfd8332a76950fefc1da5785ef&variables=%7B%22id%22%3A%22#{user_id}%22%2C%22first%22%3A12%2C%22after%22%3A%22#{end_cursor}%3D%3D%22%7D"
        end
      end
    end
  end
  