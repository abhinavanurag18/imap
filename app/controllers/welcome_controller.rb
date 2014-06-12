
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

		# catid="catalogId=P-mobi-84191878304-cat"
		catid=@url
		@current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
			@ip=request.remote_ip
		session[:ip] = request.remote_ip

		# IpAddress.create(:ip => @ip,:catid => catid,:flag => 1)
		# IpAddress.create(:ip => "123.24.144.163",:catid => catid)

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
		IpAddress.create(:ip => session[:ip],:catid => params[:url] ,:city => params[:city])
	end
	# city_list = [];
	# subset = IpAddress.where(:catid => params[:url])
	# @lst = IpAddress.select(:city).map(&:city).uniq
	# @lst.each do |city|
	# 	# city_list.push(city => IpAddress.where(:city => city).count)
	#  end

	city_json = [];

	city_hash = IpAddress.where(:catid => params[:url]).group(:city).count
	city_hash.each do |c,count|
		ips = IpAddress.select(:ip).find_by city: c
		# ip = "hgf"
		# city_json.push([c,count,ip])
		city_json.push([c,count.to_s,ips.ip])
	end 



	 # respond_to do |format|
  #   format.html # show.html.erb
  #   format.json  { render :json => @list.to_json }
  # end
  	if request.xhr?
    	render :json => city_json.to_json
    end
  end
  def tabclose
  	# write the logic to delete the appropriate record
  	ipi = request.remote_ip
  	IpAddress.delete_all(:ip => ipi,:catid => params[:url])
  	
  	# tab.save
  	# redirect_to welcome/index
  end



end
