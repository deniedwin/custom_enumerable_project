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
