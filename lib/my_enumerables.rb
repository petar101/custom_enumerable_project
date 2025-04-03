module Enumerable

  def my_all?
    # Start by assuming everything matches (true)
    result = true
    
    # Iterate through each element using my_each
    self.my_each do |item|
      # Yield the item to the block and check its result
      unless yield(item)
        result = false
        break  # Exit early if we find any false result
      end
    end
    result
  end

  def my_any? 
    result = false

    self.my_each do |item|
      if yield(item)
        result = true 
        break
      end
    end
    result
  end

  def my_count 
    count = 0
    
  
    self.my_each do |item|
      if block_given? 
        if yield(item)
          count += 1
        end
      else 
          count += 1
      end
    end
  
    count 
  end

  def my_each_with_index
    index = 0
  
    self.my_each do |item|
      yield(item, index) if block_given?
      index += 1
    end
  
    self
  end
  
  def my_inject(starting_value)
      total = starting_value
    
      self.my_each do |item|
        total = yield(total, item)
      end
    
      total
  end

  def my_map
    result = []
  
    self.my_each do |item|
      result << yield(item)
    end
  
    result
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)  # If any item passes, return false immediately
    end
    true  # If none passed, return true at the end
  end
end


class Array
  
  def my_each
    for item in self ## every item in the object thats calling it
      ## self is the object that this method is being parsed through. 
      yield(item) ## give that statement to the block to do something with it
    end
    self #because we are altering the array, we need to call it back to the array. 
  end
  
end
