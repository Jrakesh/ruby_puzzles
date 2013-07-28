# Author :: Rakesh Jha
class NonaryGame

  def initialize
    ip_array = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
	# calculates of all possible subsets
    @@all_subsets = 1.upto(ip_array.length).flat_map { |n| ip_array.combination(n).to_a }
  end
  
  def valid_groups
    # filters subset array based on given conditions
    @@all_subsets.reject { |subset| !(subset.count > 2 && subset.count < 6) }
                 .reject { |subset| !(subset.include? 5) }
                 .reject { |subset| sum_of_elements(subset) != 9 }  
  end  
  
  def sum_of_elements subset
    subset_array_sum = subset.inject{|sum,x| sum + x }
	# calculates sum of all elements in a subset array recursively
    while subset_array_sum.to_s.size != 1
      subset_array_sum = subset_array_sum.inspect.split('').map(&:to_i).inject{|sum,x| sum + x }
    end
    subset_array_sum
  end
  
end
