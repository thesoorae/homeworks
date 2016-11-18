class Map

  def initialize(arr = [])
    @mapped_arr = arr
  end

  def assign(key, value)
    unless key_index(key).nil? || @mapped_arr.empty?
      idx = key_index(key)
      return @mapped_arr[idx][1] = value
    end
    @mapped_arr << [key, value]
  end

  def lookup(key)
    @mapped_arr[key_index(key)][1] unless key_index(key).nil?
  end

  def key_index(key)
    @mapped_arr.each_with_index do |pair, idx|
      pair_key = pair[0]
      pair_value = pair[1]
      return idx if key == pair_key
    end
    nil
  end

  def remove(key)
    idx = key_index(key)
    @mapped_arr.delete_at(idx)
  end

  def show
    @mapped_arr
  end
end
