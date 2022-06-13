module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |num|
      yield num, index
      index += 1
    end
  end

  def my_select
    new_array = []
    self.my_each do |num|
      if yield num
        new_array << num
      end 
    end
    return new_array
  end

  def my_all?
    true_count = 0
    self.my_each do |num|
      if yield num
        true_count += 1
      end
    end
    if true_count == self.length
      return true
    else 
      return false
    end
  end

  def my_any?
    is_true = false
    self.my_each do |num|
      if yield num
        is_true = true
      end
    end
    if is_true
      true
    else
      false
    end
  end

  def my_none?
    true_count = 0
    self.my_each do |num|
      if yield num
        true_count += 1
      end
    end
    if true_count == 0
      return true
    else 
      return false
    end
  end

  def my_count
    true_count = 0
    if block_given?
      self.my_each do |num|
        if yield num
          true_count += 1
        end
      end
      return true_count
    else
      return self.length
    end
  end

  def my_map
    new_array = []
    self.my_each do |num|
      new_array << yield(num) 
    end
    p new_array
  end

  def my_inject(init=0)
    value = init
    self.my_each do |num|
      value = yield(value, num)
    end
    return value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in self
      yield i 
    end
  end
end
