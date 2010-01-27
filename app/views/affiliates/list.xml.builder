xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
xml.affiliates(:type => "array") { 
  @affiliates.each do |a|
    xml.affiliate { 
      xml.org_name          a.org_name
      xml.url               a.url
      xml.address1          a.address1
      xml.address2          a.address2
      xml.city              a.city
      xml.state             a.state
      xml.zip               a.zip
      xml.phone1            a.phone1
      xml.tty               a.tty
      xml.fax               a.fax
      xml.email             a.email
      xml.description       a.description
      a.events.each do |event|
        xml.event {
          xml.name     event.name
          xml.url      event.url
          xml.date     event.date
          xml.location event.location
        }
      end
    }
  end

}
