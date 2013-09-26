RubyPuzzles
============

 * This repository contains three ruby puzzles. 
 * Problem statements are in the README.md file within corresponding problem folder. 
 * Try them once without taking help from the provided solutions. 

######## Have fun !!


## Usage/Instructions

 * I have used Fedora17 OS for solving these problems. 

###### Note:-
 * Problem-2 is related with parsing of a CSV file. While running test, it generates one error in country
_ip_test.rb file.

 ```erb
  Errno::ENONT: No such file or directory - md5 -q IpToCountry.csv
 ```

 * The following command mentioned in country_ip_test.rb file in problem_2 is not working as 'md5' command is not available for linux.
 
 ```erb
 `md5 -q IpToCountry.csv`.strip 
 ```
 
 * Please replace line-27 in country_ip_test.rb file of problem_2 with the following two lines to remove the error mentioned above.
 
 ```erb
  require 'digest/md5'
  assert_equal '22620fdd50ebaef84dd3d9521beb6a7c', Digest::MD5.hexdigest(File.read(Dir.pwd+"/IpToCountry.csv"))
 ```
