require 'omniauth-oauth2'
require 'net/ldap'
module OmniAuth
  module Strategies
    class Iitd < OmniAuth::Strategies::OAuth2

  option :client_options, {
    :site => 'https://oauth.iitd.ac.in',
    :authorize_url => 'https://oauth.iitd.ac.in/authorize.php',
    :token_url => 'https://oauth.iitd.ac.in/token.php'
  }
  option :authorize_options, [:access_type]
  option :scope, ['email','name']
  def request_phase
    super
  end

  def authorize_params
    super.tap do |params|
      %w[scope client_options authorize_options].each do |v|
        if request.params[v]
          params[v.to_sym] = request.params[v]
        end
      end
    end
  end

  uid { raw_info['user_id'] }

  info do
    {
      :email => raw_info['email'],
      :name => raw_info['name'],
      
    }
  end

  extra do
    {:raw_info => raw_info}
  end

  def raw_info
	
 	access_token.options[:mode] = :query
	
        
          @raw_info ||= begin
                        ri = MultiJson.decode(access_token.get("https://oauth.iitd.ac.in/resource.php?access_token=#{access_token.token}").body)
			username = ri['user_id']
			userd=getuser(username)
			ri.merge!('email' => userd[1]['mail'].first )
                        ri.merge!('name' => userd[2]['username'].first ) 
			ri.merge!('category' => userd[2]['category'].first ) 
                        ri
                      end
        
  end

def getuser(username)
	ldap = Net::LDAP.new(
    host: 'ldap1.iitd.ac.in',    # Thankfully this is a standard name
	:base =>         "DC=iitd,DC=ernet,DC=in",    
 
  )
	

     userd =  ldap.search(
      
      :filter =>       Net::LDAP::Filter.eq("uid", username),
     :attributes =>   [ "uid","username","mail","category"],
      :return_result => true
    	)
	userd
end 

end
  end
end
