module ApplicationHelper
	#Return the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "hoandq - Sunday Monday"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
