module Enumerable
  # Your code goes here
  def my_all? # FIX THIS! 21-06-2025
    for elem in self
      if elem < test
        return false 
      end
      true
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
  end
end
