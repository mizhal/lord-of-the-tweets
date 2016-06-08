class TwitterGraphGenerator

	def initialize(client)
		@client = client
	end

	def track_links(pack_of_nicks)
		pack_of_nicks.each do |nick|
			@client.following(nick).each do |result|
				link = TwitterLink.find_by_first_and_second(nick, result.username)
				unless link.nil?
					link = TwitterLink.create(first: nick, second: result.username)
				end

				sleep_for_api_limit
			end
			@client.followers(nick).each do |result|
				link = TwitterLink.find_by_first_and_second(result.username, nick)
				unless link.nil?
					link = TwitterLink.create(second: nick, first: result.username)
				end

				sleep_for_api_limit
			end
		end
	end

	def sleep_for_api_limit
		sleep 3
	end

end