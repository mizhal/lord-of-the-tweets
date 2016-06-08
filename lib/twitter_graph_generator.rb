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
			end
			@client.followers(nick).each do |result|
				link = TwitterLink.find_by_first_and_second(result.username, nick)
				unless link.nil?
					link = TwitterLink.create(second: nick, first: result.username)
				end
			end
		end
	end

end