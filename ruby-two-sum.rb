numbers = [2, 6, 4, 8, 8, 9]
sum     = ARGV.empty? ? 10 : ARGV.first.to_i

def sum_exists(numbers, sum)
  Array(numbers).combination(2).find_all { |x, y| x + y == sum } || []
end

result = sum_exists(numbers, sum)

puts "given this array: #{numbers.inspect}"
puts "#{result.size} pairs add up to #{sum}: #{result.inspect}"

def better_two_sum(num_array, target_sum)
  num_hash = num_array.each_with_index.(Hash.new(0)) { |k,v| k[index], v[value]}
 end
 target_array = []
  num_hash.each do |k,v v|
   diff = target_sum - key[value][i]
    if num_hash.has_value?(diff)
      target_array << value, diff
    end
      return target_array
end
