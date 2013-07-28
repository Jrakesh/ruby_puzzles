# Author :: Rakesh Jha
class Consecutive
  
  def initialize string
    # Converts Input string to array
    @@array_of_string = string.split("")
  end
  
  def max_consecutive_characters
    # Returns maximum consecutive characters    
    @@array_of_string.each_with_object([]) { |e, r| r[-1] && r[-1][0] == e ? r[-1][-1] +=1 : r << [e, 1] }
                     .sort_by{ |key, value| -value }
		     .group_by{|key, value| value}.max.flatten.reverse
                     .reject { |l| l*0==0 }
                     .uniq
  end
  
end
