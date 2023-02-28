class MaxIntSet
attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @store.length
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count += 1
    end 
    resize! if count > self.num_buckets
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_set = Array.new(self.num_buckets * 2) {Array.new}
    @store.each do |bucket|
      until bucket.empty?
        new_num = bucket.pop 
        new_set[new_num % new_set.length] << new_num
      end
    end
    @store = new_set
  end

  def [](num)
    @store[num % @store.length]
  end
end