# Author :: Rakesh Jha
class CountryIp
  
  def initialize
    # Reads the CSV file
    require 'csv' 
    @@csv_data = CSV.open(Dir.pwd+"/IpToCountry.csv", "r:windows-1250", :quote_char => "|")
  end
  
  def search ip_string
    # Search logic for country name
    require 'ipaddr'
    IPAddr.new ip_string
    ip_input = ip_to_num ip_string
    string_data = @@csv_data.map {|row| row.map {|cell| cell.to_s } }
    chash = country_hash string_data
    cname = find_country_name chash,ip_input
  end

  def country_hash string_data
    # Forms a hash of ip_addresses and country names
    country_hash={} 
    string_data[239..string_data.count].each{|row| 
      map_ip_from=row[0].split("\"")[1]
      map_ip_to=row[1].split("\"")[1]
      map_name=row[6].split("\"")[1]
      country_hash.merge!([map_ip_from.to_i,map_ip_to.to_i] => map_name )
    }
    country_hash
  end
 
  def ip_to_num ip
    # Converts ip-address to number
    arr = ip.split('.')
    integer_ip =   (16777216 * arr[0].to_i) + (65536 * arr[1].to_i)+ (256 * arr[2].to_i)+arr[3].to_i
  end

  def find_country_name country_hash,ip_input
    # Finds relevant country name
    result = ""
    country_hash.each_pair do |k,v|
      result = v if((k[0]..k[1]).include?(ip_input.to_i))
    end
    result
  end
end
