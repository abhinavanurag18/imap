module WelcomeHelper
	def func
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

		pid="catalogId=P-mobi-84191878304-cat"

		ht.each { |key,value|
		if value==pid
			@loc.push(key)
			#the ip address corresponding to the product id now this needs to be passed either to the api we use
			#or the site we use for geolocation

		end
		}

		# puts loc
		# render :partial =>'my_partial', :locals =>{:loc => loc}
	end

end
