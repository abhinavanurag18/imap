
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
		# catid=Catalog.find(:url)
		# @city=request.location.city

		catid="catalogId=P-mobi-84191878304-cat"
		@current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
			@ip=request.remote_ip
		session[:ip] = request.remote_ip

		# IpAddress.create(:ip => @ip,:catid => catid,:flag => 1)
		# IpAddress.create(:ip => "123.24.144.163",:catid => catid,:flag => 1)

		 @ip_adresses = IpAddress.all

		@ip_adresses.each { |address|
		 if (address.catid==catid&&address.flag==1)
			@loc.push(address.ip)
			#the ip address cs urlorresponding to the product id now this needs to be passed either to the api we use
			#or the site we use for geolocation

		 end
		}
		@list = IpAddress.all
		
  end

  def list
  	@urlq = params[:url]

  	# @data = request.body.read
   #  @data.each do |dataElement|
   #    @urlq = dataElement['url']
      
   #  end
  	@list = IpAddress.where(ip: session[:ip],catid: @urlq)
  	# @lst = ("h"=>"hiii")
  	if @list.length==0
		IpAddress.create(:ip => session[:ip],:catid => params[:url] ,:city => params[:city], :flag => 1)
	end

	@lst = IpAddress.where(catid: @urlq)


	 # respond_to do |format|
  #   format.html # show.html.erb
  #   format.json  { render :json => @list.to_json }
  # end
  	if request.xhr?
    	render :json => @lst.to_json
    end
  end
  def tabclose
  	# write the logic to delete the appropriate record
  	ipi = request.remote_ip
  	IpAddress.delete_all(:ip => ipi )
  	
  	# tab.save
  	# redirect_to welcome/index
  end



end
