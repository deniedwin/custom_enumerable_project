module Enumerable
  # Your code goes here
  
  def my_each_with_index
    index = 0
    for each_element in self
      yield(each_element, index)
      index += 1
    end
  end

  def my_select
    result = []
    self.my_each do |element|
      result << element if yield(element)
    end
    return result
  end

  def my_all?
    self.my_each do |element|
      passed = yield(element)
      return false unless passed
    end
    return true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    return false
  end

  def my_none?
    self.my_each do |element|
      passed = yield(element)
      return false if passed
    end
    return true
  end

  def my_count
    count = 0
    if block_given? # this was the important key!
      self.my_each do |element|
        count += 1 if yield(element)
      end
    else
      self.my_each do |element|
        count += 1
      end
    end
    return count
  end

  def my_map
    result = []
    self.my_each do |element|
      result << yield(element)
    end
    return result
  end

  def my_inject(init)
    result = init
    if block_given?
      self.my_each do |element|
        result = yield(result, element) # this was the hard part, to know to pass 2 arguemnts in the yield
      end
    end
    return result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for each_element in self
      yield(each_element)
    end
  end
end
