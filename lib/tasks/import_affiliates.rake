namespace :db do
  desc "check for new affiliate partners. does NOT update existing"
  task :import_affiliates => :environment do
    require 'ruby-debug'
    require 'yaml'
    require 'open-uri'
    @feed = YAML.load(open("http://ucp.org/sandbox/activeaffiliates.cfm?apikey=#{APP_CONFIG['ucp_api']['key']}")) rescue nil

    debugger

    @feed ||= YAML.load(open("db/seeds/affiliates.yml"))
    @feed.each do |f,org|
      unless org["affiliate_name"].nil?
     a = Affiliate.find_or_create_by_org_name(org["affiliate_name"].chomp(';')) 
          a.siteid = org["affiliate_id"].chomp(';') 
          a.name_abbr = org["affiliate_name_abbr"].chomp(';')
          a.address1 = org["affiliate_address1"].value.chomp(';') unless org["affiliate_address1"].nil?
          a.city = org["affiliate_city"].chomp(';')
          a.state = org["affiliate_state"].chomp(';')  
          a.zip = org["affiliate_zip"].chomp(';')
          a.contact_first_name = org["affiliate_contact_first_name"].chomp(';').delete '~'
          a.contact_last_name = org["affiliate_contact_last_name"].chomp(';').delete '~'
          a.contact_email = org["affiliate_contact_email"].chomp(';').delete '~'
          a.phone1 = org["affiliate_phone1"].chomp(';').delete '~'
          a.phone2 = org["affiliate_phone2"].chomp(';').delete '~'
          a.tty = org["affiliate_tty"].chomp(';').delete '~'
          a.fax = org["affiliate_fax"].chomp(';').delete '~'
          a.email = org["affiliate_email"].chomp(';').delete '~'
          a.description = org["affiliate_description"].chomp(';').delete '~'
          a.metric      = org["affiliate_metric"].chomp(';').delete '~'
          a.activate    = org["affiliate_activate"].chomp(';').delete '~'
          a.public      = org["affiliate_public"].chomp(';').delete '~'
          a.region      = org["affiliate_region"].chomp(';').delete '~'
          a.province    = org["affiliate_province"].chomp(';').delete '~'
          a.country     = org["affiliate_country"].chomp(';').delete '~'
          a.aff_type        = org["affiliate_type"].chomp(';').delete '~'
          a.template    = org["affiliate_template"].chomp(';')
          a.state_ind   = org["affiliate_state_ind"].chomp(';')
          a.geocode_address
          a.save
        end
    end
  end

end