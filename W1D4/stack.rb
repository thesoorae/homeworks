class Stack
  def initialize(stack=[])
    @stack = stack
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end
