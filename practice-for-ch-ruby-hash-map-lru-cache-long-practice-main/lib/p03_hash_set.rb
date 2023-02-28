class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hashed = key.hash
    unless include?(key)
      self[hashed] << key
      @count += 1
    end 
    resize! if count > self.num_buckets
  end

  def include?(key)
    hashed = key.hash
    self[hashed].include?(key)
  end

  def remove(key)
    hashed = key.hash
    if include?(key)
      self[hashed].delete(key)
      @count -= 1
    end
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
        new_set[new_num.hash % new_set.length] << new_num
      end
    end
    @store = new_set
  end

  def [](num)
    @store[num % num_buckets]
  end
end