class TwitterControl

	attr_reader :client

	def initialize
		open_config

		@client = Twitter::REST::Client.new do |config|
			config.consumer_key = @config["twitter-api"]["consumer_key"]
			config.consumer_secret = @config["twitter-api"]["consumer_secret"] 
			config.access_token = @config["twitter-api"]["access_token"]
			config.access_token_secret = @config["twitter-api"]["access_token_secret"]
		end
	end

	def open_config
		conf_file = File.join(Rails.root, "config", "twitter-api.yml")
		@config = YAML.load(open(conf_file){|f| f.read})
	end
end