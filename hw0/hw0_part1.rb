# Define a method sum which takes an array of integers as an argument 
# and returns the sum of its elements. 
# For an empty array it should return zero.

def sum(array)
    return 0 if array.empty?
    array.reduce(:+)
end

# Define a method max_2_sum which takes an array of integers as an argument 
# and returns the sum of its two largest elements. 
# For an empty array it should return zero. 
# For an array with just one element, it should return that element.

def max_2_sum(array)
    return 0 if array.empty?
    return array[0] if array.length == 1
    sorted  = array.sort
    sorted[-1] + sorted[-2]
end

# Define a method sum_to_n? which takes an array of integers and an additional 
# integer, n, as arguments and 
# returns true if any two distinct elements in the array of integers sum to n. 
# An empty array or single element array should both return false

def sum_to_n?(array, n)
    return false if array.empty? || array.length == 1

    (0...array.length).each { |x| 
        (x+1...array.length).each { |y| 
            return true if array[x] + array[y] == n}
    }
    return false
end

raise 'sum([]) != 0' unless sum([]) == 0
raise 'sum([1, 2, 3, 4]) != 10' unless sum([1, 2, 3, 4]) == 10
raise 'sum([1, 2, 3]) != 6' unless sum([1, 2, 3]) == 6

raise 'max_2_sum([]) != 0' unless max_2_sum([]) == 0
raise 'max_2_sum([1]) != 1' unless max_2_sum([1]) == 1
raise 'max_2_sum([1, 2, 3, 4]) != 7' unless max_2_sum([]) == 0
raise 'max_2_sum([1, 2, 3]) != 5' unless max_2_sum([1, 2, 3]) == 5

raise 'sum_to_n?([], 2) != false' unless sum_to_n?([], 2) == false
raise 'sum_to_n?([1], 2) != false' unless sum_to_n?([1], 2) == false
raise 'sum_to_n?([1, 2, 3, 4], 5) != true' unless sum_to_n?([1, 2, 3, 4], 5) == true

