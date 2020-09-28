class LinkedList
  include Enumerable

  attr_reader :tail, :head
  attr_writer :head


  def initialize(head, tail = nil)
    @head, @tail = head, tail
  end

  def <<(item)
    LinkedList.new(item, self)
  end

  def inspect
    [@head, @tail].inspect
  end

  def each(&block)
    if block_given?
      block.call(@head)
      @tail.each(&block) if @tail
    else
      to_enum(:each)
    end
  end

  def [](n)
  	if n < self.count
  		item = self
  		for i in 0..n-1 do
  			item = item.tail
  		end
  		return item.head
  	else
  		return nil
  	end
  end

  def []=(n, value)
  	if n < self.count
  		item = self
  		for i in 0..n-1 do
  			item = item.tail
  		end
  		item.head = value
  	else
  		return nil
  	end
  end

end

l_l = LinkedList.new(4) << 5 << 6


puts l_l.map { |el| puts el }

puts l_l.count

puts l_l.sum

puts l_l.max

puts l_l.[](1)

l_l.[]=(0,5)

puts l_l.map { |el| puts el }
