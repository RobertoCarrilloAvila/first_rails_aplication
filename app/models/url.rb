class Url < ActiveRecord::Base

	validates :long_url, format: { with: /\A(http:)/}
	before_create :gen_short_url

	def int_click_count!
		update(click_count: click_count+1)
	end

	def gen_short_url
		uri = URI(self.long_url)
		short=""
		(1..5).each { short += ("a".."z").to_a.sample }
		# puts "#{short}"
		self.short_url = uri.host+"-"+short
	end

end
