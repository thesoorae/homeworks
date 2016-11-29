class LRUCache
  def initialize(num)
    @num = num
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    elsif count > num
      @cache.pop
    end

      @cache.unshift(el)

  end

  def show
    p @cache
  end

  def private


end
