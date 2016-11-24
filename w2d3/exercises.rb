def sluggish(arr)

  arr.each_with_index do |fish, idx|
    max = true
    arr.each_with_index do |fish2, idx2|
      next if idx == idx2
      max = false if fish2 > fish
    end
    return fish1 if max

  end
end

def dominant(arr)
  return arr if arr.length == 1
 mid = arr.length / 2
 arr_left = arr[0...mid]
 arr_right = arr[mid..-1]
sorted_left = dominant(arr_left)
sorted_right = dominant(arr_right)
sorted_fish = dominant_sort(sorted_left, sorted_right)
end

def dominant_sort(arr1, arr2)
  biggest_first = []
  until arr1.empty? || arr2.empty?
    first = arr1.first.length
    second = arr2.first.length
    if second >= first
      biggest_first << arr2.shift
    else
      biggest_first << arr1.shift
    end
  end
  biggest_first + arr2 + arr1
end


def clever(arr)
  longest_fish = arr.first
  longest_length = arr.first.length
  arr.each do |fish|
    longest_fish = fish if fish.length > longest_length
  end
  longest_fish
end
