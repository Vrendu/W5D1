class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # self.each {|ele| ele.object_id * 57}
    mid = self.length/2
    return 42 if self.empty?
    self[mid]
  end
end

class String
  def hash
    mid = self.length/2
    return 42 if self.empty?
    self[mid].object_id
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end