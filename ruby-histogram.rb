def to_histogram
   inject(Hash.new(0)) { |h, x| h[x] += 1; h}
 end
end

a = gets.strip
b = gets.strip

def make_anagrams(a, b)
  ahash = Hash.new
  a.each{|key| hash[value] += 1 if a}

    bhash = Hash.new
    b.each{|key| hash[key] += 1 if b}

end
