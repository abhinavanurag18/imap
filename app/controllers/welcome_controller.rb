class WelcomeController < ApplicationController
  def index
  	ht=Hash.new()
		@loc=[]
		ht.compare_by_identity

		File.open('sampleFile', 'r') do |f1|  
		  while line = f1.gets  
		     line.chomp!
			arr=line.split("|")
			ht[arr[1]]=arr[9]

			#note: since the logs are not product id wise same ip might surf multiple product ids but we can use a hash table as
			#there is a provision of compare by identity i.e inque key value pairs can exist

		  end 
		  end 

		@url=request.url

		session[:url] = @url
		#parse url to get catid

		catid="catalogId=P-mobi-84191878304-cat"
		@current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
			@ip=request.remote_ip
		session[:ip] = request.remote_ip

		IpAddress.create(:ip => @ip,:catid => catid,:flag => 1)
		IpAddress.create(:ip => "123.24.144.163",:catid => catid,:flag => 1)

		 @ip_adresses = IpAddress.all

		@ip_adresses.each { |address|
		 if (address.catid==catid&&address.flag==1)
			@loc.push(address.ip)
			#the ip address cs urlorresponding to the product id now this needs to be passed either to the api we use
			#or the site we use for geolocation

		 end
		}

		
  end


end
