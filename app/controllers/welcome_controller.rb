
class WelcomeController < ApplicationController
  def index
  
  end

  def list
  	#getting relative path of the catalogid from the front end 
  	@urlq = params[:url]

  	#getting the record from db to test if the ip+catid combination already exists  
  	lst = IpAddress.where(ip: session[:ip],catid: @urlq)

  	
  	if lst.length==0
	IpAddress.create(:ip => session[:ip],:catid => params[:url] ,:city => params[:city],:flag => 1)
		
	end
	lst.each do |ob|
		if(ob.flag==0)
			ob.update(:flag=>1)
			ob.save
		end
	end
	
	

	city_json = [];

	city_hash = IpAddress.where(:catid => params[:url],:flag => 1).group(:city).count
	city_hash.each do |c,count|
		ips = IpAddress.select(:ip).find_by city: c
		
		city_json.push([c,count.to_s,ips.ip])
	end 



	
  	if request.xhr?
    	render :json => city_json.to_json
    end
  end
  def tabclose
  	
  	ipi = request.remote_ip
  	# IpAddress.delete_all(:ip => ipi,:catid => params[:url])
  	obj = IpAddress.where(:ip => ipi,:catid => params[:url]).first
  	obj.update(:flag => 0)
  	obj.save

  	
  	# tab.save
  	# redirect_to welcome/index
  end



end
