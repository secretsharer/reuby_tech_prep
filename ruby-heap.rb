n = gets.strip.to_i
a = Array.new(n)
min_heap = []
max_heap = []

def balanced?(array1, array2)
  (array1.length - array2.length).abs <= 1
end

def get_parent(index)
  return nil if index == 0
  (index - 1) / 2
end

def get_child(index, heap, &prc)
  left = index * 2 + 1
  return nil if left >= heap.length
  right = index * 2 + 2
  return left if right >= heap.length
  prc.call(heap[left], heap[right]) <= 0 ? left : right
end

def insert(value, heap, &prc)
  index = heap.length
  heap << value
  parent_index = get_parent(index)
  return heap if parent_index.nil?

  until prc.call(heap[parent_index], heap[index]) <= 0
    heap[parent_index], heap[index] = heap[index], heap[parent_index]
    index = parent_index
    parent_index = get_parent(index)
    return heap if parent_index.nil?
  end
  heap
end

def peek(heap)
  heap[0]
end

def pop(heap, &prc)
  return nil if heap.empty?
  heap[0], heap[-1] = heap[-1], heap[0]
  popped = heap.pop
  index = 0
  child_index = get_child(index, heap, &prc)
  return popped if child_index.nil?

  until prc.call(heap[index], heap[child_index]) <= 0
    heap[index], heap[child_index] = heap[child_index], heap[index]
    index = child_index
    child_index = get_child(index, heap, &prc)
    return popped if child_index.nil?
  end
  popped
end

for a_i in (0..n-1)
  a[a_i] = gets.strip.to_i
end

min_proc = Proc.new { |x, y| x <=> y }
max_proc = Proc.new { |x, y| y <=> x }

count = 0
a.each do |num|

  # cover first two cases
  count += 1
  if min_heap.empty? && max_heap.empty?
    min_heap << num
  else
    if num > peek(min_heap)
      insert(num, min_heap, &min_proc)
    else
      insert(num, max_heap, &max_proc)
    end
    unless balanced?(min_heap, max_heap)
      if min_heap.length > max_heap.length
        insert(pop(min_heap, &min_proc), max_heap, &max_proc)
      else
        insert(pop(max_heap, &max_proc), min_heap, &min_proc)
      end
    end
  end

  if count.odd?
    puts min_heap.length > max_heap.length ? peek(min_heap).round(1) : peek(max_heap).round(1)
  else
    puts(((peek(max_heap) + peek(min_heap)) / 2.0).round(1))
  end
end
