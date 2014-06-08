class ImapSession < ActiveRecord::Base
	def new_entry(ip,flag)
		p = ImapSession.create(ip: ip,flag: flag)
		
	end
end
