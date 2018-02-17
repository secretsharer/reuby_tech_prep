def to_histogram
   inject(Hash.new(0)) { |h, x| h[x] += 1; h}
 end
end

****************************************

a = gets.strip
b = gets.strip

def make_anagrams(a, b)
  ahash = Hash.new
  a.each{|key| hash[value] += 1 if a}

    bhash = Hash.new
    b.each{|key| hash[key] += 1 if b}

end

*****************************************

require 'prime'


def prime_finder(string)
   

a = gets.strip.split("")
b = gets.strip.split("")

if a[0] == b[0]
    return 0
end

letters = a + b

letter_hash = letters.each_with_object(Hash.new(0)) { |value, hash| hash[value] += 1}
subtotal = letter_hash.select { |key, value| value == 1 || value.prime? }
deletions = subtotal.reject! { |key, value| value == 2 }

print deletions.count

##solution that passes all tests
a = gets.strip.chars
b = gets.strip.chars
len = (a+b).length
counter = 0

for i in 0..a.length-1
  b.each_with_index do |x, index|
    if x == a[i]
      counter += 1
      b.delete_at(index)
      break
    end
  end
end

print len - counter*2

end
